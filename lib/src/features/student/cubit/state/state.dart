import 'package:equatable/equatable.dart';

abstract class StudentState extends Equatable {}

class InitialState extends StudentState {
  @override
  List<Object> get props => [];
}

class LoadingState extends StudentState {
  @override
  List<Object> get props => [];
}

class LoadedState extends StudentState {
  @override
  List<Object> get props => [];
}

class ErrorState extends StudentState {
  @override
  List<Object> get props => [];
}

class NetworkErrorState extends StudentState {
  @override
  List<Object> get props => [];
}
