import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/gradient_button.dart';
import '../widget/text_view.dart';
import 'appcolor.dart';
import 'constant.dart';

enum VerificationType { email, phone, none }

class AppUtility {
  static void showProgressDialog() {
    Get.dialog(
      Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: AppColors.orange,
        ),
      ),
      barrierDismissible: false,
    );
  }



  static void showSnackBar(String? message, {int duration = 3}) {
    print("$message");
    Get.snackbar(
      backgroundColor: AppColors.white,
      message.toString(),
      "",
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      snackPosition:
          Platform.isAndroid ? SnackPosition.BOTTOM : SnackPosition.TOP,
      duration: Duration(seconds: duration),
      titleText: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        width: Get.width,
        decoration: BoxDecoration(border: Border.all(color: AppColors.redDark),borderRadius: BorderRadius.circular(10)),
        child: TextView(
          message.toString(),
          fontWeight: FontWeight.w500,
          textColor: AppColors.redDark,
        ),
      ),
      messageText: const SizedBox.shrink(),
    );
  }


  static logoutDialog({bool cancelable = true}) {
    Get.dialog(
      Container(
        width: Get.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
              AppColors.orange.withOpacity(0.65),
              AppColors.primaryColorRed.withOpacity(0.35),
              Colors.transparent
            ])),
        child: AlertDialog(
          alignment: Alignment.center,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 35, 10, 10),
                  child: Text(
                    'Are you sure you want to logout ?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: Get.width / 3.5,
                        height: Get.height / 25,
                        margin: const EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border:
                              Border.all(color: AppColors.orange, width: 1.5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 0.5,
                                offset: Offset(0, 4)),
                          ],
                          color: Colors.white,
                        ),
                        child: const Text('No',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Get.width / 3.5,
                        height: Get.height / 25,
                        margin: const EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          border:
                              Border.all(color: AppColors.orange, width: 1.5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 0.5,
                                offset: Offset(0, 4)),
                          ],
                          color: Colors.white,
                        ),
                        child: const Text('Yes',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: cancelable,
    );
  }

  static PreferredSize buildAppBar(
    String text, {
    void Function()? onBackPressed,
    Widget? leading,
    IconData? icon,
    List<Widget> actions = const [],
    bool automaticallyImplyLeading = true,
  }) {
    return PreferredSize(
      preferredSize: Size.fromHeight(Get.height * 0.07),
      child: AppBar(
        leading: automaticallyImplyLeading
            ? leading ??
                IconButton(
                  onPressed: onBackPressed ?? Get.back,
                  icon: Icon(
                    icon ?? Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                )
            : null,
        elevation: 0,
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: TextView(
          text,
          fontSize: 18,
          textColor: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: AppColors.primaryColorRed),
        ),
        actions: actions,
      ),
    );
  }
}
