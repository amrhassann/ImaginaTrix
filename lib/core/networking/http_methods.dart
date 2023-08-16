import 'dart:convert';
import 'dart:developer';

import 'package:ai_images_generator/core/networking/api_constants.dart';
import 'package:ai_images_generator/core/networking/errors/error_model.dart';
import 'package:ai_images_generator/core/networking/request_params.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'errors/error_handler.dart';

abstract class BaseHttpClient{
  Future<Either<ErrorModel, dynamic>> post(RequestParams params);

}

class MyHttpClient  extends ApiConstants implements BaseHttpClient{

  @override
  Future<Either<ErrorModel, dynamic>> post(RequestParams params,{bool debug = true}) async {
    try {
      if(debug){
        log("TO: _____________________________________________________");
        log(params.url.toString());
      }
      http.Response response = await http
          .post(
        Uri.parse(params.url),
        headers: headers(),
        body: jsonEncode(params.body),
        encoding: Encoding.getByName("utf-8"),
      );

      if(debug){
        log("REQUEST IS: _____________________________________________________");
        log(params.body.toString());
        log("_____________________________________________________");
        log("STATUS CODE IS: ${response.statusCode}");
        log("_____________________________________________________");
        log("RESPONSE IS: _____________________________________________________");
        log(response.body.toString());
        log("_____________________________________________________");
      }


      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(utf8.decode(response.bodyBytes));

        return Right(body);
      } else {
        return Left(handleError(response.statusCode));
      }
    } catch (e) {
      return Left(
        ErrorModel(
          errorMessage: 'An error occurred: $e',
          statusCode: 0,
        ),
      );
    }
  }


}