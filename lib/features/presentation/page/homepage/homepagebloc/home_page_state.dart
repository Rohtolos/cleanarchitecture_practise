part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {
  const HomePageState();
}

class HomePageInitial extends HomePageState {
  HomePageInitial();
  final CountEntity countEntity = CountEntity(count: 0);
}

class HomePageCountState extends HomePageState {
  const HomePageCountState({required this.countEntity});
  final CountEntity countEntity;
}

class HomePageFailureState extends HomePageState {
  const HomePageFailureState({required this.operationFailure});
  final OperationFailure operationFailure;
}
