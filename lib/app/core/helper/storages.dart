import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ss/app/core/helper/constants.dart';

class AppStorages {
  static  GetStorage? box;
  static var isInternetConnected = true.obs;
  static String accessToken = "";
  // static LoginResponse userLoginRes = LoginResponse();
  // static ReserveTrailerObj reserveTrailerObj = ReserveTrailerObj();
  static var profileImage = "".obs;
  static var customerDL = "".obs;
  static var customerAI = "".obs;
  static var selfieHoldingDl = "".obs;
  static var userName = "".obs;
  static initializeApp() async {
    await GetStorage.init('QuickHitch');
    box = GetStorage('QuickHitch');
  }

  /* to set user is login */
  static setAppLogin(bool isUserLoggedIn) {
    box!.write(SessionKeys.keyLogin, isUserLoggedIn);
  }

  /* to find user is login */
  static isLogin() {
    if (box!.hasData(SessionKeys.keyLogin)) {
      return box!.read(SessionKeys.keyLogin);
    }
    return false;
  }

  /* to set user token */
  static setAccessToken(String accessToken) {
    box!.write(SessionKeys.accessToken, accessToken);
  }

  /* get user token */
  static getAccessToken() {
    if (box!.hasData(SessionKeys.accessToken)) {
      return box!.read(SessionKeys.accessToken);
    }
    return "";
  }

//   /* to set user is login */
//   static setRememberPassword(bool isRemember) {
//     box.write(SessionKeys.keyIsRemember, isRemember);
//   }
//
//   /* to find user is login */
//   static isRememberPassword() {
//     if (box.hasData(SessionKeys.keyIsRemember)) {
//       return box.read(SessionKeys.keyIsRemember);
//     }
//     return false;
//   }
//
//   /* to set remember id password */
//   static setRememberIdPass(model) {
//     box.write(SessionKeys.keyRememberIdPassword, model);
//   }
//
// /* to get remember id  password */
//   static getRememberIdPass() {
//     if (box.hasData(SessionKeys.keyRememberIdPassword)) {
//       var json = box.read(SessionKeys.keyRememberIdPassword);
//       return json;
//     }
//     return null;
//   }

//   /* to set user data */
//   static setLoginProfileModel(LoginResponse model) {
//     box.write(SessionKeys.keyLoginProfile, loginResponseToJson(model));
//   }
//
// /* to get user data */
//   static getLoginProfileModel() {
//     if (box.hasData(SessionKeys.keyLoginProfile)) {
//       var json = box.read(SessionKeys.keyLoginProfile);
//       return loginResponseFromJson(json);
//     }
//     return null;
//   }

  /* to set user token */
  static setFcmToken(String fcmToken) {
    box!.write(SessionKeys.fcmToken, fcmToken);
  }

  /* get user token */
  static getFcmToken() {
    if (box!.hasData(SessionKeys.fcmToken)) {
      return box!.read(SessionKeys.fcmToken);
    }
    return "";
  }

  /* Set value on storage */
  static setOnStorage({var value, key}) {
    box!.write(key, value);
  }

  /* Get value from storage */
  static getFromStorage(key) {
    if (box!.hasData(key)) {
      return box!.read(key);
    }
    return "";
  }
}

// class ReserveTrailerObj {
//   ReserveTrailerObj({
//     this.startDate,
//     this.endDate,
//     this.startTime,
//     this.endTime,
//     this.start24Time,
//     this.end24Time,
//     // this.pickupLocation,
//     // this.dropOffLocation,
//     this.selTrailerData,
//     this.selectedDays,
//     this.selectedTrailerId,
//     this.fromList = false,
//     this.fleetLocations,
//     this.pickupLocation,
//     this.dropOffLocation,
//     this.pickupLocationId,
//     this.dropOffLocationId,
//     // this.selectedLocationId,
//     // this.selectedLocationName,
//     this.cusAddress,
//     this.cusState,
//     this.cusCity,
//     this.cusZipCode,
//     this.selfiHoldingDL,
//   });
//
//   DateTime? startDate;
//   DateTime? endDate;
//   var selectedTrailerId;
//   var startTime;
//   var endTime;
//   var start24Time;
//   var end24Time;
//   var selectedDays;
//   var selfiHoldingDL;
//   bool fromList = false;
//   // var selectedLocationId;
//   // var selectedLocationName;
//   var pickupLocation;
//   var pickupLocationId;
//   var dropOffLocation;
//   var dropOffLocationId;
//   List<FleetLocation>? fleetLocations;
//   TrailerData? selTrailerData;
//   var cusAddress;
//   var cusState;
//   var cusCity;
//   var cusZipCode;
// }
