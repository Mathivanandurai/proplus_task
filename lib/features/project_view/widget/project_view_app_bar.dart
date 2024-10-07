import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proplus_task/components/custom_widgets/custom_image.dart';
import 'package:proplus_task/utils/date_helper.dart';
import '../../../main_export.dart';
import '../../../model/repository_response.dart';

class ProjectViewAppBar extends StatelessWidget {
  const ProjectViewAppBar({super.key, required this.model});

  final RepositoryResponse model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      color: ConstantColor.primary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(SvgPath.arrowLeft),
                  ),
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Project",
                    style: GetTextStyle.styleS18W500White,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: ConstantColor.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: CustomImageCard(
                    imageUrl: model.owner.avatarUrl,
                    width: 25,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: GetTextStyle.styleS14W500White
                          ?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      model.owner.login,
                      style: GetTextStyle.styleS14W400GreyE1E2FF,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              "Last update : ${DateUtil.dateMonthYearSlash(model.updatedAt)}",
              style: GetTextStyle.styleS14W400GreyE1E2FF
                  ?.copyWith(color: ConstantColor.greyF6F5FE),
            ),
          ],
        ),
      ),
    );
  }
}
