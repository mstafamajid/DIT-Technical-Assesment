import 'package:dit_battery_status/core/usecase/usecase.dart';
import 'package:dit_battery_status/feature/battery/data/models/batteryInfoModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_battery_info_usecase.dart';

part 'battery_event.dart';
part 'battery_state.dart';

class BatteryBloc extends Bloc<BatteryEvent, BatteryState> {
  final GetBatteryInfo getBatteryInfoUsecase;
  BatteryBloc({
    required this.getBatteryInfoUsecase,
  }) : super(const BatteryInitial()) {
    on<GetBatteryInfoE>(
        (event, emit) async => await _getBatteryInfo(event, emit));
  }

  Future<void> _getBatteryInfo(
      GetBatteryInfoE event, Emitter<BatteryState> emit) async {
    emit(const BatteryLoading());
    print('GetBatteryInfoE');
    final result = await getBatteryInfoUsecase.call(NoParam());
    print('GetBatteryInfoE $result');
    result.fold((l) => emit(BatteryError(l.message)),
        (r) => emit(BatteryInfoLoaded(r)));
  }
}
