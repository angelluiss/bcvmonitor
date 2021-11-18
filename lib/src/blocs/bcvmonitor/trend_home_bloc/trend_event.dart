part of 'trend_bloc.dart';

abstract class TrendsEvent extends Equatable {
  const TrendsEvent();
}

class GetTrends extends TrendsEvent {
  @override
  List<Object> get props => [];
}
