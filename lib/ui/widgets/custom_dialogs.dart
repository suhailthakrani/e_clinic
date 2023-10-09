import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';



/// Created By: Amjad Jamali on 02-Aug-2023
class CustomDialogs {
  static final CustomDialogs _instance = CustomDialogs._internal();

  CustomDialogs._internal();

  factory CustomDialogs() => _instance;

  void confirmationDialog({required String message, required Function yesFunction}) {
    const double padding = 10.0;
    const double avatarRadius = 66.0;
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.only(
                top: padding + 10,
                bottom: padding,
                left: padding + 10,
                right: padding,
              ),
              margin: const EdgeInsets.only(top: avatarRadius),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(padding),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // To make the card compact
                children: <Widget>[
                  const Text(
                    "Confirmation",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    message,
                    //textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child:  Padding(
                            padding:const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Text(
                              "NO",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            yesFunction();
                          },
                          child:  Padding(
                            padding:const EdgeInsets.only(
                                left: 10, right: 15, top: 5, bottom: 5),
                            child: Text(
                              "YES",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }



/*
  void successDialog({required String successMessage}) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: kLightGreenColor,
                  radius: 40.0,
                  child: Image.asset("assets/icons/check-icon.png",width: 30,height: 30,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    successMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: kGreyColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
*/




  void showDialog(
      String title, String description, DialogType type,
      {Function? onOkBtnPressed}) {
    AwesomeDialog(
      dismissOnBackKeyPress: false,
      context: Get.context!,
      dialogType: type,
      headerAnimationLoop: false,
      animType: AnimType.scale,
      btnOkColor: type == DialogType.success ? null /*kPrimaryColor*/ :
      type == DialogType.error ? kRequiredRedColor : kYellowColor,
      title: title,
      dismissOnTouchOutside: false,
      desc: description,
      // customHeader: Container(
      //     margin: const EdgeInsets.all(12.0),
      //     child: Image.asset("assets/icons/logo.png")),
      btnOkOnPress: () {
        if (onOkBtnPressed != null) {
          onOkBtnPressed();
        }
      },
    ).show();
  }

  void showAwesomeConfirmationDialog(String message, {Function? onOkBtnPressed}) {
    AwesomeDialog(
      dismissOnBackKeyPress: false,
      context: Get.context!,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      btnOkColor: kGreenColor,
      dismissOnTouchOutside: false,
      body: Align(
        alignment: Alignment.center,
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      customHeader: Container(
        margin: const EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/icons/logo.png")
        ),
      ),
      btnOkText: 'YES',
      btnOkOnPress: () {
        if (onOkBtnPressed != null) {
          onOkBtnPressed();
        }
      },
      btnCancelColor: kRequiredRedColor,
      btnCancelOnPress: () {
        // Get.back();
      },
      btnCancelText: 'NO',
    ).show();
  }

  void showErrorDialog(String title, String description, DialogType type, Color btnOkColor, {Function? onOkBtnPressed,bool dismissible = true}) {
    AwesomeDialog(
      dismissOnBackKeyPress: false,
      context: Get.context!,
      dialogType: type,
      headerAnimationLoop: false,
      animType: AnimType.scale,
      btnOkColor: btnOkColor,
      title: title,
      dismissOnTouchOutside: false,
      desc: description,
      customHeader: Container(
          margin: const EdgeInsets.all(12.0),
          child: Image.asset("assets/images/sindh_gov_blue_logo.png")),
      btnOkOnPress: () {
        if(onOkBtnPressed != null ){onOkBtnPressed();}
      },
    ).show();
  }

  void verifyCNICDialog(
      String title, String description, DialogType type, Color btnOkColor,
      {Function? onOkBtnPressed,bool dismissible = true, Function? onCancelBtnPressed}) {
    AwesomeDialog(
      onDismissCallback: (type) => {},
      autoDismiss: dismissible,
      dismissOnBackKeyPress: dismissible,
      btnOkText: "EDIT",
      btnCancelText: 'NEXT',
      context: Get.context!,
      dialogType: type,
      headerAnimationLoop: false,
      animType: AnimType.scale,
      btnOkColor: btnOkColor,
      title: title,
      dismissOnTouchOutside: false,
      desc: description,
      btnOkOnPress: () {
        if (onOkBtnPressed != null) {
          onOkBtnPressed();
        }
      },
      btnCancelColor: kPrimaryColor,
      btnCancelOnPress:(){
        if(onCancelBtnPressed != null){
          onCancelBtnPressed();
        }
      },
    ).show();
  }

}
