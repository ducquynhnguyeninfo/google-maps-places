import 'package:get_it/get_it.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:places/config/env.dart';
import 'package:places/features/places/data/datasources/local/local_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/google_maps_webservice_datasource.dart';
import 'package:places/features/places/data/repositories/google_place_repository_impl.dart';
import 'package:places/features/places/data/repositories/local_data_repository_implement.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';
import 'package:places/features/places/domain/repositories/local_data_repository.dart';
import 'package:places/features/places/domain/usecases/checklist_get_usecase.dart';
import 'package:places/features/places/domain/usecases/checklist_save_usecase.dart';
import 'package:places/features/places/domain/usecases/get_direction_usecase.dart';
import 'package:places/features/places/domain/usecases/get_distance_usecase.dart';
import 'package:places/features/places/domain/usecases/get_near_places_usecase.dart';
import 'package:places/features/places/domain/usecases/get_place_detail_usecase.dart';
import 'package:places/features/places/presentation/screens/direction_map/bloc/direction_map_bloc.dart';
import 'package:places/features/places/presentation/screens/place_details/bloc/place_details_bloc.dart';
import 'package:places/features/places/presentation/screens/place_details/components/checklist/bloc/checklist_bloc.dart';
import 'package:places/features/places/presentation/screens/place_details/components/checklist/widgets/widget_factory.dart';
import 'package:places/features/places/presentation/screens/places_list/bloc/places_list_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:places/utils/location_helper.dart';

final sl = GetIt.I;

/**
 * Setup dependency injector
 */
Future<void> setupDi() async {
// setup
  var client = http.Client();
  sl.registerLazySingleton<http.Client>(() => client,
      dispose: (client) async => client.close());
  var locationHelp = LocationHelper();
  await locationHelp.myPosition(requestNew: true);
  sl.registerLazySingleton<LocationHelper>(() => locationHelp);

// Data sources
  var dataSourceImpl = await LocalHiveDataSourceImpl().initialize();
  sl.registerSingleton<LocalDataSource>(dataSourceImpl,
      dispose: (datasource) => datasource.close());

  sl.registerLazySingleton<GoogleMapsWebserviceDatasource>(
      () => GoogleMapsWebserviceDatasourceImpl(
            placeService: sl(),
            googleMapsDirections: sl(),
            geolocation: sl(),
            distanceMatrix: sl(),
          ));

  sl.registerLazySingleton<GoogleMapsPlaces>(
      () => GoogleMapsPlaces(httpClient: sl(), apiKey: Env.get('api_key')));
  sl.registerLazySingleton<GoogleDistanceMatrix>(
      () => GoogleDistanceMatrix(httpClient: sl(), apiKey: Env.get('api_key')));
  sl.registerLazySingleton<GoogleMapsGeolocation>(
      () => GoogleMapsGeolocation(httpClient: sl(), apiKey: Env.get('api_key')));
  sl.registerLazySingleton<GoogleMapsDirections>(
      () => GoogleMapsDirections(httpClient: sl(), apiKey: Env.get('api_key')));

  // repository
  // sl.registerLazySingleton<GooglePlaceRepository>(() =>
  //     GooglePlaceRepositoryImpl(
  //         googleMapsWebserviceDatasource: sl(), localCacheDataSource: sl()));
  sl.registerLazySingleton<GooglePlaceRepository>(
      () => GooglePlaceRepositoryImpl(googleMapsWebserviceDatasource: sl()));
  sl.registerLazySingleton<LocalDataRepository>(
      () => LocalDataRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton<GetNearPlacesUsecase>(
      () => GetNearPlacesUsecase(sl()));
  sl.registerLazySingleton<GetPlaceDetailsUsecase>(
      () => GetPlaceDetailsUsecase(sl()));
  sl.registerLazySingleton<GetDistanceUsecase>(() => GetDistanceUsecase(sl()));
  sl.registerLazySingleton<GetDirectionsUsecase>(
      () => GetDirectionsUsecase(sl()));

  sl.registerLazySingleton<GetChecklistUsecase>(
      () => GetChecklistUsecase(sl()));
  sl.registerLazySingleton<SaveChecklistUsecase>(
      () => SaveChecklistUsecase(sl()));

  // bloc
  sl.registerFactory<PlacesListBloc>(
      () => PlacesListBloc(getNearPlaces: sl(), getDistanceUsecase: sl()));
  sl.registerFactory<PlaceDetailsBloc>(() => PlaceDetailsBloc(sl()));
  sl.registerFactory<DirectionMapBloc>(() => DirectionMapBloc(sl()));
  sl.registerFactory<ChecklistBloc>(() => ChecklistBloc(sl(), sl()));

  // utility
  sl.registerLazySingleton<ChecklistWidgetFactory>(() => ChecklistWidgetFactory());

}
