import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/loading_widget.dart';
import 'package:disability/helper_widget/rounded_button.dart';
import 'package:flutter/material.dart';


class Messages {
  loading(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleTextStyle: TextStyle(
          fontSize: 14, color: DisabilityColors.maineGreen, fontFamily: 'Cairo'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: const SizedBox(
          child: LoadingWidget(isFromAlertDialog: true)),
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

  messageAlert({required BuildContext context,
    required String message,
    required String roundedButtonTitle,
    required void Function()? onPressed,
required IconData icon,
  } ) {
    Widget nextButton = RoundedButton(
        text: roundedButtonTitle,
        onPressed: onPressed
        );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      titleTextStyle: TextStyle(
          fontSize: 20, color: DisabilityColors.maineGreen, fontFamily: 'Cairo'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: DisabilityColors.maineGreen.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  height: 112,
                  width: 112,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: DisabilityColors.maineGreen,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    height: 112 - 17,
                    width: 112 - 17),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(icon ,size: 60,color: Colors.white,),
                    height: 112 - 17,
                    width: 112 - 17),

              ],
            ),
          )
        ],
      ),
      content: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10, right: 10, left: 10, bottom: 0),
          child: Text(
            message,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
          child: Center(child: nextButton),
        ),
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

}