import 'package:get_it/get_it.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/distance.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:places/config/secret.dart';
import 'package:places/core/network/network_manager.dart';
import 'package:places/features/places/data/datasources/local/local_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/google_maps_webservice_datasource.dart';
import 'package:places/features/places/data/repositories/google_place_repository_impl.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';
import 'package:places/features/places/domain/usecases/get_direction_usecase.dart';
import 'package:places/features/places/domain/usecases/get_distance_usecase.dart';
import 'package:places/features/places/domain/usecases/get_near_places_usecase.dart';
import 'package:places/features/places/domain/usecases/get_place_detail_usecase.dart';
import 'package:places/features/places/presentation/screens/direction_map/bloc/direction_map_bloc.dart';
import 'package:places/features/places/presentation/screens/place_details/bloc/place_details_bloc.dart';
import 'package:places/features/places/presentation/screens/places_list/bloc/places_list_bloc.dart';
import 'package:http/http.dart' as http;
// import 'package:places/features/places/presentation/screens/places_list/components/place_distance_bloc/place_distance_bloc.dart';
import 'package:places/utils/location_helper.dart';

final sl = GetIt.I;

/**
 * Setup dependency injector
 */
Future<void> setupDi() async {
// setup
  sl.registerLazySingleton<NetworkManager>(() => NetworkManager());
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<LocationHelper>(() => LocationHelper());

// Data sources
sl.registerLazySingleton<LocalCacheDataSource>(() => LocalCacheDataSourceImpl());
//   sl.registerLazySingleton<RemoteApiDataSource>(
//       () => RemoteApiDataSourceImpl(networkManager: sl()));

  sl.registerLazySingleton<GoogleMapsWebserviceDatasource>(
      () => GoogleMapsWebserviceDatasourceImpl(
            placeService: sl(),
            googleMapsDirections: sl(),
            geolocation: sl(),
            distanceMatrix: sl(),
          ));

  sl.registerLazySingleton<GoogleMapsPlaces>(
      () => GoogleMapsPlaces(httpClient: sl(), apiKey: Secret.apiKey));
  sl.registerLazySingleton<GoogleDistanceMatrix>(
      () => GoogleDistanceMatrix(httpClient: sl(), apiKey: Secret.apiKey));
  sl.registerLazySingleton<GoogleMapsGeolocation>(
      () => GoogleMapsGeolocation(httpClient: sl(), apiKey: Secret.apiKey));
  sl.registerLazySingleton<GoogleMapsDirections>(
      () => GoogleMapsDirections(httpClient: sl(), apiKey: Secret.apiKey));

  // repository
  sl.registerLazySingleton<GooglePlaceRepository>(
      () => GooglePlaceRepositoryImpl(
          googleMapsWebserviceDatasource: sl(),
          localCacheDataSource: sl(),
          // remoteApiDataSource: sl(),
          networkManager: sl()));

  // Use cases
  sl.registerLazySingleton<GetNearPlacesUsecase>(
      () => GetNearPlacesUsecase(sl()));
  sl.registerLazySingleton<GetPlaceDetailsUsecase>(
      () => GetPlaceDetailsUsecase(sl()));
  sl.registerLazySingleton<GetDistanceUsecase>(
      () => GetDistanceUsecase(sl()));
  sl.registerLazySingleton<GetDirectionsUsecase>(
      () => GetDirectionsUsecase(sl()));

  // bloc
  sl.registerFactory<PlacesListBloc>(() => PlacesListBloc(getNearPlaces: sl(), getDistanceUsecase: sl()));
  sl.registerFactory<PlaceDetailsBloc>(() => PlaceDetailsBloc(sl()));
  // sl.registerFactory<PlaceDistanceBloc>(() => PlaceDistanceBloc(sl()));
  sl.registerFactory<DirectionMapBloc>(() => DirectionMapBloc(sl()));
}
