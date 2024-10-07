import 'package:get/get.dart';
import 'package:proplus_task/controller/project_view_controller.dart';
import 'package:proplus_task/features/project_view/widget/project_view_app_bar.dart';
import 'package:proplus_task/features/project_view/widget/project_view_list_tile.dart';
import 'package:proplus_task/features/project_view/widget/tab_bar.dart';
import 'package:proplus_task/utils/enum.dart';

import '../../main_export.dart';
import '../../model/repository_response.dart';
import '../../utils/date_helper.dart';

class ProjectViewScreen extends StatefulWidget {
  const ProjectViewScreen({super.key});

  @override
  State<ProjectViewScreen> createState() => _ProjectViewScreenState();
}

class _ProjectViewScreenState extends State<ProjectViewScreen> {
  RepositoryResponse repoName = Get.arguments["repoName"];
  ProjectViewController controller = Get.put(ProjectViewController());

  @override
  void initState() {
    controller.getBranches(repoName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProjectViewController>(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ProjectViewAppBar(
                model: repoName,
              ),
              if (controller.homeApiState == ApiState.loading)
                const CircularProgressIndicator()
              else if (controller.homeApiState == ApiState.error)
                Text(
                  controller.errorMessage ?? "",
                  style: GetTextStyle.styleS16W400Primary5f60,
                )
              else if (controller.branchLiat.isEmpty)
                Text(
                  "Create Branch",
                  style: GetTextStyle.styleS16W400Primary5f60,
                )
              else if (controller.tempList.isEmpty)
                Text(
                  "No commits",
                  style: GetTextStyle.styleS16W400Primary5f60,
                )
              else
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTabBar(),
                      ListView.separated(
                        itemCount: controller.tempList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var tempModel = controller.tempList[index];
                          return InkWell(
                            onTap: () {
                              // Get.toNamed(RouteName.projectView);
                            },
                            child: ProjectViewListTile(
                              title: tempModel.commit.message,
                              subTitle: DateUtil.dateMonthYearSlash(
                                  tempModel.commit.committer.date),
                              userName: tempModel.author?.login??"None",
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 6);
                        },
                      )
                    ],
                  ),
                )
            ],
          ),
        );
      }),
    );
  }

  _buildTabBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTabBar(
          list: List<String>.generate(controller.branchLiat.length,
              (t) => controller.branchLiat[t].name).toList(),
          initialIndex: controller.selectedIndex,
          onChange: (int index) {
            controller.updateBranch(index);
          },
        ),
      ],
    );
  }
}
