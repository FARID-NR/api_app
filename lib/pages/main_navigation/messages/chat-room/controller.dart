import 'dart:io';

import 'package:api_app/common/apis/chat.dart';
import 'package:api_app/common/entities/entities.dart';
import 'package:api_app/common/entities/msg.dart';
import 'package:api_app/common/routes/names.dart';
import 'package:api_app/common/store/user.dart';
import 'package:api_app/common/widgets/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'index.dart';

class ChatRoomController extends GetxController with GetSingleTickerProviderStateMixin{
  ChatRoomController();
  
  final state = ChatRoomState();
  late String doc_id;
  final myInputController = TextEditingController();
  // Get the User or Sender's token
  final token = UserStore.to.profile.token;

  // Firebase data instance
  final db = FirebaseFirestore.instance;
  var listener;
  var isLoadmore = true;
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  ScrollController myScrollController = ScrollController();

  void goMore(){
    state.more_status.value = state.more_status.value ? false : true;
  }

  void audioCall(){
    state.more_status.value = false;
    Get.toNamed(AppRoutes.VoiceCall,
      parameters: {
        "to_token" : state.to_token.value,
        "to_name" : state.to_name.value,
        "to_avatar" : state.to_avatar.value,
        "call_role": "anchor",
        "doc_id" : doc_id
      }
    );
  }

    void videoCall(){
    state.more_status.value = false;
    Get.toNamed(AppRoutes.VideoCall,
      parameters: {
        "to_token" : state.to_token.value,
        "to_name" : state.to_name.value,
        "to_avatar" : state.to_avatar.value,
        "call_role": "anchor",
        "doc_id" : doc_id
      }
    );
  }

  @override
  void onInit(){
    super.onInit();
    print('This is onInit');
    var data = Get.parameters;
    print(data);
    doc_id = data['doc_id']!;
    state.to_token.value = data['to_token']??"";
    state.to_name.value = data['to_name']??"";
    state.to_avatar.value = data['to_avatar']??"";
    state.to_online.value = data['to_online']??"1";
    // clearning red dots
    clearMsgNum(doc_id);
  }

  Future<void> clearMsgNum(String doc_id) async {

    var messageResult = await db.collection("message").doc(doc_id).withConverter(
      fromFirestore: Msg.fromFirestore, 
      toFirestore: (Msg msg, options) => msg.toFirestore()
    ).get();

    // to know if we have any unread messages or calls
    if(messageResult.data() != null){
      var item = messageResult.data()!;
      int to_msg_num = item.to_msg_num == null ? 0 : item.to_msg_num!;
      int from_msg_num = item.from_msg_num == null ? 0 : item.from_msg_num!;
      // This your Phone
      if (item.from_token == token){
        to_msg_num = 0;
      } else {
        from_msg_num = 0;
      }
      await db.collection("message")
      .doc(doc_id)
      .update({
        "to_msg_num" : to_msg_num,
        "from_msg_num" : from_msg_num,
      });
    }
  }



  @override
  void onReady(){
    super.onReady();
    print('This is onReady');
    state.msgcontentList.clear();
    final messages = db.collection("message")
                    .doc(doc_id)
                    .collection("msglist")
                    .withConverter(
                      fromFirestore: Msgcontent.fromFirestore, 
                      toFirestore: (Msgcontent msg, options) => msg.toFirestore()
                    ).orderBy("addtime", descending: true).limit(15);
    listener = messages.snapshots().listen((event) {
      
      List<Msgcontent> temgMsgList = <Msgcontent>[];
      for(var change in event.docChanges){
        switch(change.type){
          
          case DocumentChangeType.added:
            // TODO: Handle this case.
            if(change.doc.data() != null){
              temgMsgList.add(change.doc.data()!);
              print("${change.doc.data()!}");
              print(".... newlay added ${myInputController.text}");
            }
            break;
          case DocumentChangeType.modified:
            // TODO: Handle this case.
            break;
          case DocumentChangeType.removed:
            // TODO: Handle this case.
            break;
        }
      }
      // 4, 3, 2, 1,  // 1, 2, 3, 4

        temgMsgList.reversed.forEach((element) {
          state.msgcontentList.value.insert(0, element);
        });

        state.msgcontentList.refresh();

        SchedulerBinding.instance.addPostFrameCallback((_) {
          if(myScrollController.hasClients){
          print('has clients');
          myScrollController.animateTo(
            // points to the very top of your list
            // Lowest index // 0
            myScrollController.position.minScrollExtent, 
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut);
          }
        });
          
    });

    myScrollController.addListener(() {
      if((myScrollController.offset+10)> (myScrollController.position.maxScrollExtent)){
        if(isLoadmore){
          state.isloading.value = true;
          // to stop unnecessary request to firebase
          isLoadmore = false;
          asyncLoadMoreData();
          print('.... loading ....');
        }
      }
    });

  }

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      _photo = File(pickedFile.path);
      uploadFile();
    }else {
      print('No Image Selected');
    }
  }

  Future uploadFile() async {
    var result = await ChatAPI.upload_img(file: _photo);
    print(result.data);
    if(result.code == 0){
      sendImageMessage(result.data!);
    }else{
      toastInfo(msg: "Sending image error");
    }
  }

   Future<void> sendMessage() async {

    String sendContent = myInputController.text;
    // print('.... $sendContent ....');
    if(sendContent.isEmpty){
      toastInfo(msg: "Content is Empty");
      return;
    }
    // Created an object to send to firebase
    final content = Msgcontent(
      token: token,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now()
    );

    await db.collection("message").doc(doc_id).collection("msglist")
    .withConverter(
      fromFirestore: Msgcontent.fromFirestore,
      toFirestore: (Msgcontent msg, options) => msg.toFirestore()
    ).add(content).then((DocumentReference doc) {
      // print('.... base id is ${doc_id} .... new message doc id ${doc.id}');
      myInputController.clear();
    });


    // collection().get().docs.data()
    var messageResult = await db.collection("message").doc(doc_id).withConverter(
      fromFirestore: Msg.fromFirestore, 
      toFirestore: (Msg msg, options) => msg.toFirestore()
    ).get();


    // to know if we have any unread messages or calls
    if(messageResult.data() != null){
      var item = messageResult.data()!;
      int to_msg_num = item.to_msg_num == null ? 0 : item.to_msg_num!;
      int from_msg_num = item.from_msg_num == null ? 0 : item.from_msg_num!;
      if (item.from_token == token){
        from_msg_num = from_msg_num + 1;
      } else {
        to_msg_num = to_msg_num + 1;
      }
      await db.collection("message")
      .doc(doc_id)
      .update({
        "to_msg_num" : to_msg_num,
        "from_msg_num" : from_msg_num,
        "last_msg" : sendContent,
        "last_time" : Timestamp.now()
      });
    }
  }

  Future<void> asyncLoadMoreData() async {
    final messages = await db.collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
          fromFirestore: Msgcontent.fromFirestore,
          toFirestore: (Msgcontent msg, options) => msg.toFirestore()
        ).orderBy("addtime", descending: true).where(
          'addtime', isLessThan: state.msgcontentList.value.last.addtime
        ).limit(10).get();

        if(messages.docs.isNotEmpty){
          messages.docs.forEach((element) {
            var data = element.data();
            state.msgcontentList.value.add(data);
          });
          print(state.msgcontentList.value.length);
        }

        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          isLoadmore = true;
        });
        state.isloading.value = false;
  }

  Future<void> sendImageMessage(String url) async {

    // Created an object to send to firebase
    final content = Msgcontent(
      token: token,
      content: url,
      type: "image",
      addtime: Timestamp.now()
    );

    await db.collection("message").doc(doc_id).collection("msglist")
    .withConverter(
      fromFirestore: Msgcontent.fromFirestore,
      toFirestore: (Msgcontent msg, options) => msg.toFirestore()
    ).add(content).then((DocumentReference doc) {
      // print('.... base id is ${doc_id} .... new image doc id ${doc.id}');
      myInputController.clear();
    });


    // collection().get().docs.data()
    var messageResult = await db.collection("message").doc(doc_id).withConverter(
      fromFirestore: Msg.fromFirestore, 
      toFirestore: (Msg msg, options) => msg.toFirestore()
    ).get();


    // to know if we have any unread messages or calls
    if(messageResult.data() != null){
      var item = messageResult.data()!;
      int to_msg_num = item.to_msg_num == null ? 0 : item.to_msg_num!;
      int from_msg_num = item.from_msg_num == null ? 0 : item.from_msg_num!;
      if (item.from_token == token){
        from_msg_num = from_msg_num + 1;
      } else {
        to_msg_num = to_msg_num + 1;
      }
      await db.collection("message")
      .doc(doc_id)
      .update({
        "to_msg_num" : to_msg_num,
        "from_msg_num" : from_msg_num,
        "last_msg" : "{image}",
        "last_time" : Timestamp.now()
      });
    }
  }

  void closeAllPop() async {
    Get.focusScope?.unfocus();
    state.more_status.value = false;
  }

  @override
  void onClose(){
    super.onClose();
    listener.cancel();
    myInputController.dispose();
    myScrollController.dispose();
    clearMsgNum(doc_id);
  }
}