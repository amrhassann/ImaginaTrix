

const String _apiKey = "";
const String _baseUrl = "https://api.openai.com/v1/images";

class ApiConstants{

  Map<String, String> headers() {
      return {
        "Authorization": "Bearer $_apiKey",
        'Content-Type': 'application/json',
      };

  }



  static const String generateImage = '$_baseUrl/generations';




}