import 'package:flutter_application_1/core/constants/constant.dart';
import 'package:flutter_application_1/core/networking/api_endpoint.dart';
import 'package:flutter_application_1/core/networking/dio_helper.dart';
import 'package:flutter_application_1/features/home_screen/model/arcitles_models.dart';

class SearchResultServices {
  SearchItemByName(String query) async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoint.searchEndpoint,
        query: {"apiKey": AppConstant.newsApiKey, "q": query,"language":AppConstant.lan},
      );
      if (response.statusCode == 200) {
      ArcitlesModels arcitlesModels = ArcitlesModels.fromJson(
          response.data,
        );
        print(arcitlesModels.totalResults.toString());
        return arcitlesModels;
      }
    } catch (e) {
      return Future.error(e.toString());
   
    }
  }
}
