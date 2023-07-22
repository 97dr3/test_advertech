import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class InitHomeState extends HomeState {
  @override
  List<Object> get props => [double.nan];
}

class ContactInfoSentState extends HomeState {
  const ContactInfoSentState(this.contactInfoSent);

  final bool contactInfoSent;

  @override
  List<Object> get props => [
        contactInfoSent,
        double.nan,
      ];
}
class LoadingState extends HomeState {
  const LoadingState(this.loading);

  final bool loading;

  @override
  List<Object> get props => [
    loading,
    double.nan,
  ];
}

