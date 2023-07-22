import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ContactInformationSendEvent extends HomeEvent {
  const ContactInformationSendEvent(
    this.name,
    this.email,
    this.message,
  );

  final String name;
  final String email;
  final String message;

  @override
  List<Object> get props => [
        name,
        email,
        message,
      ];
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent(
      this.loading,
      );

  final bool loading;

  @override
  List<Object> get props => [
    loading,
  ];
}
