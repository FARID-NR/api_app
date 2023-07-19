import 'package:get/get.dart';

import 'index.dart';

class KonsultasiBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<KonsultasiController>(() => KonsultasiController());
  }
}