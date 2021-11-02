import 'dart:async';

import 'package:bcvapp/src/repository/api_repository.dart';
import 'package:bcvapp/src/utils/constants.dart';
import 'package:bcvapp/src/utils/share_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bcvapp/src/models/balance_model.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final ApiRepository _apiRepository = ApiRepository();

  BalanceBloc(BalanceState initialState) : super(initialState);

  BalanceState get initialState => const BalanceInitial();

  @override
  Stream<BalanceState> mapEventToState(
    BalanceEvent event,
  ) async* {
    if (event is GetBalanceBCV) {
      try {
        yield const BalanceLoading();

        final balance = await _apiRepository.getBalanceBCVMonitor();

        _saveSharePreference(balance);

        yield BalanceLoaded(balance);

        // yield LoginError(login.token);
      } on NetworkError {
        yield const BalanceError(
            "Failed to fetch data. is your device online?");
      }
    }
  }

  _saveSharePreference(BalanceModel model) {
    model.resp.map((e) => {
          if (e.name.contains('USD'))
            {
              BCVPreferences.setStringValue(
                  keyPreferenceUSDBuy, e.valuebuy.toString()),
              BCVPreferences.setStringValue(
                  keyPreferenceUSDSell, e.valuesale.toString())
            }
          else if (e.name.contains('EUR'))
            {
              BCVPreferences.setStringValue(
                  keyPreferenceEURBuy, e.valuebuy.toString()),
              BCVPreferences.setStringValue(
                  keyPreferenceEURSell, e.valuesale.toString())
            }
        });
  }
}
