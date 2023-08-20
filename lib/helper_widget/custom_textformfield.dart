import 'package:disability/helper_widget/colors.dart';
import 'package:disability/helper_widget/static_variables.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool showPassword;
  final Widget? suffixWidget;
  final bool enabled;
  final int maxLines;
  final int? maxLength;
  const CustomTextFormField({
    this.controller,
    this.hintText='',
    this.onChanged,
    this.textInputType=TextInputType.text,
    this.validator,
    this.showPassword=false,
    this.suffixWidget,
    this.enabled=true,
    this.maxLines=1,
    this.maxLength,
  }) ;

  static final InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: DisabilityColors.borderColor),
  );
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 16),
      child: Directionality(
        textDirection: StaticVariables().lang(context) == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: TextFormField(
          maxLength: maxLength,
          maxLines: maxLines,
          enabled: enabled,
          keyboardType: textInputType,
            controller:controller ,
          obscureText: showPassword,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              fontSize: 16.0,
              height: 1.0,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: DisabilityColors.textDarkGrey,fontSize: 14),
              fillColor: enabled? Colors.white:DisabilityColors.grey5,
              filled: true,
              suffixIcon: suffixWidget,
              focusedBorder: textFieldBorder,
              enabledBorder: textFieldBorder,
              border: textFieldBorder,
            ),
            onChanged: onChanged,
            validator: validator,

        ),
      ),
    );
  }
}
