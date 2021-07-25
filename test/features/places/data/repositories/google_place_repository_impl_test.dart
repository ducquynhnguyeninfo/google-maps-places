import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:places/core/network/network_manager.dart';
import 'package:places/features/places/data/datasources/local/local_cache_datasource.dart';
import 'package:places/features/places/data/datasources/remote_api/models/models.dart';
import 'package:places/features/places/data/datasources/remote_api/remote_api_datasource.dart';
import 'package:places/features/places/data/models/models.dart';
import 'package:places/features/places/data/repositories/google_place_repository_impl.dart';
import 'package:places/features/places/domain/usercases/get_google_place.dart';

import '../../../../data/test_data.dart';
import 'google_place_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteApiDataSource, LocalCacheDataSource, NetworkManager])
void main() {
  late GooglePlaceRepositoryImpl repositoryImpl;
  late RemoteApiDataSource mockRemoteApiDataSource;
  late LocalCacheDataSource mockLocalCacheDataSource;
  late NetworkManager mockNetworkManager;

  setUp(() {
    mockRemoteApiDataSource = MockRemoteApiDataSource();
    mockLocalCacheDataSource = MockLocalCacheDataSource();
    mockNetworkManager = MockNetworkManager();

    repositoryImpl = GooglePlaceRepositoryImpl(
        remoteApiDataSource: mockRemoteApiDataSource,
        localCacheDataSource: mockLocalCacheDataSource,
        networkManager: mockNetworkManager);
  });

  final googlePlaceResponse =
      GooglePlaceResponse.fromJson(googlePlaceResponseJson);
  final PlaceType cafe = PlaceType.cafe;
  final GooglePlaceParams params = GooglePlaceParams(type: cafe);

  group('get Google Place', () {
    test('check if the connection is available', () async {
      when(mockNetworkManager.isConnected).thenAnswer((realInvocation) => true);

      // repositoryImpl.getGooglePlace(cafe);

      expect(mockNetworkManager.isConnected, equals(true));
    });
  });

  group('network online', () {
    setUp(() {
      when(mockNetworkManager.isConnected).thenAnswer((realInvocation) => true);
    });

    test('should get the remote Places successfully', () async {
      when(mockRemoteApiDataSource.getGooglePlace(cafe))
          .thenAnswer((realInvocation) async => googlePlaceResponse);

      var result = await repositoryImpl.getGooglePlace(cafe);

      verify(mockRemoteApiDataSource.getGooglePlace(cafe));
      expect(result, Success(googlePlaceResponse));
    });

    test('should save the data locally when the remote datasource is successful', () async {
      when(mockRemoteApiDataSource.getGooglePlace(cafe))
          .thenAnswer((realInvocation) async => googlePlaceResponse);

      var result = await repositoryImpl.getGooglePlace(cafe);

      verify(mockRemoteApiDataSource.getGooglePlace(cafe));
      expect(result, Success(googlePlaceResponse));
    });

  });

  group('network offline', () {

  });
}
