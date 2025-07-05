// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routing/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/style/app_text_styles.dart';
import 'package:flutter_application_1/features/home_screen/model/arcitles_models.dart';
import 'package:go_router/go_router.dart';

class ArticalCardWidget extends StatelessWidget {
  const ArticalCardWidget({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.articleDetailsScreen, extra: article);
      },
      child: Padding(
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
                    article.title ?? "",
                    style: AppTextStyles.titlesStyles.copyWith(fontSize: 18.sp),
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 238.w,
                  child: Text(
                    "${article.author} . ${article.publishedAt}",
                    style: AppTextStyles.Gray14Regular.copyWith(),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 112.w,
              height: 80.h,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0.r),
                child: CachedNetworkImage(
                  imageUrl:
                      article.urlToImage ??
                      "https://images.pond5.com/breaking-news-background-red-colour-158889432_prevstill.jpeg",
                  height: 206.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) => Image.asset(
                        'assets/images/images.jpeg',
                        fit: BoxFit.cover,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
