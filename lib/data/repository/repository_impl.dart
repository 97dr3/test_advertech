import 'package:test_advertech/data/remote_data_source/remote_data_source.dart';
import 'package:test_advertech/data/repository/repository.dart';
import 'package:test_advertech/domain/requestContactInfoModel.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  Future<bool> sendContactInformation(
    RequestContactInfoModel requestContactInfoModel,
  ) {
    return _remoteDataSource.sendContactInformation(
      requestContactInfoModel,
    );
  }
}
