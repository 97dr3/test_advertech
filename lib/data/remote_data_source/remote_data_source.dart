import 'package:test_advertech/domain/requestContactInfoModel.dart';

abstract class RemoteDataSource {
  Future<bool> sendContactInformation(
    RequestContactInfoModel requestContactInfoModel,
  );
}
