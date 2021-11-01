part of 'balance_bloc.dart';

abstract class BalanceState extends Equatable {
  const BalanceState();
}

class BalanceInitial extends BalanceState {
  const BalanceInitial();
  @override
  List<Object> get props => [];
}

class BalanceLoading extends BalanceState {
  const BalanceLoading();
  @override
  List<Object> get props => [];
}

class BalanceLoaded extends BalanceState {
  final BalanceModel balanceModel;
  const BalanceLoaded(this.balanceModel);
  @override
  List<Object> get props => [balanceModel];
}

class BalanceCached extends BalanceState {
  const BalanceCached();
  @override
  List<bool> get props => [true];
}

class BalanceError extends BalanceState {
  final String message;
  const BalanceError(this.message);
  @override
  List<Object> get props => [message];
}
