import 'package:get/get.dart';

class CustomSnackBar {
  static bottomSnackBar(String title) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: "   ",
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
