import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:proplus_task/components/custom_widgets/custom_image.dart';
import 'package:proplus_task/controller/home_controller.dart';
import 'package:proplus_task/utils/enum.dart';
import 'package:proplus_task/utils/shared_preferences.dart';

import '../../../main_export.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  HomeController controller = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.callGetOrganization();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: ConstantColor.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: GetBuilder<HomeController>(builder: (context) {
            if (controller.orgApiState == ApiState.loading) {
              return const CustomProgressIndicator();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RepoUserCard(),
                SizedBox(
                  height: size.height * 0.1,
                ),
                ListView.separated(
                  itemCount: controller.orgList.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var tempModel = controller.orgList[index];
                    return RepoNameCards(
                      title: tempModel.login,
                      onTap: () {
                        controller.key.currentState!.closeDrawer();
                        controller.selectOrganization(tempModel);
                      },
                      child: CustomImageCard(
                        width: 22,
                        imageUrl: tempModel.avatarUrl,
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
                const SizedBox(height: 15),
                RepoNameCards(
                  title: 'Log out',
                  onTap: () async {
                    await SharedPreferenceHelper.shared.clear();
                    Get.offAllNamed(RouteName.login);
                  },
                  child: SvgPicture.asset(
                    SvgPath.logOut,
                    width: 20,
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

class RepoUserCard extends GetView<HomeController> {
  const RepoUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 15),
        Image.asset(ImagePath.repo),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "REPO NAME",
              style: GetTextStyle.styleS16W500TextColor,
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: ConstantColor.orange,
                  borderRadius: BorderRadius.circular(7)),
              child: Text(
                controller.ownerName,
                style: GetTextStyle.styleS18W500White?.copyWith(
                  fontSize: 12,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class RepoNameCards extends StatelessWidget {
  const RepoNameCards(
      {super.key,
      required this.child,
      required this.title,
      required this.onTap});

  final Widget child;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomBoxBorder(
            child: child,
          ),
          SizedBox(width: 12),
          Text(
            title,
            style: GetTextStyle.styleS16W500TextColor?.copyWith(
              color: ConstantColor.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
