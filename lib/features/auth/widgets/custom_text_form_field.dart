import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grad_project/core/app_colors.dart';
import 'package:grad_project/core/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String lable;
  final String placeHolder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keyboardType;
  final Widget prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.lable,
    required this.placeHolder,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.keyboardType,
    required this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscure = true;

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.lable, style: AppStyles.blackBold12),
        SizedBox(height: 6.h),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword && _obscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.whiteColor,
            hintText: widget.placeHolder,
            hintStyle: AppStyles.lightGrayReg14,
            prefixIcon: widget.prefixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  )
                : null,
            enabledBorder: _border(Colors.grey.shade300),
            focusedBorder: _border(Theme.of(context).primaryColor, width: 1.5),
            errorBorder: _border(Colors.red),
            focusedErrorBorder: _border(Colors.red, width: 1.5),
          ),
        ),
      ],
    );
  }
}
