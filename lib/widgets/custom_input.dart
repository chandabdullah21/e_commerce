// ignore_for_file: must_be_immutable

import 'package:e_commerce/constants/app_constants.dart';
import 'package:e_commerce/constants/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';

class CustomInput extends StatefulWidget {
  CustomInput({
    Key? key,
    this.icon,
    required this.isObscure,
    required this.title,
    required this.hint,
    required this.textInputType,
    required this.controller,
    this.formValidator,
  }) : super(key: key);

  IconData? icon;
  bool isObscure;
  String title;
  String hint;
  TextInputType textInputType;
  TextEditingController controller;
  FormFieldValidator? formValidator;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isPasswordShow = true;

  showOrHidePassword() {
    print(isPasswordShow);
    setState(() {
      isPasswordShow = !isPasswordShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.formValidator,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      cursorColor: AppColors.primaryColor,
      obscureText: widget.isObscure ? isPasswordShow : false,
      decoration: InputDecoration(
        prefixIcon: widget.icon == null
            ? null
            : Icon(
                widget.icon,
                color: AppColors.secondaryColor,
              ),
        suffixIcon: widget.isObscure
            ? IconButton(
                onPressed: () {
                  showOrHidePassword();
                },
                icon: Icon(
                  isPasswordShow
                      ? EvaIcons.eyeOutline
                      : EvaIcons.eyeOff2Outline,
                  color: AppColors.secondaryColor,
                ),
              )
            : null,
        label: Text(widget.title),
        labelStyle: const TextStyle(
          color: AppColors.secondaryColor,
        ),
        hintText: widget.hint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(
            color: AppColors.secondaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
    );
  }
}

class CustomPhoneInput extends StatefulWidget {
  CustomPhoneInput({
    Key? key,
    required this.controller,
    required this.onCountryChange,
    this.formValidator,
    this.autoFocus,
  }) : super(key: key);
  TextEditingController controller;
  FormFieldValidator? formValidator;
  Function(Country)? onCountryChange;
  bool? autoFocus;

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: widget.formValidator,
      onCountryChanged: widget.onCountryChange,
      autofocus: widget.autoFocus ?? false,
      controller: widget.controller,
      flagsButtonPadding: const EdgeInsets.only(left: 5),
      dropdownIconPosition: IconPosition.trailing,
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.phone,
      initialValue: "",
      dropdownIcon: const Icon(
        EvaIcons.arrowIosDownwardOutline,
        color: AppColors.secondaryColor,
        size: 18,
      ),
      decoration: InputDecoration(
        counterText: "",
        label: const Text("Phone Number"),
        labelStyle: const TextStyle(
          color: AppColors.secondaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: const BorderSide(
            color: AppColors.secondaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
      initialCountryCode: 'PK',
    );
  }
}
