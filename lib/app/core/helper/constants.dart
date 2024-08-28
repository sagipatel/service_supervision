import 'package:get/get.dart';
import 'package:ss/app/core/helper/utilites.dart';
import 'package:ss/app/routes/app_pages.dart';

class Global {
  // static const baseURL = "https://worthy-model-shad.ngrok-free.app/"; // live url
  static const baseURL = "https://us-central1-test-20fc4.cloudfunctions.net/last_api/"; // live url
  static const getOtp = "auth/getOtp?email=";
  static const login = "auth/login";
  static const register = "auth/register";
  static const verifyOtp = "auth/verify-otp";
  static const setPasscode = "auth/set-pass-code";
}

class SessionKeys {
  static String keyLoginProfile = "User Data";
  static String keyLogin = "isLoggedIn";
  static String accessToken = "accessToken";
  static String interest = "interest";
  static String isFirstTime = "isFirstTime";
  static String setMyUserProfile = "myUserProfile";
  static String fcmToken = "fcmToken";
  static String firstConnection = "firstConnection";
  static String courseDownload = "courseDownload";
  static String keyFaceId = "setFaceId";
  static String userId = "userId";
}

class AppCommonKeys {
  static String EXPIRED_CONTRACT = "expiredContract";
  static String SERVICE = "service";
  static String CONTRACT = "contract";
  static String UPCOMING_SERVICE = "upcomingService";
}

class AppConst{
  static String TOKEN = "";
  static String ID = "";
}

class REGISTER_STAGE  {
static int OTP_VERIFY = 0;
static int ALREADY_REGISTER = 1;
static int SET_PASS_CODE = 2;
static int COMPANY_DETAILS = 3;
static int REGISTER_COMPLETED = 4;
static int DASHBOARD = 5;
static int UPDATE_PASSWORD = 6;
}


  userNavigate(currentState,{message,id,token}){

  switch (currentState) {
    case 0:
      Get.toNamed(Routes.VERIFY_OTP,arguments: {
        "id":id,"token":token
      });
      break;
    case 1:
      Utilities.errorWidget(errorText:message);
      break;
    case 2:
      Get.toNamed(Routes.PASSCODE,arguments: true);
      break;
    case 3:
      Get.toNamed(Routes.USER_DETAILS,arguments: {
      "id":id,"token":token
      });
      break;
    case 4 || 5:
      Get.toNamed(Routes.DASHBOARD,arguments: {
      "id":id,"token":token
      });
      break;
    default:
     Get.toNamed(Routes.SIGN_UP);
  }

}