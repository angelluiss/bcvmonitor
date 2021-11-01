import 'dart:async';

import 'package:bcvapp/src/repository/api_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bcvapp/src/models/covid_model.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final ApiRepository _apiRepository = ApiRepository();

  CovidBloc(CovidState initialState) : super(initialState);

  CovidState get initialState => const CovidInitial();

  @override
  Stream<CovidState> mapEventToState(
    CovidEvent event,
  ) async* {
    if (event is GetCovidList) {
      try {
        yield const CovidLoading();
        final mList = await _apiRepository.fetchCovidList();
        yield CovidLoaded(mList);
        yield CovidError(mList.error);
      } on NetworkError {
        yield const CovidError("Failed to fetch data. is your device online?");
      }
    }
  }
}
