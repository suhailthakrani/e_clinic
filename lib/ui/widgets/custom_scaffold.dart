import 'dart:io';

import '/../ui/widgets/custom_app_bar.dart';
import '/../ui/widgets/custom_drawer.dart';
import '/../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_dialogs.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final String className;
  final String screenName;
  final Function? onWillPop,
      gestureDetectorOnTap,
      gestureDetectorOnPanDown,
      onDrawerBtnPressed,
      onNotificationListener;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomScaffold(
      {required this.body,
        this.floatingActionButton,
        this.bottomSheet,
        required this.scaffoldKey,
        required this.className,
        required this.screenName,
        this.onWillPop,
        this.gestureDetectorOnPanDown,
        this.gestureDetectorOnTap,
        this.onDrawerBtnPressed,
        this.onNotificationListener});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          if(className == "MainScreen"){
            if(scaffoldKey.currentState!.isDrawerOpen){
              Get.back();
            }else {
              CustomDialogs().showAwesomeConfirmationDialog("Are you sure you want to exit?",onOkBtnPressed: ()=>exit(0));
            }
            return Future.value(false);
          }else{
            if(onWillPop!=null) {
              return onWillPop!();
            } else {
              return Future.value(true);
            }
          }
        },
        child: GestureDetector(
          onTap: (){
            if(gestureDetectorOnTap != null){
              gestureDetectorOnTap!();
            }
          },
          onPanDown: (panDetails){
            if(gestureDetectorOnPanDown!= null){
              gestureDetectorOnPanDown!(panDetails);
            }
          },
          child: NotificationListener(
            onNotification: (notificationInfo){
              if(onNotificationListener != null){
                return onNotificationListener!(notificationInfo);
              }else{
                if(notificationInfo is UserScrollNotification){
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                }
                return true;
              }
            },
            child:Scaffold(
              bottomSheet: bottomSheet,
              backgroundColor: Colors.white,
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              floatingActionButton: floatingActionButton,
              extendBody: true,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70),
                child: Container(
                  color: kPrimaryColor,
                  child: SafeArea(
                    child: PreferredSize(
                      preferredSize: Size.fromHeight(100.0),
                      child: CustomAppBar(
                        scaffoldKey: scaffoldKey,
                        screenName: screenName,
                      ),
                    ),
                  ),
                ),
              ),
              // endDrawer: (screenName != "REGISTER")
              //     ? CustomDrawerWidget(
              //   mainContext: context,
              //   className:  className,
              // )
              //     : null,
              body: body,
              // bottomNavigationBar: CustomBottomNavBar(),
             endDrawer: CustomDrawer(),
            ),
          ),
        ));
  }

}
