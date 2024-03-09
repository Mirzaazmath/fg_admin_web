import 'dart:convert';
import 'dart:io';
import 'package:admin_panel/services/network/response_parser.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'app_exceptions.dart';


class NetworkServices  {
  // Main Url
  final String domainUrl = "";

  Future<String?> get authorizationToken async {
    final prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString("authToken") ?? '';

    if (authToken.length > 4) {
      return 'Bearer $authToken';
    }
    return null;
  }

//////////******* For Creating Header ***********////////////////
  Future<Map<String, String>> get headers async {
    final prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString("authToken")??"";
    debugPrint('*** \n authToken ===> $authToken \n');
    Map<String, String> headers = {};

    if (authToken.length > 4) {
      headers = {
        'Authorization': 'Bearer $authToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
    } else {
      headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
    }
    return headers;
  }

//////////******* For Getting Full Url ***********////////////////
  Uri getFullUrl(String url) {
    String fullPath = domainUrl + url;
    return Uri.parse(fullPath);
  }

//////////******* For Get Call ***********////////////////
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        getFullUrl(url),
        headers: await headers,
      );

      debugPrint('API Service GET response');
      debugPrint(response.body);
      responseJson = returnResponse(response);
    } on SocketException catch (e) {
     // showSnackBar("SomeThing Went Wrong");
      debugPrint(e.toString());
    }
    return responseJson;
  }
//////////******* For Delete Call ***********////////////////
  Future deleteResponse(String url) async {
    dynamic responseJson;
    try {
      debugPrint('*** DELETE Url ==> $url \n');
      final response = await http.delete(
        getFullUrl(url),
        headers: await headers,
      );
      debugPrint('API Service DELETE response');
      // debugPrint(response.body);
      responseJson = returnResponse(response);
    } on SocketException catch (e) {
      debugPrint('We got the exception in Delete api call $e');
      throw FetchDataException(e.message);
    }
    return responseJson;
  }

  //////////******* For Post  Call ***********////////////////
  Future postResponse(String url, Map<String, dynamic> jsonBody) async {
    dynamic responseJson;
    debugPrint('API Service POST ');
    debugPrint('post_request= ${jsonEncode(jsonBody)}');
    try {
      debugPrint('*** POST Url ==> $url \n jsonBody $jsonBody');
      final response = await http.post(
        getFullUrl(url),
        body: jsonEncode(jsonBody),
        headers: await headers,
      );
      debugPrint('API Service POST response ');

      responseJson = returnResponse(response);
       debugPrint(responseJson);
    } on SocketException catch (e) {
      debugPrint('We got the exception in Post api call $e');
      throw FetchDataException(e.message);
    }
    return responseJson;
  }


  //////////******* For Put  Call ***********////////////////
  Future putResponse(String url, Map<String, dynamic> jsonBody) async {
    dynamic responseJson;
    debugPrint('API Service PUT Resuest $url');
    debugPrint(jsonBody.toString());
    try {
      final response = await http.put(
        getFullUrl(url),
        body: jsonEncode(jsonBody),
        headers: await headers,
      );
      debugPrint('API Service PUT response');

      responseJson = returnResponse(response);
       debugPrint(responseJson);
    } on SocketException catch (e) {
      debugPrint('We got the exception in Put api call $e');
      throw FetchDataException(e.message);
    }
    return responseJson;
  }
  //////////******* For Patch Call ***********////////////////
  Future patchResponse(String url, Map<String, dynamic> jsonBody) async {
    dynamic responseJson;
    debugPrint('API Service PATCH ');
    debugPrint(jsonBody.toString());
    debugPrint(url);
    try {
      final response = await http.patch(
        getFullUrl(url),
        body: jsonEncode(jsonBody),
        headers: await headers,
      );
      debugPrint('API Service PATCH response');

      responseJson = returnResponse(response);
       debugPrint(responseJson);
    } on SocketException catch (e) {
      debugPrint('We got the exception in Patch api call $e');
      throw FetchDataException(e.message);
    }
    return responseJson;
  }
  //////////******* For MultipartFile Call ***********////////////////
  Future postMultipartFileResponse(
      String url,
      List<KeyValueRequestData> jsonBody,
      List<String> files,
      List<String> fields,
      ) async {
    debugPrint('*** API Service POST Multipart File Starts Here $url \n');
    debugPrint(jsonBody.toString());
    debugPrint(fields.toString());
    dynamic responseJson;
    try {
      debugPrint('API Service POST Multipart File Response Start Here \n ');
      var multiPartRequest = http.MultipartRequest(
          'POST', Uri.parse(domainUrl + url)

      );

      for (var i = 0; i < files.length; i++) {
        debugPrint('MultiPart Request file path \n ');
        debugPrint(fields[i]);
        debugPrint(files[i]);
        multiPartRequest.files.add(
          await http.MultipartFile.fromPath(
            fields[i],
            files[i],

          ),
        );
      }
      if (jsonBody.isNotEmpty) {
        for (var element in jsonBody) {
          multiPartRequest.fields[element.key] = element.value;
        }
      }
      if ((await authorizationToken) != null) {
        multiPartRequest.headers['authorization'] = (await authorizationToken)!;

      }
      debugPrint('${multiPartRequest.url}');
      debugPrint('${multiPartRequest.fields}');
      debugPrint('${multiPartRequest.files.length}');
      debugPrint('Files Length ${multiPartRequest.files}');
      debugPrint('API Service POST multiPartRequest End Here \n ');

      final http.StreamedResponse response = await multiPartRequest.send();
      debugPrint('API Service POST response ** \n');
      // responseJson = jsonDecode(response.body);
      var httpResponse = await http.Response.fromStream(response);
      debugPrint(httpResponse.body);

      responseJson = returnResponse(httpResponse);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


}
class KeyValueRequestData {
  final String key;
  final String value;

  KeyValueRequestData({
    required this.key,
    required this.value,
  });
}