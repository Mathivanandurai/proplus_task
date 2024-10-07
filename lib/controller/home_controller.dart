import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proplus_task/repository/home_repo.dart';
import 'package:proplus_task/utils/enum.dart';
import 'package:proplus_task/utils/shared_preferences.dart';

import '../model/organization_response.dart';
import '../model/repository_response.dart';
import '../repository/login_repo.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  ApiState homeApiState = ApiState.loading;
  ApiState orgApiState = ApiState.loading;
  ApiState repoApiState = ApiState.success;
  bool getOrganizationLoading = false;
  String? errorMessage;
  OrganizationResponse? organizationResponse;
  OrganizationResponse? selectedOrganization;
  List<OrganizationResponse> orgList = [];
  List<RepositoryResponse> repoList = [];

  String ownerName="";

  Future<void> getuserDetails() async {
    try {
      homeApiState = ApiState.loading;
      update();
      organizationResponse = await LoginRepository.getUserDetails();
      ownerName=organizationResponse!.login;
      homeApiState = ApiState.success;
      update();
    } catch (e) {
      errorMessage = "$e";
      homeApiState = ApiState.error;
      update();
    }
  }

  Future<String> getName() async {
    ownerName=await SharedPreferenceHelper.shared.getName()??"";
    return await SharedPreferenceHelper.shared.getName()??"";
  }

  selectOrganization(OrganizationResponse organization) {
    selectedOrganization = organization;
    update();
    callRepos(organization.login);
  }

  Future<void> callGetOrganization() async {
    try {
      orgApiState = ApiState.loading;
      update();
      orgList = await HomeRepository.callGetOrganization();
      orgApiState = ApiState.success;
      update();
    } catch (e) {
      errorMessage = "$e";
      orgApiState = ApiState.error;
      update();
    }
  }

  Future<void> callRepos(String orgNamae) async {
    try {
      repoApiState = ApiState.loading;
      update();
      repoList=  await HomeRepository.callRepos(orgNamae);
      repoApiState = ApiState.success;
      update();
    } catch (e) {
      errorMessage = "$e";
      repoApiState = ApiState.error;
      update();
    }
  }
  @override
  void onInit() async{

    super.onInit();
  }
}
