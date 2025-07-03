import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_colors.dart';
import 'package:flutter_application_1/core/style/app_text_styles.dart';
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
      body: Column(children: [
  SizedBox(height: 16.h,),
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
        SizedBox(height: 24.h,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            TopHeadlineItemsWidget(
              title: 'Apple',
             
              date: '2023-10-01',
              authorName: 'Rawan',
            )
          ],
        ),
          
        ),
        SizedBox(height: 24.h,),
        Expanded(child: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: ListView(
            children: [
              ArticalCardWidget(title: "newsTitle", date: "20 May 2025", authorName: "Rawan"),
              ArticalCardWidget(title: "newsTitle", date: "20 May 2025", authorName: "Rawan"),
              ArticalCardWidget(title: "newsTitle", date: "20 May 2025", authorName: "Rawan"),
              ArticalCardWidget(title: "newsTitle", date: "20 May 2025", authorName: "Rawan"),
              ArticalCardWidget(title: "newsTitle", date: "20 May 2025", authorName: "Rawan"),
              ArticalCardWidget(title: "newsTitle", date: "20 May 2025", authorName: "Rawan"),
              ArticalCardWidget(title: "newsTitle", date: "20 May 2025", authorName: "Rawan"),
            ],
          ),
        ))

        ],
      ),
    );
  }
}
