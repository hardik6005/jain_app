import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/screens/profile/data/profile_datasource.dart';
import 'package:jain_app/screens/profile/model/business_profile_model.dart';
import 'package:jain_app/screens/profile/model/profile_request_model.dart';
import 'package:jain_app/utils/string_constants.dart';

class ProfileRepository {
  ProfileRepository({
    required ProfileDataSource dataSource,
  }) : _dataSource = dataSource;

  final ProfileDataSource _dataSource;

  //Repository for My Profile API
  Future<ApiResult<BusinessProfileAddModel>> addProfileAPI(
      ProfileRequestModel model) async {
    try {
      final result = await _dataSource.addProfileAPI(model);

      if (result!.statusCode == 200) {
        BusinessProfileAddModel response = BusinessProfileAddModel.fromJson(result.data);
        if (!response.error!) {
          return checkResponseStatusCode<BusinessProfileAddModel>(
              result, response);
        } else {
          return ApiResult.failure(error: response.message!);
        }
      } else {
        return ApiResult.failure(error: result.data["data"]);
      }
    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }

}
