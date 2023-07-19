import 'package:api_app/common/entities/base.dart';
import 'package:api_app/common/entities/entities.dart';
import 'package:api_app/common/utils/http.dart';
import 'package:flutter/widgets.dart';

// class UserAPI {
//   static Future<UserLoginResponseEntity> Login({
//     LoginRequestEntity? params,
//   }) async {
//     var response = await HttpUtil().post(
//       'api/login',
//       queryParameters: params?.toJson(),
//     );
//     return UserLoginResponseEntity.fromJson(response);
//   }

//   static Future<BaseResponseEntity> UpdateProfile({
//     LoginRequestEntity? params,
//   }) async {
//     var response = await HttpUtil().post(
//       'api/update_profile',
//       queryParameters: params?.toJson()
//     );
//     return BaseResponseEntity.fromJson(response);
//   }
// }

class UserAPI {
  static Future<UserLoginResponseEntity> Login({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> UpdateProfile({
    LoginRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/update_profile',
      queryParameters: params?.toJson()
    );
    return BaseResponseEntity.fromJson(response);
  }
}