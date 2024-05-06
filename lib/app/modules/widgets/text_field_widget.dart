import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../common/util/exports.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool obsNhapText;
  final double? height;
  final InputBorder? enabledBorder;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? style;
  final Function(String)? onChanged;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  const TextFieldWidget(
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
      this.maxLines,
      this.obsNhapText = true})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  String _errorText = "";
  Color borderColor = AppColors.kGray200Color;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: widget.style ??
              AppTextStyle.textsmallStyle60016
                  .copyWith(color: AppColors.kGray900Color),
          cursorColor: AppColors.black,
          controller: widget.controller,
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.obsNhapText ? 1 : widget.maxLines,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          onTap: widget.onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12).r,
            filled: true,
            hintStyle: AppTextStyle.textsmallStyle.copyWith(
                fontSize: Dimens.fontSize16, color: AppColors.kBlackText),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon ??
                (_errorText.isNullOrEmpty
                    ? null
                    : Icon(
                        Icons.error_outline,
                        size: Dimens.fontSize20,
                        color: AppColors.kButtonColor,
                      )),
            fillColor: widget.fillColor ?? AppColors.kGray050Color,
            enabledBorder: widget.enabledBorder ??
                8.outlineInputBorder(
                  borderSide:
                      1.borderSide(color: widget.borderColor ?? borderColor),
                ),
            disabledBorder: widget.enabledBorder ??
                8.outlineInputBorder(
                  borderSide:
                      1.borderSide(color: widget.borderColor ?? borderColor),
                ),
            focusedBorder: widget.enabledBorder ??
                8.outlineInputBorder(
                  borderSide:
                      1.borderSide(color: widget.borderColor ?? borderColor),
                ),
            border: widget.enabledBorder ??
                8.outlineInputBorder(
                  borderSide:
                      1.borderSide(color: widget.borderColor ?? borderColor),
                ),
          ),
        ),
        if (!_errorText.isNullOrEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 12.w),
            child: Text(
              _errorText,
              style: AppTextStyle.bodySmallStyle
                  .copyWith(color: AppColors.kButtonColor),
            ),
          )
      ],
    );
  }

  setError(String text) {
    setState(() {
      _errorText = text;
      borderColor = AppColors.kButtonColor;
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
      borderColor = AppColors.kBlack56;
    });
  }
}
