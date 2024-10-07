import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../main_export.dart';

class HomeAppBar extends StatelessWidget {
   HomeAppBar(
      {super.key,
      required this.menuOnTap,
      required this.notifyOnTap,
      required this.name,
      required this.organisationName});

  final VoidCallback menuOnTap;
  final VoidCallback notifyOnTap;
  final String name;
  final String organisationName;
 final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      var max = cons.maxWidth;
      return SizedBox(
        height: 250,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ConstantColor.primary,
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        _gitHub(),
                        const SizedBox(height: 16),
                        Text(
                         "Hi  $name",
                          style: GetTextStyle.styleS18W500White,
                        ),
                        const SizedBox(height: 72),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if(controller.selectedOrganization!=null)
            Positioned(
              bottom: 0,
              child: GetBuilder<HomeController>(
                builder: (context) {
                  return SizedBox(
                    width: max * 0.9,
                    child: const OrganizationCard(),
                  );
                }
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _gitHub() {
    return Row(
      children: [
        InkWell(
          onTap: menuOnTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              SvgPath.menu,
              width: 20,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "Github",
            style: GetTextStyle.styleS18W500White,
          ),
        ),
        InkWell(
          onTap: notifyOnTap,
          child: SvgPicture.asset(
            SvgPath.notification,
            width: 16,
            height: 16,
          ),
        ),
      ],
    );
  }
}

class OrganizationCard extends GetView<HomeController> {
  const OrganizationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(minHeight: 108),
      decoration: BoxDecoration(
          color: ConstantColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: ConstantColor.textColor.withOpacity(0.1),
                blurRadius: 12,
                spreadRadius: 9,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBoxBorder(
            child: SvgPicture.asset(
              SvgPath.organization,
              width: 20,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 controller.selectedOrganization!.login ,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GetTextStyle.styleS16W500TextColor,
                ),
                const SizedBox(height: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: ConstantColor.skyBlue,
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    "VGTS ",
                    style:
                        GetTextStyle.styleS14W500White?.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
