import 'package:get/get.dart';

import 'index.dart';

class DetailProdukBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DetailProdukController>(() => DetailProdukController());
  }
}