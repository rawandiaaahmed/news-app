// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/style/app_text_styles.dart';
import 'package:flutter_application_1/features/home_screen/model/arcitles_models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
   ArticleDetailsScreen({
    Key? key,
    required this.article,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            width: 430.w, height: 316.h,
            child: CachedNetworkImage(
              imageUrl:
                  article.urlToImage ??
                  "https://images.pond5.com/breaking-news-background-red-colour-158889432_prevstill.jpeg",
            
              fit: BoxFit.fill,
            ),
            
          ),
          Positioned(
            top: 200.h,
            child: Container(
              padding: EdgeInsets.only(top: 24.h,left: 24.h,right: 24.h),
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height*0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(article.title??"", style: AppTextStyles.titlesStyles.copyWith(fontSize: 18.sp)),
                     SizedBox(height: 8.h,),
                     Text("${article.author} . ${DateFormat('yyyy-MM-dd').format(
                            article.publishedAt! )}",
                             style: AppTextStyles.Gray14Regular
                          ),
                          SizedBox(height: 24.h,),
                           SizedBox(
                            width:  MediaQuery.of(context).size.width*0.9,
                             child: Text( article.description.toString(),
                               style: AppTextStyles.Gray14Regular.copyWith(color: Colors.black)
                                                     ),
                           ),
                
                
                
                  ],
                ),
              ),
            )

          )
        ],
      ),
      ),
    );
  }
}
