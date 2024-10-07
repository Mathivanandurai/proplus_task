import 'package:get/get.dart';
import 'package:proplus_task/utils/shared_preferences.dart';

import '../../main_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              child: Image.asset(
                ImagePath.gitHub,
                width: 203,
                height: 83,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _navigation() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (await SharedPreferenceHelper.shared.getAccessToken() != null &&
        await SharedPreferenceHelper.shared.getAccessToken() != "") {
      Get.offAllNamed(RouteName.home);
    } else {
      Get.offAllNamed(RouteName.login);
    }
  }
}
