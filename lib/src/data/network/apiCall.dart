import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;

import 'apiCustomException.dart';

abstract class ApiCall {
  final encoding = Encoding.getByName('utf-8');

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse( url),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'authorization': getBasicAuth()
          });
      print("url :" + Uri.parse(url).toString());
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, jsonMap) async {
    var responseJson;
    print('url is : ' + url);
    print('jsonMap is : ' + jsonMap.toString());


    print('authentication is: ' + getBasicAuth());
    try {
      final response = await http.post(Uri.parse( url),
          body: jsonEncode(jsonMap).toString(),
          encoding: encoding,
          headers: {
            'Content-Type': 'application/json',
            'authorization': getBasicAuth()
          });

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        print(responseJson);
        return responseJson;
      case 400:
        print("network Response code ${response.statusCode} : "+response.body);
        throw BadRequestException(jsonDecode(response.body)["message"],response.statusCode);
      case 401:
        print("network Response code ${response.statusCode} : "+response.body);
        throw UnauthorisedException(jsonDecode(response.body)["message"],response.statusCode);
      case 403:
        print("network Response code ${response.statusCode} : "+response.body);
        throw UnauthorisedException(jsonDecode(response.body)["message"],response.statusCode);
      case 404:
        print("network Response code ${response.statusCode} : "+response.body);
        throw UnauthorisedException(jsonDecode(response.body)["message"],response.statusCode);
      case 500:
        print("network Response code ${response.statusCode} : "+response.body);
        throw UnauthorisedException(response.body,response.statusCode);
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}',response.statusCode);
    }
  }

  String getBasicAuth() {
    //////////////

    String username = 'Cosmetica';
    String password =
        'nVd-LaxUS&k&ezhqxp+ka-27MXMLbNv8b&5kDVHV8#R@AhPfw*bgL9a3Uk2SyTtr7Kvyzq@hg_H%SJkCjGKvk7U@%++733QR9w*B!b6ftKp2F9=VKWPp7tTxHSb3EWMR';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    return basicAuth;
    //////////////////
  }
}
