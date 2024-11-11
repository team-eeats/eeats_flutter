abstract class HomeEvent {}

class GetMealEvent extends HomeEvent{
  final String date;

  GetMealEvent({
    required this.date,
  });
}
