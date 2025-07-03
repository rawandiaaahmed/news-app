// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHeadlineItemsWidget extends StatelessWidget {
  const TopHeadlineItemsWidget({
    Key? key,
    required this.title,
    this.imageUrl,
    required this.date,
    required this.authorName,
  }) : super(key: key);
  final String title;
  final String? imageUrl;
  final String date;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
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
        SizedBox(height: 16.h),
        SizedBox(
          width: 238.w,
          child: Text(title, style: AppTextStyles.titlesStyles.copyWith(fontSize: 18.sp))),
        SizedBox(height: 8.h),
         Text("$authorName . $date", style: AppTextStyles.Gray14Regular),

      ],
    );
  }
}
