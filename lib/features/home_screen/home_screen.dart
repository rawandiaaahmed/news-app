import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/constant.dart';
import 'package:flutter_application_1/core/networking/api_endpoint.dart';
import 'package:flutter_application_1/core/networking/dio_helper.dart';

import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_styles.dart';
import 'package:flutter_application_1/features/home_screen/model/top_headlines_models.dart';
import 'package:flutter_application_1/features/home_screen/services/home_screen_services.dart';
import 'package:flutter_application_1/features/home_screen/widgets/artical_card_widget.dart';
import 'package:flutter_application_1/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:flutter_application_1/features/home_screen/widgets/top_headline_items_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // Initialize DioHelper if not already done

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Text(
          'explore'.tr(),
          style:
              AppTextStyles
                  .titlesStyles, // Using EasyLocalization for translation
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.primary),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadlinesArticals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            TopHeadlinesModels topHeadlinesModels =
                snapshot.data as TopHeadlinesModels;
            if (topHeadlinesModels.totalResults == 0) {
              return Center(child: Text('noData'.tr()));
            }
            return Column(
              children: [
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.w),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomCategoryItemWidget(title: 'travel'.tr()),
                        CustomCategoryItemWidget(title: 'technology'.tr()),
                        CustomCategoryItemWidget(title: 'business'.tr()),
                        CustomCategoryItemWidget(title: 'entertainment'.tr()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      TopHeadlineItemsWidget(
                        imageUrl: topHeadlinesModels.articles?[0].urlToImage,
                        title:
                            topHeadlinesModels.articles?[0].title ?? 'No Title',
                        authorName:
                            topHeadlinesModels.articles?[0].author ??
                            'Unknown Author',
                        date: DateFormat('yyyy-MM-dd').format(
                          topHeadlinesModels.articles?[0].publishedAt ??
                              DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: topHeadlinesModels.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadlinesModels.articles![index];

                        return ArticalCardWidget(
                          title: article.title ?? 'No Title',
                          authorName: article.author ?? 'Unknown Author',
                          date: DateFormat('yyyy-MM-dd').format(
                            article.publishedAt ?? DateTime.now(),
                          ),
                          imageUrl: article.urlToImage ??
                              'https://images.pond5.com/breaking-news-background-red-colour-158889432_prevstill.jpeg',
                         
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
