import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class AuthController extends GetxController {
  var mobileNumber = "".obs;
  var isLoading = false.obs;
  var isShowPassword = true.obs;
  var isShowConfirmPassword = true.obs;

  signUpButton(
      String username,
      String email,
      String phone,
      String password,
      String confirmPassword,
      )

  {
    if (username == "") {
      Get.defaultDialog(
        title: 'Username is required'
      );
    } else if (email == "") {
      Get.defaultDialog(
        title: 'Email is required',
      );
    } else if (phone == "") {
      Get.dialog(const CustomAlert(
        text: 'Phone is required',
      ));
    } else if (password == "") {
      Get.dialog(CustomAlert(
        text: 'Password is required',
      ));
    } else if (confirmPassword == "") {
      Get.dialog(CustomAlert(
        text: 'Confirm password is required',
      ));
    } else if (password != confirmPassword) {
      Get.dialog(CustomAlert(
        text: 'Password and confirm password must match',
      ));
    } else if (!HelperFunctions.isValidEmail(email)) {
      Get.dialog(CustomAlert(
        text: 'Please enter a valid email',
      ));
    } else if (password.length < 8) {
      Get.dialog(CustomAlert(
        text: 'Password length must be at least 8',
      ));
    } else if (phone.length != 11) {
      Get.dialog(CustomAlert(
        text: 'Valid phone number is of 11 numbers starting with 0',
      ));
    } else {
      // phone = phone.replaceFirst(RegExp(r'^0+'), "+92");
      callSignupAPI(username, email, phone, password, confirmPassword);
    }
  }

  void callSignupAPI(
      String username,
      String email,
      String phone,
      String password,
      String confirmPassword,
      )

  {
    isLoading.value = true;

    Map<String, dynamic> body = <String, dynamic>{};
    Map<String, String> header = <String, String>{};

    body['user_name'] = username;
    body['email'] = email;
    body['phone'] = phone;
    body['password'] = password;
    body['confirm_password'] = confirmPassword;

    header['os'] = Platform.isAndroid
        ? 'android'
        : Platform.isIOS
        ? 'ios'
        : '';
    header['device-name'] = '';
    header['device-token'] = SharedPreference.getValue(AppConstants.deviceToken);

    // log(jsonEncode(body));
    // log(jsonEncode(header));

    ApiManager networkCal = ApiManager(
      name: APIConstants.register,
      apiHeader: header,
      apiBody: body,
    );

    networkCal.callPostAPI().then((fResponse) {
      isLoading.value = false;
      log("API call finished");

      bool status = fResponse['status'];

      if (status == true) {
        Map<String, dynamic> info = fResponse['data'];
        saveInfo(info);
        // WishlistManager.getWishListItem();
        Get.offAllNamed(MedicineOptionScreen.routeName);
      } else {
        if (status == false) {
          String msg = fResponse['message'];
          Get.dialog(CustomAlert(
            text: msg,
            buttonText: 'Retry',
          ));
        }
      }
    });
  }

  void saveInfo(Map<String, dynamic> info, {bool isSignIn = false}) {
    SharedPreference.saveValue(AppConstants.id, info['id'].toString());
    SharedPreference.saveValue(AppConstants.email, info['email']);
    SharedPreference.saveValue(AppConstants.phone, info['phone']);
    SharedPreference.saveValue(AppConstants.username, info['user_name']);
    SharedPreference.saveValue(AppConstants.isLogin, '1');
    SharedPreference.saveValue(AppConstants.code, info['code'].toString());

    if (isSignIn) {
      SharedPreference.saveValue(AppConstants.userType, info['type']);
      SharedPreference.saveValue(AppConstants.apiToken, info['api_token']);
      SharedPreference.saveValue(
          AppConstants.isAdmin, info['is_admin'].toString());
      SharedPreference.saveValue(AppConstants.pushToken, info['push_token']);
      AddressModel addressObj;
      if (info['shipping'] != null) {
        addressObj = AddressModel.fromJson(jsonDecode(info['shipping']));
        SharedPreference.saveInfoInAddressBox(
            AppConstants.address1, addressObj);
      }
      if (info['billing'] != null) {
        addressObj = AddressModel.fromJson(jsonDecode(info['billing']));
        SharedPreference.saveInfoInAddressBox(
            AppConstants.address2, addressObj);
      }
    }
  }

  void callSignInAPI(String email, String password) async {
    isLoading.value = true;
    Map<String, dynamic> body = <String, dynamic>{};
    Map<String, String> header = <String, String>{};

    body['phone_or_email'] = email;
    body['password'] = password;

    header['os'] = Platform.isAndroid
        ? 'android'
        : Platform.isIOS
        ? 'ios'
        : '';
    header['device-name'] = '';
    header['device-token'] =
        SharedPreference.getValue(AppConstants.deviceToken);

    ApiManager networkCal =
    ApiManager(name: APIConstants.signIn, apiHeader: header, apiBody: body);

    networkCal.callPostAPI(enableLogging: true).then((fResponse) {
      isLoading.value = false;
      log("API call finished");
      bool status = fResponse['status'];
      if (status == true) {
        Map<String, dynamic> info = fResponse['data'];
        saveInfo(info, isSignIn: true);
        if (info['type'] == 'Ridder') {
          log(info['type']);
          Get.offAllNamed(RiderHomeScreen.routeName,
              arguments: {'rider': null});
        } else {
          // WishlistManager.getWishListItem()
          //     .then((value) => Get.offAllNamed(MedicineOptionScreen.routeName));
          Get.offAllNamed(MedicineOptionScreen.routeName);
        }
      } else {
        if (status == false) {
          String msg = fResponse['message'];
          Get.dialog(CustomAlert(
            text: msg,
            buttonText: 'ReEnter',
          ));
        }
      }
    });
  }

  callEmailVerificationAPI(String code) {
    isLoading.value = true;

    Map<String, dynamic> body = <String, dynamic>{};
    Map<String, String> header = <String, String>{};

    String email = SharedPreference.getValue(AppConstants.email);

    body['email'] = email;
    body['code'] = code;

    log(jsonEncode(body));

    ApiManager networkCal = ApiManager(
        name: APIConstants.accountVerification,
        apiHeader: header,
        apiBody: body);

    networkCal.callPostAPI().then((fResponse) {
      isLoading.value = false;
      log("API call finished");
      bool status = fResponse['status'];
      String msg = fResponse['message'];

      if (status == true) {
        Get.dialog(CustomAlert(
          text: msg,
          buttonText: 'Enter Dashboard',
          positiveAction: () {
            Get.offAllNamed(MedicineOptionScreen.routeName);
          },
        ));
      } else {
        Get.dialog(CustomAlert(
          text: msg,
        ));
      }
    });
  }
}
