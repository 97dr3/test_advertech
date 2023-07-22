import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_advertech/data/dio/dio.dart';
import 'package:test_advertech/data/remote_data_source/remote_data_source.dart';
import 'package:test_advertech/data/remote_data_source/remote_data_source_impl.dart';
import 'package:test_advertech/data/repository/repository.dart';
import 'package:test_advertech/data/repository/repository_impl.dart';
import 'package:test_advertech/ui/home/bloc/home_bloc.dart';
import 'package:test_advertech/ui/home/ui/home_page.dart';

class DependencyInjector extends StatelessWidget {
  const DependencyInjector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DioClient>(
          create: (context) => DioClient(),
        ),
        Provider<RemoteDataSource>(
          create: (context) => RemoteDataSourceImpl(
            context.read<DioClient>(),
          ),
        ),
        RepositoryProvider<Repository>(
          create: (context) => RepositoryImpl(
            context.read<RemoteDataSource>(),
          ),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(
            context.read<Repository>(),
          ),
        ),
      ],
      child: const HomePage(),
    );
  }
}
