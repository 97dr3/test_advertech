import 'package:test_advertech/domain/requestContactInfoModel.dart';

abstract class Repository {
  Future<bool> sendContactInformation(
      RequestContactInfoModel requestContactInfoModel,
  );
}
