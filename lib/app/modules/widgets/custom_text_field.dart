import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/util/exports.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final double? height;
  final InputBorder? enabledBorder;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? style;
  final Function(String)? onChanged;
  final bool readOnly;
  final Widget? prefixIcon;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final BoxConstraints? suffixIconConstraints;
  final bool? filled;
  final Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.suffixIcon,
      this.obscureText = false,
      this.height,
      this.enabledBorder,
      this.hintText,
      this.fillColor,
      this.borderColor,
      this.onChanged,
      this.style,
      this.readOnly = false,
      this.prefixIcon,
      this.onSubmitted,
      this.textInputAction,
      this.keyboardType,
      this.inputFormatters,
      this.validator,
      this.onTap,
      this.contentPadding,
      this.hintStyle,
      this.maxLines,
      this.suffixIconConstraints,
      this.filled,
      this.onFocusChange,
      this.focusNode})
      : super(key: key);

  @override
  State<CustomTextField> createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<CustomTextField> {
  String _errorText = "";
  Color borderColor = AppColors.black;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height ?? 48.h,
          child: Focus(
            onFocusChange: widget.onFocusChange,
            child: TextFormField(
              style: widget.style ??
                  AppTextStyle.regularStyle.copyWith(color: Colors.black),
              cursorColor: Colors.black,
              focusNode: widget.focusNode,
              maxLines: widget.maxLines,
              onFieldSubmitted: widget.onSubmitted,
              controller: widget.controller,
              obscureText: widget.obscureText,
              onChanged: widget.onChanged,
              readOnly: widget.readOnly,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              inputFormatters: widget.inputFormatters,
              validator: widget.validator,
              onTap: widget.onTap,
              decoration: InputDecoration(
                filled: widget.filled ?? true,
                hintStyle: widget.hintStyle ??
                    AppTextStyle.regularStyle.copyWith(color: AppColors.black),
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                contentPadding: widget.contentPadding,
                suffixIconConstraints: widget.suffixIconConstraints ??
                    const BoxConstraints(
                      minHeight: 48,
                      minWidth: 48,
                    ),
                prefixIconConstraints: const BoxConstraints(
                  minHeight: 32,
                  minWidth: 32,
                ),
                suffixIcon: widget.suffixIcon,
                fillColor: widget.fillColor ?? AppColors.white,
                enabledBorder: widget.enabledBorder ??
                    8.outlineInputBorder(
                      borderSide: 1
                          .borderSide(color: widget.borderColor ?? borderColor),
                    ),
                disabledBorder: widget.enabledBorder ??
                    8.outlineInputBorder(
                      borderSide: 1
                          .borderSide(color: widget.borderColor ?? borderColor),
                    ),
                focusedBorder: widget.enabledBorder ??
                    8.outlineInputBorder(
                      borderSide: 1
                          .borderSide(color: widget.borderColor ?? borderColor),
                    ),
                border: widget.enabledBorder ??
                    8.outlineInputBorder(
                      borderSide: 1
                          .borderSide(color: widget.borderColor ?? borderColor),
                    ),
              ),
            ),
          ),
        ),
        if (!_errorText.isNullOrEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              _errorText,
              style: AppTextStyle.regularStyle.copyWith(color: Colors.red),
            ),
          )
      ],
    );
  }

  setError(String text) {
    setState(() {
      _errorText = text;
      borderColor = Colors.red;
    });
  }

  setColor(
    Color color,
  ) {
    setState(() {
      borderColor = color;
    });
  }

  clear() {
    setState(() {
      _errorText = "";
      borderColor = AppColors.black;
    });
  }
}
