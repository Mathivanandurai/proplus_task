import 'package:proplus_task/model/branc_response.dart';
import 'package:proplus_task/model/commits_response.dart';
import 'package:proplus_task/model/organization_response.dart';
import 'package:proplus_task/model/repository_response.dart';
import 'package:proplus_task/utils/shared_preferences.dart';
import '../service/network.dart';

class HomeRepository {
  static Future<List<OrganizationResponse>> callGetOrganization() async {
    List<OrganizationResponse> list = [];
    await NetworkAdapter.shared.apiCall(
      url: Endpoint.getOrganization,
      requestType: ApiRequestType.get,
      onLoading: () async {},
      onSuccess: (response) {
        list = List<OrganizationResponse>.from(
            response.data.map((e) => OrganizationResponse.fromJson(e)));
      },
      onError: (error) {
        error.fold(
          (left) {
            throw left.message;
          },
          (right) {
            throw right.message;
          },
        );
      },
    );
    return list;
  }

  static Future<List<RepositoryResponse>> callRepos(String orgName) async {
    List<RepositoryResponse> list = [];
    await NetworkAdapter.shared.apiCall(
      url: "${Endpoint.getRepo}$orgName/repos",
      requestType: ApiRequestType.get,
      onLoading: () async {},
      onSuccess: (response) {
        list = List<RepositoryResponse>.from(
            response.data.map((e) => RepositoryResponse.fromJson(e)));
      },
      onError: (error) {
        error.fold(
              (left) {
            throw left.message;
          },
              (right) {
            throw right.message;
          },
        );
      },
    );
    return list;
  }

  static Future<List<BranchResponse>> callBranches(String repoName) async {
    List<BranchResponse> list = [];
    await NetworkAdapter.shared.apiCall(
      url: Endpoint.getBranches(repoName),
      requestType: ApiRequestType.get,
      onLoading: () async {},
      onSuccess: (response) {
        list = List<BranchResponse>.from(
            response.data.map((e) => BranchResponse.fromJson(e)));
      },
      onError: (error) {
        error.fold(
              (left) {
            throw left.message;
          },
              (right) {
            throw right.message;
          },
        );
      },
    );
    return list;
  }

  static Future<List<CommitsResponse>> getCommits(String repoName) async {
    List<CommitsResponse> list = [];
    await NetworkAdapter.shared.apiCall(
      url: Endpoint.getCommits(repoName),
      requestType: ApiRequestType.get,
      onLoading: () async {},
      onSuccess: (response) {
        list = List<CommitsResponse>.from(
            response.data.map((e) => CommitsResponse.fromJson(e)));
      },
      onError: (error) {
        error.fold(
              (left) {
            throw left.message;
          },
              (right) {
            throw right.message;
          },
        );
      },
    );
    return list;
  }
}
