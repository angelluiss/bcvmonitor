part of 'trend_bloc.dart';

abstract class TrendsState extends Equatable {
  const TrendsState();
}

class TrendsInitial extends TrendsState {
  const TrendsInitial();
  @override
  List<Object> get props => [];
}

class TrendsLoading extends TrendsState {
  const TrendsLoading();
  @override
  List<Object> get props => [];
}

class TrendsLoaded extends TrendsState {
  final TrendsModel trendsModel;
  const TrendsLoaded(this.trendsModel);
  @override
  List<Object> get props => [trendsModel];
}

class TrendsCached extends TrendsState {
  const TrendsCached();
  @override
  List<bool> get props => [true];
}

class TrendsError extends TrendsState {
  final String message;
  const TrendsError(this.message);
  @override
  List<Object> get props => [message];
}
