import 'package:get/get.dart';

import '../../../common/entities/country.dart';

class SignUpState {
  RxString username = "".obs;
  RxString email = "".obs;
  RxString password = "".obs;
  RxString checkpassword = "".obs;
  RxString verifycode = "".obs;
  var choose_index = 0.obs;
  var choose_index_flag = "🇦🇫".obs;
  var choose_index_dialCode = "+93".obs;
  var phone_number = "".obs;
  RxList<Country> CountryList = RxList<Country>();
}