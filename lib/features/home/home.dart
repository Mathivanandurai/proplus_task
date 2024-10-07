import 'dart:developer';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proplus_task/components/custom_widgets/custom_image.dart';
import 'package:proplus_task/controller/home_controller.dart';
import 'package:proplus_task/features/home/widgets/custom_drawer.dart';
import 'package:proplus_task/features/home/widgets/home_app_bar.dart';
import 'package:proplus_task/utils/enum.dart';
import '../../main_export.dart';
import '../../model/repository_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getuserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("${homeController.repoList.length}");
    return Scaffold(
      key: homeController.key,
      drawer: const CustomDrawer(),
      body: GetBuilder<HomeController>(builder: (context) {
        if (homeController.homeApiState == ApiState.loading) {
          return const CustomProgressIndicator();
        } else if (homeController.homeApiState == ApiState.error) {
          return const Center(
            child: Text("Error"),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(
                menuOnTap: () {
                  homeController.key.currentState!.openDrawer();
                },
                notifyOnTap: () {},
                name: homeController.organizationResponse!.login,
                organisationName: '',
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Projects",
                      style: GetTextStyle.styleS16W500TextColor,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    if (homeController.repoApiState == ApiState.loading)
                      const CustomProgressIndicator()
                    else if (homeController.repoApiState == ApiState.error)
                      Text(
                        "${homeController.errorMessage}",
                        style: GetTextStyle.styleS16W400Primary5f60,
                      )
                    else if (homeController.selectedOrganization == null)
                      Text(
                        "Select Organization",
                        style: GetTextStyle.styleS16W400Primary5f60,
                      )
                    else
                      ListView.separated(
                        itemCount: homeController.repoList.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var tempModel = homeController.repoList[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.projectView,arguments: {
                                "repoName":tempModel
                              });
                            },
                            child: ProjectListTile(
                              model: tempModel,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
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
}

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    super.key,
    required this.model,
  });

  final RepositoryResponse model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: ConstantColor.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ConstantColor.greyF6F5FE),
          boxShadow: const [
            BoxShadow(
                color: ConstantColor.whiteFA,
                blurRadius: 12,
                spreadRadius: 0,
                offset: Offset(0, 3))
          ]),
      child: Row(
        children: [
          CustomBoxBorder(
            child: CustomImageCard(imageUrl: model.owner.avatarUrl,width: 19,height: 25,),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: GetTextStyle.styleS16W500TextColor,
                ),
                const SizedBox(height: 6),
                Text(
                  model.owner.login,
                  style: GetTextStyle.styleS16W400Primary5f60?.copyWith(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SvgPicture.asset(
            SvgPath.arrowRight,
            width: 6,
            height: 12,
          )
        ],
      ),
    );
  }
}
