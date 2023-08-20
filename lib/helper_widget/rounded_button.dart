import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/custom_design.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final double height;
  final Color? color;
  const RoundedButton(
      {required this.text,
      this.onPressed,
      this.height = 56,
      this.color,
      this.isLoading = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            constraints: BoxConstraints(
                minHeight: height,
                minWidth: MediaQuery.of(context).size.width / 2.7),
            decoration: CustomDesign().costumeBoxDecoration(borderColor: DisabilityColors.maineGreen,contenarColor: DisabilityColors.maineGreen),
            child:Text(
                    text,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
          ),
        ));
  }
}
