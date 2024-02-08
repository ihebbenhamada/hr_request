import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.autofocus = false,
    this.obscureText = false,
    required this.controller,
    this.hintText = '',
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onTapOutside,
    this.maxLines = 1,
    this.focusNode,
    this.nextFocusNode,
    this.keyboardType = TextInputType.multiline,
    this.validator,
    this.filled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.title,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.maxLength,
    this.autovalidateMode,
    this.initialValue,
    this.textCapitalization = TextCapitalization.none,
    this.enabled,
    this.paddingRight = 22,
    this.paddingLeft = 22,
    this.error,
    this.errorText,
    this.isDarkMode = false,
  });

  final bool autofocus;
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool? enabled;
  final bool? error;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final int maxLines;
  final double paddingRight;
  final double paddingLeft;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool filled;
  final int? maxLength;
  final bool? maxLengthEnforced = true;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? title;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      autofocus: autofocus,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      onSaved: onSaved,
      initialValue: initialValue,
      maxLength: maxLength,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      onTap: onTap,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      cursorColor: AppColors.gray1,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.gray1,
        ),
        contentPadding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: 20,
          bottom: 20,
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(),
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(),
        filled: true,
        fillColor: AppColors.white.withOpacity(0.17),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(29.0),
          borderSide: BorderSide.none,
        ),
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      autocorrect: false,
      enableSuggestions: false,
      enabled: enabled,
      textInputAction: textInputAction,
      autovalidateMode: autovalidateMode,
      validator: validator,
      enableInteractiveSelection: true,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
    );
  }
}
