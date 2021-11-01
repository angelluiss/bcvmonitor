part of 'balance_bloc.dart';

abstract class BalanceEvent extends Equatable {
  const BalanceEvent();
}

class GetBalanceBCV extends BalanceEvent {
  @override
  List<Object> get props => [];
}
