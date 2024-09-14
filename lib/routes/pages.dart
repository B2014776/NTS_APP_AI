
import 'package:apptestai/routes/routes.dart';
import 'package:apptestai/views/profile/edit_account/di/edit_account_binding.dart';
import 'package:apptestai/views/profile/edit_account/presentation/page/edit_account_page.dart';
import 'package:get/get.dart';

class Pages {
  static final routes = [
    GetPage(
      name: Routes.editAccount,
      page: () => const EditAccountPage(),
      binding: EditAccountBinding(),
    ),
  ];
}