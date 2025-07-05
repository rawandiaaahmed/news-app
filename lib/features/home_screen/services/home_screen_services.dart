import 'package:flutter_application_1/core/constants/constant.dart';
import 'package:flutter_application_1/core/networking/api_endpoint.dart';
import 'package:flutter_application_1/core/networking/dio_helper.dart';
import 'package:flutter_application_1/features/home_screen/model/arcitles_models.dart';

class HomeScreenServices {
  getTopHeadlinesArticals() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoint.topHeadlineEndpoint,
        query: {"apiKey": AppConstant.newsApiKey, "country": "us",},
      );
      if (response.statusCode == 200) {
        ArcitlesModels topHeadlinesModels = ArcitlesModels.fromJson(
          response.data,
        );
        print(topHeadlinesModels.totalResults.toString());
        return topHeadlinesModels;
      }
    } catch (e) {
      return Future.error(e.toString());
   
    }
  }
}
