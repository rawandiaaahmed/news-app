// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/constant.dart';

import 'package:flutter_application_1/core/style/app_text_styles.dart';
import 'package:flutter_application_1/features/home_screen/model/arcitles_models.dart';

import 'package:flutter_application_1/features/home_screen/widgets/artical_card_widget.dart';

import 'package:flutter_application_1/features/search_result_screen/services/search_result_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'searchResults'.tr(),
          style: AppTextStyles.Black16Medius,
        ), // Using EasyLocalization for translation
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
         actions: [
         
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(Locale("ar"));
              } else {
                context.setLocale(Locale("en"));
              }
              AppConstant.lan = context.locale.languageCode;
            },
            icon: Icon(Icons.language, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder(
        future: SearchResultServices().SearchItemByName(query),
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
            ArcitlesModels topHeadlinesModels = snapshot.data as ArcitlesModels;
            if (topHeadlinesModels.totalResults == 0) {
              return Center(child: Text('noData'.tr()));
            }
            return Column(
              children: [
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
                          article: article
                             
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
