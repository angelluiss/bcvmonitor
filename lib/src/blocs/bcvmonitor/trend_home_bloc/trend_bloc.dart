import 'dart:async';

import 'package:bcvapp/src/repository/api_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bcvapp/src/models/trends_model.dart';

part 'trend_event.dart';
part 'trend_state.dart';

class TrendsBloc extends Bloc<TrendsEvent, TrendsState> {
  final ApiRepository _apiRepository = ApiRepository();
  DateTime time = DateTime.now();
  var currentDate;
  var currency = "USD";
  var valueType = true; // "valuebuy"
  TrendsBloc(TrendsState initialState) : super(initialState);

  TrendsState get initialState => const TrendsInitial();

  @override
  Stream<TrendsState> mapEventToState(
    TrendsEvent event,
  ) async* {
    currentDate = time.year.toString() +
        "-" +
        time.month.toString() +
        "-" +
        time.day.toString();
    print("Dias restado " + (time.day - 15).toString());
    // time.difference(other)
    if (event is GetTrends) {
      try {
        yield const TrendsLoading();

        final balance = await _apiRepository.getTrends(
            "2021-11-5", currentDate, currency, valueType);

        yield TrendsLoaded(balance);

        // yield LoginError(login.token);
      } on NetworkError {
        yield const TrendsError("Failed to fetch data. is your device online?");
      }
    }
  }
}
