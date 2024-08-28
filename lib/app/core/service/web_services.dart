import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart';
import 'package:ss/app/core/helper/api_loader.dart';
import 'package:ss/app/core/helper/constants.dart';
import 'package:ss/app/core/helper/logger.dart';
import 'package:ss/app/core/helper/storages.dart';
import 'package:ss/app/core/helper/utilites.dart';
import 'package:ss/app/core/helper/widgets/custom_snack_toast.dart';
import 'package:ss/app/routes/app_pages.dart';

class Webservice {
  static postRequest(
      {@required uri,
      baseUrl,
      body,
      header,
      jsonEncoded = true,
      bool hasBearer = false,
      Function(dynamic responseBody)? onSuccess,
      Function(dynamic error)? onFailure,
      Function? onTimeout,
      Function? onConnectionFailed}) async {
    bool isConnected = await Utilities.isConnectedNetwork();
    if (!isConnected) {
      hideAppLoader();
      AppStorages.isInternetConnected.value = false;
      return;
    } else {
      AppStorages.isInternetConnected.value = true;
    }
    if (hasBearer) {
      header = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${AppStorages.accessToken}",
      };
    } else {
      header ??= {
        'Content-Type': 'application/json',
      };
    }
    print(header);
    if (jsonEncoded) {
      body = jsonEncode(body);
    }
    baseUrl = Global.baseURL;
    var url = Uri.parse(baseUrl + uri);
    Get.closeAllSnackbars();
    http.post(url, body: body, headers: header).then((response) {
      Log.displayResponse(payload: body, res: response, requestType: 'POST');
      var hea = response.headers;
      if (hea["expire"] == "500") {
        // if (AppStorages.isRememberPassword()) {
        //   var reme = AppStorages.getRememberIdPass();
        //   AppStorages.box.erase();
        //   AppStorages.setRememberPassword(true);
        //   var RememberMobile = reme['mobile'];
        //   var rememberPass = reme['password'];
        //   var remPass = {"mobile": RememberMobile, "password": rememberPass};
        //   AppStorages.setRememberIdPass(remPass);
        // } else {
        AppStorages.box!.erase();
        // }
        // Get.offAllNamed(Routes.loginView);
        return;
      }
      var bodyData = jsonDecode(response.body);
      if (bodyData['statusCode'] == 201) {
        print("SUSS");
        if (onSuccess != null) {
          onSuccess(response.body);
        }
      } else {
        var res = jsonDecode(response.body);
        if (onFailure != null) {
          onFailure(res);
        } else {
            getSnackToast(
              message: bodyData['message'],
              colorText: Colors.white,
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error : catchError $error');
        print(url);
      }

      hideAppLoader();
      getSnackToast(
          message: error.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5));

      if (onFailure != null) onFailure(error);
    }).timeout(const Duration(seconds: 60), onTimeout: () {
      if (kDebugMode) {
        print('$url');
        print('Error : TimeOut');
        hideAppLoader();
      }
      if (onTimeout != null) onTimeout();
    });
  }

  static getRequest(
      {@required uri,
      baseUrl,
      body,
      header,
      jsonEncoded = true,
      bool hasBearer = false,
      Function(dynamic responseBody)? onSuccess,
      Function(dynamic error)? onFailure,
      Function? onTimeout,
      Function? onConnectionFailed}) async {
    bool isConnected = await Utilities.isConnectedNetwork();
    if (!isConnected) {
      hideAppLoader();
      AppStorages.isInternetConnected.value = false;
      return;
    } else {
      AppStorages.isInternetConnected.value = true;
    }
    print(AppStorages.accessToken);
    if (hasBearer) {
      header = {
        'Authorization': "Bearer ${AppStorages.accessToken}",
        // 'id': AppStorages.userData.customerId!.id.toString()
      };
    } else {
      header = {
        'Content-Type': 'application/json',
      };
    }

    if (jsonEncoded) {
      body = jsonEncode(body);
    }

    baseUrl = Global.baseURL;
    var url = Uri.parse(baseUrl + uri);
    Get.closeAllSnackbars();
    http.get(url, headers: header).then((response) {
      Log.displayResponse(res: response, requestType: 'GET');
      var hea = response.headers;
      if (hea["expire"] == "500") {
        // if (AppStorages.isRememberPassword()) {
        //   var reme = AppStorages.getRememberIdPass();
        //   AppStorages.box.erase();
        //   AppStorages.setRememberPassword(true);
        //   var RememberMobile = reme['mobile'];
        //   var rememberPass = reme['password'];
        //   var remPass = {"mobile": RememberMobile, "password": rememberPass};
        //   AppStorages.setRememberIdPass(remPass);
        // } else {
        AppStorages.box!.erase();
        // }

        // Get.offAllNamed(Routes.loginView);
        return;
      }
      var bodyData = jsonDecode(response.body);

      if (bodyData['status'] == -1) {
        AppStorages.box!.erase();
        // Get.offAllNamed(Routes.welcomeView); //Navigate to login screen
      }
      if (bodyData['status']) {
        if (onSuccess != null) {
          hideAppLoader();

          onSuccess(response.body);
        }
      } else {
        var res = jsonDecode(response.body);
        if (onFailure != null) {
          onFailure(res);
        } else {
          hideAppLoader();
          getSnackToast(
              message: bodyData['message'],
              colorText: Colors.white,
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error : catchError $error');
        print(url);
      }

      hideAppLoader();
      getSnackToast(
          message: error.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5));

      if (onFailure != null) onFailure(error);
    }).timeout(const Duration(seconds: 60), onTimeout: () {
      if (kDebugMode) {
        print('$url');
        print('Error : TimeOut');
        //  hideAppLoader();
      }
      if (onTimeout != null) onTimeout();
    });
  }

  static bool trustSelfSigned = true;

  static HttpClient getHttpClient() {
    HttpClient httpClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 60)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);

    return httpClient;
  }

  static uploadImage(
      {required uri,
      required File file,
      var body,
      required String? fileType,
      header,
      bool hasBearer = false,
      required Function onSuccess,
      Function? onFailure,
      Function? onTimeout,
      Function? onConnectionFailed,
      var extenstion = "image",
      var methodType = "POST"}) async {
    bool isConnected = await Utilities.isConnectedNetwork();
    if (!isConnected) {
      hideAppLoader();
      AppStorages.isInternetConnected.value = false;
      return;
    } else {
      AppStorages.isInternetConnected.value = true;
    }
    var url = Global.baseURL + uri;

    var request = http.MultipartRequest("POST", Uri.parse(url));
    if (hasBearer) {
      header = {
        // 'Content-Type': 'application/multipart',
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer ${AppStorages.accessToken}",
      };
    }
    if (hasBearer) request.headers.addAll(header);
    if (body != null) {
      request.fields.addAll(body);
    }
    print(file.path);
    request.files.add(
      await http.MultipartFile.fromPath(
        fileType!,
        file.path,
        contentType: extenstion == "image"
            ? MediaType('image', 'jpeg')
            : MediaType('file', 'pdf'),
      ),
    );
    request.send().then((response) {
      http.Response.fromStream(response).then((onValue) {
        try {
          hideAppLoader();
          var res = jsonDecode(onValue.body);
          Log.displayResponse(payload: body, res: res, requestType: 'Upload');
          if (res['status'] == 500) {
            // getSnackToast(title: "Error", message: "Something is wrong");
          } else {
            if (res['status']) {
              onSuccess(res);
            } else {
              onFailure!(res['message']);
            }
          }
          // get your response here...
        } catch (error) {
          hideAppLoader();
          if (kDebugMode) {
            print('Error : catchError $error');
            print(url);
          }
          // getSnackToast(
          //     message: error.toString(),
          //     colorText: Colors.white,
          //     backgroundColor: Colors.red,
          //     duration: const Duration(seconds: 5));
          onFailure!(error);
        }
      });
    });
  }

  static deleteRequest(
      {@required uri,
      baseUrl,
      body,
      header,
      jsonEncoded = true,
      bool hasBearer = false,
      Function(dynamic responseBody)? onSuccess,
      Function(dynamic error)? onFailure,
      Function? onTimeout,
      Function? onConnectionFailed}) async {
    if (hasBearer) {
      bool isConnected = await Utilities.isConnectedNetwork();
      if (!isConnected) {
        hideAppLoader();
        AppStorages.isInternetConnected.value = false;
        return;
      } else {
        AppStorages.isInternetConnected.value = true;
      }
      header = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${AppStorages.accessToken}",
      };
      print(header);
    } else {
      header ??= {
        'Content-Type': 'application/json',
        'secretKey': '6eCtSW8ssqGCeRyoKN29'
      };
    }

    if (jsonEncoded) {
      body = jsonEncode(body);
    }
    baseUrl = Global.baseURL;
    var url = Uri.parse(baseUrl + uri);
    Get.closeAllSnackbars();
    http.delete(url, headers: header, body: body).then((response) {
      Log.displayResponse(payload: body, res: response, requestType: 'POST');

      var hea = response.headers;
      if (hea["expire"] == "500") {
        // if (AppStorages.isRememberPassword()) {
        //   var reme = AppStorages.getRememberIdPass();
        //   AppStorages.box.erase();
        //   AppStorages.setRememberPassword(true);
        //   var RememberMobile = reme['mobile'];
        //   var rememberPass = reme['password'];
        //   var remPass = {"mobile": RememberMobile, "password": rememberPass};
        //   AppStorages.setRememberIdPass(remPass);
        // } else {
        AppStorages.box!.erase();
        // }

        // Get.offAllNamed(Routes.loginView);
        return;
      }
      var bodyData = jsonDecode(response.body);

      if (bodyData['status']) {
        if (onSuccess != null) {
          hideAppLoader();
          print(response.body);
          onSuccess(response.body);
        }
      } else {
        var res = jsonDecode(response.body);
        if (onFailure != null) {
          onFailure(res);
        } else {
          getSnackToast(
              message: bodyData['message'],
              colorText: Colors.white,
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Error : catchError $error');
        print(url);
      }
      getSnackToast(
          message: error.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5));

      if (onFailure != null) onFailure(error);
    }).timeout(const Duration(seconds: 60), onTimeout: () {
      if (kDebugMode) {
        print('$url');
        print('Error : TimeOut');
        // hideAppLoader();
      }
      if (onTimeout != null) onTimeout();
    });
  }
}
