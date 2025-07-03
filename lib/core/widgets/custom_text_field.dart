// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.width,
    this.ispassword,
    this.validator,
    this.maxLines,
  }) : super(key: key);
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? width;
  final bool? ispassword;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: ispassword ?? false,
        autofocus: false,
        maxLines: maxLines ?? 1,
        validator: validator,

        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: hintText ??'',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColors.white,width: 1,
            )
          ),
          focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: AppColors.blackColor,width: 1,
            )

          ) ,
          errorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color: Colors.red,width: 1,
            )

          ) ,
         focusedErrorBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color:Colors.red,width: 1,
            )

          ) ,

          filled: true,
          fillColor: AppColors.white,

          
        ),
      
        
      ),
    );
  }
}
