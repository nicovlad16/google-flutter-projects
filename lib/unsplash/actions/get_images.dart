part of actions;


@freezed
abstract class GetImages with _$GetImages {
  const factory GetImages.start(int page) = GetImagesStart;

  const factory GetImages.successful(List<UnsplashImage> images) = GetImagesSuccessful;

  const factory GetImages.error(dynamic error) = GetImagesError;
}
