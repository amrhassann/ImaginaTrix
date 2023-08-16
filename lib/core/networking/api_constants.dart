

import '../../features/images_generatror/data/data_sources/api_key.dart';

const String _baseUrl = "https://api.openai.com/v1/images";

class ApiConstants{

  Map<String, String> headers() {
      return {
        "Authorization": "Bearer $apiKey",
        'Content-Type': 'application/json',
      };

  }



  static const String generateImage = '$_baseUrl/generations';




}