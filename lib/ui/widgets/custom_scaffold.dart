import '../../ui/widgets/custom_app_bar.dart';
import '../../ui/widgets/custom_drawer.dart';
import '../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final bool boolShowDrawer;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomScaffold(
      {required this.body,
        this.floatingActionButton,
        this.bottomSheet,
        required this.scaffoldKey,
        required this.className,
        required this.screenName,
        this.boolShowDrawer = true,
        this.onWillPop,
        this.gestureDetectorOnPanDown,
        this.gestureDetectorOnTap,
        this.onDrawerBtnPressed,
        this.onNotificationListener
        
        
        });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            Get.back();
          }else if (screenName == 'Dashboard Screen') {
            // CustomDialogs().appCloseConfirmationDialog();
          } else if(onWillPop != null){
            onWillPop!();
          }
          return Future.value(false);
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
             endDrawer: boolShowDrawer ?const CustomDrawer():null,
            ),
          ),
        ));
  }

}
