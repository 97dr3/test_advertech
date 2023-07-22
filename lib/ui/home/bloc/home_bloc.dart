import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_advertech/data/repository/repository.dart';
import 'package:test_advertech/domain/requestContactInfoModel.dart';
import 'package:test_advertech/ui/home/bloc/home_event.dart';
import 'package:test_advertech/ui/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository) : super(InitHomeState()) {
    on<HomeEvent>(sendContactInformation);
    on<LoadingEvent>(loadingAfterRequest);
  }

  final Repository _repository;

  sendContactInformation(HomeEvent event, emit) async {
    if (event is ContactInformationSendEvent) {
      bool result = await _repository.sendContactInformation(
        RequestContactInfoModel(
          name: event.name,
          email: event.email,
          message: event.message,
        ),
      );
      emit(
        ContactInfoSentState(result),
      );
    }
  }

  loadingAfterRequest(HomeEvent event, emit) async {
    if (event is LoadingEvent) {
      emit(
        LoadingState(event.loading),
      );
    }
  }
}
