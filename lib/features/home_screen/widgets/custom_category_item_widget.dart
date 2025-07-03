// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  const CustomCategoryItemWidget({Key? key, required this.title})
    : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE9EEFA), width: 1.0),
            borderRadius: BorderRadius.circular(56.r),
            color: Colors.transparent,
          ),
          child: Text(title, style: AppTextStyles.Black16Medius),
        ),
      ),
    );
  }
}
