

import 'package:apptestai/views/profile/edit_account/presentation/controller/edit_account_controller.dart';
import 'package:get/get.dart';

class EditAccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>EditAccountController());
  }
}