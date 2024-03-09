import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/screens/auth/model/user_data_model.dart';
import 'package:jain_app/screens/profile/data/profile_datasource.dart';
import 'package:jain_app/screens/profile/model/common_model.dart';
import 'package:jain_app/utils/string_constants.dart';

class ProfileRepository {
  ProfileRepository({
    required ProfileDataSource dataSource,
  }) : _dataSource = dataSource;

  final ProfileDataSource _dataSource;

  //Repository for My Profile API
  Future<ApiResult<CommonModel>> updateProfileAPI(
    String name,
    String email,
    String address,
    String imagePath,
  ) async {
    try {
      final result =
          await _dataSource.updateProfileAPI(name, email, address, imagePath);

      if (result!.statusCode == 200) {
        CommonModel response = CommonModel.fromJson(result.data);
        if (response.status??false) {
          return checkResponseStatusCode<CommonModel>(result, response);
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

  //Repository for Register API
  Future<ApiResult<UserDataModel>> getProfilePI() async {
    try {
      final result = await _dataSource.getProfilePI();

      if (result!.statusCode == 200) {
        UserDataModel response = UserDataModel.fromJson(result.data);
        if (response.status??false) {
          return checkResponseStatusCode<UserDataModel>(result, response);
        } else {
          return ApiResult.failure(error: response.message!);
        }
      } else {
        return ApiResult.failure(error: result.data["message"]);
      }
    } catch (e) {
      //final message = HandleAPI.handleAPIError(e);
      return const ApiResult.failure(error: AppConstants.somethingwentwrong);
    }
  }
}
