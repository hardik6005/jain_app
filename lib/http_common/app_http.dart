// ignore_for_file: file_names
import 'dart:async';
// ignore_for_file: file_names
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jain_app/http_common/api_result.dart';
import 'package:jain_app/main.dart';
import 'package:jain_app/screens/no_internet_screen/no_internet_screen.dart';
import 'package:jain_app/utils/api_constant.dart';
import 'package:jain_app/utils/app_preference.dart';

import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:jain_app/http_common/http_response.dart';

class HttpActions {
  HttpActions();

  Future<HttpResponse?> postMethod(String url,
      {dynamic data, Map<String, String>? headers}) async {
    print("data : ${await checkConnection()}");
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      final enCodedData = jsonEncode(data);

      printLog("URL-----> ${URLS.baseUrl + url} : POST ");
      printLog("REQUEST_HEADER-----> ${headers}");
      printLog("REQUEST_PARAM-----> ${data}");

      http.Response response = await http.post(Uri.parse(URLS.baseUrl + url),
          body: enCodedData, headers: headers);

      try {
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          log("RESPONSE-----> ${utf8.decode(response.bodyBytes)}");
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
          // if (resp.data["error"] && resp.data["code"] != 200) {
          //   await Navigator.push(
          //     GlobalVariable.navState.currentContext!,
          //     MaterialPageRoute(builder: (context) => NoInternetScreen(title: myLanguage.somethingWentWrong,)),
          //   );
          //   return postMethod(url, headers: headers, data: data);
          // }
        }
        return resp;
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } else {
      await Navigator.push(
        GlobalVariable.navState.currentContext!,
        MaterialPageRoute(builder: (context) => const NoInternetScreen()),
      );
      return postMethod(url, headers: headers, data: data);
    }
  }

  Future<HttpResponse?> getMethod(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? queryParam,
      bool? isGoogleAPI}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      String queryParamStr = "";
      if (queryParam != null) {
        queryParam.forEach((key, value) {
          if (queryParamStr.isEmpty) {
            queryParamStr += "?$key=$value";
          } else {
            queryParamStr += "&$key=$value";
          }
        });
      }
      String finalEndPoint = isGoogleAPI == true ? url : URLS.baseUrl + url;
      if (queryParamStr.isNotEmpty) {
        finalEndPoint += queryParamStr;
      }
      printLog("-------H------$finalEndPoint");
      http.Response response =
          await http.get(Uri.parse(finalEndPoint), headers: headers);
      log(response.body);
      try {
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
          if (resp.statusCode != 200) {
            await Navigator.push(
              GlobalVariable.navState.currentContext!,
              MaterialPageRoute(
                  builder: (context) => const NoInternetScreen(
                        title: "somethingWentWrong",
                      )),
            );
            return getMethod(url, headers: headers, queryParam: queryParam);
          }
        }
        return resp;
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } else {
      await Navigator.push(
        GlobalVariable.navState.currentContext!,
        MaterialPageRoute(builder: (context) => const NoInternetScreen()),
      );

      return getMethod(url, headers: headers, queryParam: queryParam);
    }
  }

  Future<HttpResponse?> getGooglePlacesMethod(String url,
      {dynamic data, Map<String, String>? headers}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      printLog(response.body);
      try {
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
        }
        return resp;
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } else {
      await Navigator.push(
        GlobalVariable.navState.currentContext!,
        MaterialPageRoute(builder: (context) => const NoInternetScreen()),
      );

      return getGooglePlacesMethod(
        url,
        headers: headers,
      );
    }
  }

  Future<HttpResponse?> patchMethod(String url,
      {dynamic data, Map<String, String>? headers}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      final enCodedData = jsonEncode(data);
      http.Response response = await http.patch(Uri.parse(URLS.baseUrl + url),
          body: enCodedData, headers: headers);
      try {
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
        }
        return resp;
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } else {
      return Future.error("nointernet");
    }
  }

  Future<HttpResponse?> putMethod(String url,
      {dynamic data, Map<String, String>? headers}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      final enCodedData = jsonEncode(data);
      http.Response response = await http.put(Uri.parse(URLS.baseUrl + url),
          body: enCodedData, headers: headers);
      try {
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
        }
        return resp;
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } else {
      return Future.error("nointernet");
    }
  }

  Future<HttpResponse?> deleteMethod(String url,
      {dynamic data, Map<String, String>? headers}) async {
    if ((await checkConnection()) != ConnectivityResult.none) {
      headers = await getSessionData(headers ?? {});
      final enCodedData = jsonEncode(data);
      http.Response response = await http.delete(Uri.parse(URLS.baseUrl + url),
          body: enCodedData, headers: headers);
      try {
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
        }
        return resp;
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } else {
      return Future.error("nointernet");
    }
  }

  //API Call with multipart

  Future<HttpClientResponse> fileUploadMultipartWithProcess(String url,
      Map<String, dynamic> body, List<String> filePaths, List<String> fileKeys,
      {Function(int sentBytes, int totalBytes)?
          onUploadProgressCallback}) async {
    final httpClient = HttpClient();
    final request = await httpClient.postUrl(Uri.parse(URLS.baseUrl + url));
    int byteCount = 0;

    List<http.MultipartFile> newImageList = <http.MultipartFile>[];
    for (int i = 0; i < filePaths.length; i++) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        fileKeys[i],
        filePaths[i].toString(),
      );
      newImageList.add(multipartFile);
    }
    var requestMultipart =
        http.MultipartRequest("POST", Uri.parse(URLS.baseUrl + url));
    requestMultipart.files.addAll(newImageList);
    for (var entry in body.entries) {
      requestMultipart.fields[entry.key] = entry.value.toString();
    }
    Map<String, String> header = await getMultipartSessionData({});
    requestMultipart.headers.addAll(header);

    var msStream = requestMultipart.finalize();
    var totalByteLength = requestMultipart.contentLength;
    request.contentLength = totalByteLength;
    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader] ?? "");
    request.headers.set(HttpHeaders.authorizationHeader,
        requestMultipart.headers[HttpHeaders.authorizationHeader] ?? "");
    Stream<List<int>> streamUpload = msStream.transform(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);

          byteCount += data.length;
          if (onUploadProgressCallback != null) {
            onUploadProgressCallback(byteCount, totalByteLength);
          }
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();

          /// UPLOAD DONE;
        },
      ),
    );

    await request.addStream(streamUpload).timeout(const Duration(hours: 1),
        onTimeout: () {
      // ignore: null_argument_to_non_null_type
      return Future<HttpClientResponse>.value(null);
    });
    final httpResponse =
        await request.close().timeout(const Duration(hours: 1), onTimeout: () {
      // ignore: null_argument_to_non_null_type
      return Future<HttpClientResponse>.value(null);
    });
    var statusCode = httpResponse.statusCode;
    printLog("statusCodestatusCodestatusCodestatusCodestatusCode");
    printLog(statusCode.toString());

    if (statusCode ~/ 100 != 2) {
      throw Exception('${"somethingwentwrong"} : ${httpResponse.statusCode}');
    } else {
      return httpResponse;
    }
  }

  Future<HttpResponse?> postAPICallWithMultipartArray(String url,
      Map<String, dynamic> body, String? filePath, String? fileName) async {
    printLog("REQUEST_PARAMS $url $body");
    var request = http.MultipartRequest("POST", Uri.parse(url));
    Map<String, String> header = await getSessionData({});
    for (var entry in body.entries) {
      request.fields[entry.key] = entry.value.toString();
    }
    print("DSDSDSDSDSD----2----${header}");

    for (var entry in header.entries) {
      request.headers[entry.key] = entry.value;
    }
    if (filePath != null &&
        filePath.isNotEmpty &&
        fileName != null &&
        fileName.isNotEmpty && !filePath.contains("http")) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        fileName,
        filePath,
        // contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);

      printLog("key ${fileName}");
      printLog("value ${filePath}");
    }

    // request.fields["firm_visiting_card"] = newimageList[0].toString();

    print("DSDSDSDSDSD----5-----${request.fields}");

    // var streamedResponse = await request.send();
    // print("DSDSDSDSDSD----6------${streamedResponse}");
    try {
      var streamedResponse = await request.send().timeout(
            const Duration(seconds: 1400),
          );


      try {


        var response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          String enCodedStr = utf8.decode(response.bodyBytes);
          print("Response Body: $enCodedStr");
          HttpResponse resp = HttpResponse(response.statusCode);

          if (enCodedStr.isNotEmpty) {
            resp.data = jsonDecode(enCodedStr);
          }
          return resp;
        } else {
          print("Error: HTTP status code ${response.statusCode}");
          return Future.error("HTTP status code ${response.statusCode}");
        }
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } on Exception {
      printLog("Exception ");
      return null;
    }
  }

  Future<HttpResponse?> postMultipartAPIFormDataCall(
      String url, Map<String, dynamic> body,
      {String? fileName, String? filePath}) async {
    printLog("REQUEST_URL $url");
    Map<String, String> headers = await getSessionData({});

    var request = http.MultipartRequest("POST", Uri.parse(URLS.baseUrl + url));

    if (filePath != null && filePath.isNotEmpty) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        fileName!,
        filePath,
        // contentType: MediaType('image', 'jpg'),
      );
      request.files.add(multipartFile);

      printLog("key ${fileName}");
      printLog("value ${filePath}");
    }

    for (var entry in body.entries) {
      request.fields[entry.key] = entry.value;
    }

    if (headers != null) {
      for (var entry in headers.entries) {
        request.headers[entry.key] = entry.value;
      }
    }

    print("REQUEST FIELD: "+request.fields.toString());
    print("REQUEST FILE: "+request.files.toString());
    print("REQUEST HEADER: "+request.headers.toString());

    try {
      var streamedResponse = await request.send().timeout(
            const Duration(seconds: 1400),
          );
      try {
        var response = await http.Response.fromStream(streamedResponse);
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
        }
        print("RESPONSE: "+response.body.toString());
        return resp;
      } catch (e) {
        return Future.error("somethingwentwrong");
      }
    } on Exception {
      printLog("Exception ");
      return null;
    }
  }

  Future<HttpResponse?> postMultipartAPIFormDataCallArray(
      String url, Map<String, dynamic> body,
      {String? filePath1, String? filePath2}) async {
    log("REQUEST_URL $url");
    log("REQUEST_PARAMS $body");
    Map<String, String> headers = await getSessionData({});

    var request = http.MultipartRequest("POST", Uri.parse(URLS.baseUrl + url));
    if (filePath1 != null && filePath1.isNotEmpty) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        "photograph",
        filePath1,
        // contentType: MediaType('image', 'jpg'),
      );
      request.files.add(multipartFile);
    }
    if (filePath2 != null && filePath2.isNotEmpty) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        "photos",
        filePath2,
        // contentType: MediaType('image', 'jpg'),
      );
      request.files.add(multipartFile);
    }

    for (var entry in body.entries) {
      print("${entry.key}====${entry.value}");
      request.fields[entry.key] = entry.value.toString();
    }

    if (headers.isNotEmpty) {
      for (var entry in headers.entries) {
        request.headers[entry.key] = entry.value;
      }
    }

    print("REQUEST : " + request.fields.toString());

    try {
      var streamedResponse = await request.send().timeout(
            const Duration(seconds: 1400),
          );
      log("RESPONSE : ${streamedResponse.toString()}");
      try {
        var response = await http.Response.fromStream(streamedResponse);
        log("RESPONSE : ${response.body}");
        String enCodedStr = utf8.decode(response.bodyBytes);
        HttpResponse resp = HttpResponse(response.statusCode);
        if (enCodedStr.isNotEmpty) {
          resp.data = jsonDecode(utf8.decode(response.bodyBytes));
        }
        return resp;
      } catch (e) {
        printLog("Exception ::: " + e.toString());
        return Future.error("somethingwentwrong");
      }
    } on Exception {
      printLog("Exception ::: ");
      return null;
    }
  }

  Future<Map<String, String>> getSessionData(
      Map<String, String> headers) async {
    //Get Version
    // String version = await AppPreference.instance.getPref(Pref.appVersion);

    //Get Token
    String token = /*await AppPreference.instance.getPref(Pref.deviceToken);*/"";
    String deviceId = /*await AppPreference.instance.getPref(Pref.deviceId);*/"";
    String myToken = await AppPreference.instance.getPref(Pref.myToken);"";

    print("BAREAR_TOKEN---" + myToken);

    //Get Device Info
    // String deviceData = await AppPreference.instance.getPref(Pref.deviceInfo);
    // Map<String, dynamic> device = json.decode(deviceData);

    headers[PARAMS.contentType] = "application/json";
    // headers[PARAMS.contentType] = "multipart/form-data; boundary=<calculated when request is sent>";
    // headers["Content-Length"] = "<calculated when request is sent>";
    // headers["Host"] = "<calculated when request is sent>";
    // headers["User-Agent"] = "PostmanRuntime/7.32.3";
    // headers["Accept"] = "*/*";
    // headers["Accept-Encoding"] = "gzip, deflate, br";
    // headers["Connection"] = "keep-alive";
    // headers[PARAMS.deviceId] = deviceId != "" ? deviceId : "1234";
    // headers[PARAMS.deviceType] = device["device"];
    // headers[PARAMS.deviceToken] = token;
    // headers["brand"] = device["brand"];
    // headers["model"] = device["model"];
    // headers["is-mobile"] = "true";
    // headers["app-version"] = version;
    if (myToken.isNotEmpty) {
      headers["Authorization"] = "Bearer $myToken";
    }

    // printLog("device_id :${device["id"]}");
    return headers;
  }

  Future<Map<String, String>> getMultipartSessionData(
      //changes
      Map<String, String> headers) async {
    //final sessionData = await AppPreference.instance.getFCMToken();
    // LoginResponse? sessionData = await getUserData();
    // headers["Content-Type"] = "multipart/form-data";
    // printLog(sessionData?.token ?? '');
    // if (sessionData?.token?.isNotEmpty == true) {
    //   headers["Authorization"] = "Bearer ${sessionData?.token}";
    // }
    return headers;
  }
}

checkResponseStatusCode<T>(HttpResponse result, dynamic responseData) {
  if (result.statusCode == 200 ||
      result.statusCode == 201 ||
      result.statusCode == 204) {
    return ApiResult.success(data: responseData as T);
  } else if (result.statusCode == 400) {
    return ApiResult.failure(error: result.data);
  } else if (result.statusCode == 500) {
    return ApiResult.failure(error: result.data);
  } else {
    return const ApiResult.failure(error: "somethingWentWrong");
  }
}
