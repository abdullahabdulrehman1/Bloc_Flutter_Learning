import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { initial, lost, gained }

class InternetCubit extends Cubit<InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connect;
  InternetCubit() : super(InternetState.initial) {
    connect = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetState.gained);
      } else {
        emit(InternetState.lost);
      }
    });
  }
  @override
  Future<void> close() {
    connect?.cancel();
    return super.close();
  }
}
