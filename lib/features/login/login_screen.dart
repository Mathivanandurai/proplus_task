import 'package:get/get.dart';
import 'package:proplus_task/controller/login_controller.dart';

import '../../main_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: _bottomButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.04),
              FittedBox(
                child: Image.asset(
                  ImagePath.gitHub,
                  width: 203,
                  height: 83,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              FittedBox(
                child: Image.asset(
                  ImagePath.system,
                  width: 240,
                  height: 220,
                ),
              ),
              const SizedBox(height: 40),
              FittedBox(
                child: Text(
                  "Lets built from here ...",
                  style: GetTextStyle.styleS20W500Black,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                "Our platform drives innovation with tools that boost developer velocity",
                textAlign: TextAlign.center,
                style: GetTextStyle.styleS16W400Primary5f60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          child: SizedBox(
            width: 300,
            child: ElevatedButton(
                onPressed: () async {
                  controller.signInWithFirebase(context).then((_) {
                    if (controller.isSuccess) {
                      Get.offAllNamed(RouteName.home);
                    }
                  });
                },
                child: Text(
                  "Sign in with Github",
                  style: GetTextStyle.styleS14W500White,
                )),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
