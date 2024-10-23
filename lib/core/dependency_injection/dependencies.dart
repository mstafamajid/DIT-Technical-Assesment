import 'package:dit_battery_status/feature/battery/data/datasources/platform_data_source.dart';
import 'package:dit_battery_status/feature/battery/data/repositories/battery_info_repo_imp.dart';
import 'package:dit_battery_status/feature/battery/domain/repositories/battery_repository.dart';
import 'package:dit_battery_status/feature/battery/domain/usecases/get_battery_info_usecase.dart';
import 'package:dit_battery_status/feature/battery/presentation/bloc/battery_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

void init() {
  di.registerFactory(() => BatteryBloc(
        getBatteryInfoUsecase: di<GetBatteryInfo>(),
      ));
  di.registerLazySingleton(
      () => GetBatteryInfo(repository: di<BatteryRepository>()));
  di.registerLazySingleton<BatteryRepository>(() => di<BatteryRepositoryImp>());

  di.registerLazySingleton(
      () => BatteryRepositoryImp(platformDataSource: di<PlatformDataSource>()));
  di.registerLazySingleton<PlatformDataSource>(
      () => di<PlatformDataSourceImpl>());
  di.registerLazySingleton(() => PlatformDataSourceImpl());
}
