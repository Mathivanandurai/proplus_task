import 'package:get/get.dart';
import 'package:proplus_task/model/commits_response.dart';
import 'package:proplus_task/repository/home_repo.dart';

import '../model/branc_response.dart';
import '../model/repository_response.dart';
import '../utils/enum.dart';

class ProjectViewController extends GetxController {
  ApiState homeApiState = ApiState.loading;
  String? errorMessage;
  List<BranchResponse> branchLiat = [];
  List<CommitsResponse> commitList = [];
  List<CommitsResponse> tempList = [];
  int selectedIndex=0;
  Future<void> getBranches(RepositoryResponse repoName) async {
    try {
      homeApiState = ApiState.loading;
      update();
      var path="${repoName.owner.login}/${repoName.name}";
      branchLiat = await HomeRepository.callBranches(path);
      getCommits(path);
      update();
    } catch (e) {
      errorMessage = "$e";
      homeApiState = ApiState.error;
      update();
    }
  }

  Future<void> getCommits(String repoName) async {
    try {
      homeApiState = ApiState.loading;
      update();
     var  temp = await HomeRepository.getCommits(repoName);
      tempList=temp;
      commitList=temp;
      homeApiState = ApiState.success;
      updateBranch(0);
      update();
    } catch (e) {
      errorMessage = "$e";
      homeApiState = ApiState.error;
      update();
    }
  }
  updateBranch(int index){
    selectedIndex=index;
    if(branchLiat.isEmpty)return;
    tempList=commitList.where((s)=>s.sha==branchLiat[selectedIndex].commit.sha).toList();
    update();
  }
}
