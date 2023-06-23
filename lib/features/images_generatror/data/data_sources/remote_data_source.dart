import 'package:ai_images_generator/core/networking/api_constants.dart';
import 'package:ai_images_generator/core/networking/http_methods.dart';
import 'package:ai_images_generator/core/networking/request_params.dart';
import 'package:ai_images_generator/core/networking/request_result.dart';
import 'package:ai_images_generator/features/images_generatror/data/models/create_image_params.dart';

class CreateImageRemoteDataSource {
  final BaseHttpClient _httpClient = MyHttpClient();


  Future<RequestResult<List<String>>> execute(CreateImageParams params) async {
    late RequestResult<List<String>> requestResult;

    final result = await _httpClient.post(
      RequestParams(
        url: ApiConstants.generateImage,
        body: params.toJson(),
      ),
    );

    result.fold(
          (l) {
        requestResult = RequestResult(
          containError: true,
          errorMessage: l.errorMessage,
          statusCode: l.statusCode,
        );
      },
          (body) {

            List<Map> _body = body as List<Map<dynamic, dynamic>>;



        requestResult = RequestResult(
          containError: false,
          data: _body.map((e) => e['url'].toString()).toList(),
        );
      },
    );

    return requestResult;
  }
}
