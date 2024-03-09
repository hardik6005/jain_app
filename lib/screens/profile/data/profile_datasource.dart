import 'package:jain_app/http_common/app_http.dart';
import 'package:jain_app/http_common/http_response.dart';
import 'package:jain_app/utils/api_constant.dart';

class ProfileDataSource extends HttpActions {
  ProfileDataSource();

  // profile add API
  Future<HttpResponse?> updateProfileAPI(
    String name,
    String email,
    String address,
    String imagePath,
  ) async {
    final response = await postMultipartAPIFormDataCall(
      URLS.getProfile,
      {
        PARAMS.name: name,
        PARAMS.emailId: email,
        PARAMS.address: address,
      },
      fileName: "profile_pic",
      filePath: imagePath ?? "",
    );

    return response;
  }



  // getProfile API
  Future<HttpResponse?> getProfilePI() async {
    final response = await getMethod(
      URLS.getProfile,
    );
    return response;
  }
}
