import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:places/features/places/domain/repositories/google_place_repository.dart';
import 'package:places/features/places/domain/usercases/get_google_place.dart';
import 'package:places/features/places/data/models/models.dart';

import '../../../../data/test_data.dart';
import 'get_google_place_test.mocks.dart';

// @GenerateMocks([GooglePlaceRepository])
void main() {
  group('fetch GooglePlace', ()
  {
    late MockGooglePlaceRepository mockGooglePlaceRepository;
    late GetGooglePlace getGooglePlace;

    setUp(() {
      mockGooglePlaceRepository = MockGooglePlaceRepository();
      getGooglePlace = GetGooglePlace(mockGooglePlaceRepository);
    });

    final googlePlaceResponse = GooglePlaceResponse.fromJson(googlePlaceResponseJson);
    final PlaceType type = PlaceType.cafe;
    final GooglePlaceParams params = GooglePlaceParams(type: type);
    // final PlaceDetailsResponse placeDetailsResponse = PlaceDetailsResponse(type: type);
    // final PlacePhotoResponse placPhotoResponse = PlacePhotoResponse(type: type);

    test('should get places from google place repository', () async {
      // setup
      when(mockGooglePlaceRepository.getGooglePlace(type))
          .thenAnswer((_) async => Success(googlePlaceResponse));

      // trigger
      final result = await getGooglePlace.call(params);

      // verify
      expect(result, Success(googlePlaceResponse));
      expect(result.getSuccess()!.status, googlePlaceResponse.status);

      var placeModel = result.getSuccess()!.places![0];
      expect(placeModel.types!.contains(type), true);

      verify(mockGooglePlaceRepository.getGooglePlace(type));
    });

  });
}
