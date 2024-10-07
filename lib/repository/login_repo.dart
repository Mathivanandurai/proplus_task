import '../model/organization_response.dart';
import '../service/network.dart';

class LoginRepository {
  static Future<OrganizationResponse?> getUserDetails() async {
    OrganizationResponse? organizationResponse;
    await NetworkAdapter.shared.apiCall(
      url: Endpoint.getUser,
      requestType: ApiRequestType.get,
      onLoading: () async {},
      onSuccess: (response) {
        organizationResponse = OrganizationResponse.fromJson(response.data);
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
    return organizationResponse;
  }
}
