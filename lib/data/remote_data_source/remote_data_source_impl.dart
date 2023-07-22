import 'package:test_advertech/data/dio/dio.dart';
import 'package:test_advertech/data/remote_data_source/remote_data_source.dart';
import 'package:test_advertech/domain/requestContactInfoModel.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  const RemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<bool> sendContactInformation(
    RequestContactInfoModel requestContactInfoModel,
  ) async {
    var response = await _dioClient.getClient.post(
      "https://api.byteplex.info/api/test/contact/",
      data: requestContactInfoModel,
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
