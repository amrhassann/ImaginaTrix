import 'package:ai_images_generator/core/networking/errors/error_model.dart';

ErrorModel handleError(int statusCode) {
  if (statusCode == 404) {
    return ErrorModel(
      statusCode: statusCode,
      errorMessage: 'Not Found',
    );
  } else if (statusCode >=500){
    return ErrorModel(
      statusCode: statusCode,
      errorMessage: 'Server Error, please try again later',
    );
  }else{
    return ErrorModel(
      statusCode: 1,
      errorMessage: 'Error, please try again later',
    );
  }
}