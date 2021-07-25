import 'package:get_it/get_it.dart';
import 'package:places/core/network/network_manager.dart';
import 'package:places/features/places/data/datasources/remote_api/remote_api_datasource.dart';
import 'package:places/features/places/data/repositories/google_place_repository_impl.dart';
import 'package:places/features/places/domain/repositories/google_place_repository.dart';
import 'package:places/features/places/domain/usecases/get_near_places_usecase.dart';
import 'package:places/features/places/domain/usecases/get_place_detail_usecase.dart';
import 'package:places/features/places/presentation/screens/place_details/bloc/place_details_bloc.dart';
import 'package:places/features/places/presentation/screens/places_list/bloc/places_list_bloc.dart';

final sl = GetIt.I;

/**
 * Setup dependency injector
 */
Future<void> setupDi() async {
// setup
  sl.registerLazySingleton<NetworkManager>(() => NetworkManager());

// Data sources
// sl.registerLazySingleton<LocalCacheDataSource>(() => LocalCacheDataSourceImpl());
  sl.registerLazySingleton<RemoteApiDataSource>(
      () => RemoteApiDataSourceImpl(networkManager: sl()));

  // repository
  sl.registerLazySingleton<GooglePlaceRepository>(
      () => GooglePlaceRepositoryImpl(
          // localCacheDataSource: sl(),
          remoteApiDataSource: sl(),
          networkManager: sl()));

  // Use cases
  sl.registerLazySingleton<GetNearPlacesUsecase>(
      () => GetNearPlacesUsecase(sl())); // input: GooglePlaceRepository
  sl.registerLazySingleton<GetPlaceDetailsUsecase>(
      () => GetPlaceDetailsUsecase(sl())); // input: GooglePlaceRepository

  // bloc
  sl.registerFactory<PlacesListBloc>(
      () => PlacesListBloc(sl())); // input usercase
  // sl.registerFactory<PlaceDetailsBloc>(() => PlaceDetailsBloc());
}
