import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio();

  Dio get getClient => dio;

  DioClient() {
    _dioInit();
  }

  final _optionsHeaders = {
    'Content-Type': 'application/json',
  };

  void _dioInit() async {
    dio.options = BaseOptions(
      followRedirects: false,
      headers: _optionsHeaders,
      validateStatus: (status) {
        return status! < 500;
      },
    );
  }
}
