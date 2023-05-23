part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {
  const HomePageEvent({required this.number});
  final int number;
}

class IncrementEvent extends HomePageEvent {
  const IncrementEvent({required super.number});
}

class DecrementEvent extends HomePageEvent {
  const DecrementEvent({required super.number});
}

class MultiplyWithTwoEvent extends HomePageEvent {
  const MultiplyWithTwoEvent({required super.number});
}
