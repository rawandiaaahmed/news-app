import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticalCardWidget extends StatelessWidget {
  const ArticalCardWidget({
    super.key,
    required this.title,
    this.imageUrl,
    required this.date,
    required this.authorName,
  });
  final String title;
  final String? imageUrl;
  final String date;
  final String authorName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.0.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 238.w,
                child: Text(
                  maxLines: 2,
                  title,
                  style: AppTextStyles.titlesStyles.copyWith(fontSize: 18.sp),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 238.w,
                child: Text("$authorName . $date", style: AppTextStyles.Gray14Regular)),
            ],
          ),
          SizedBox(
            width: 112.w,
            height: 80.h,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0.r),
              child: CachedNetworkImage(
                imageUrl:
                    imageUrl ??
                    "https://images.pond5.com/breaking-news-background-red-colour-158889432_prevstill.jpeg",
                height: 206.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
