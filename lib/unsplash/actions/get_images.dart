library get_images;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projects/unsplash/models/unsplash_image.dart';

part 'get_images.freezed.dart';

@freezed
abstract class GetImages with _$GetImages {
  const factory GetImages.start(int page) = GetImagesStart;

  const factory GetImages.successful(List<UnsplashImage> images) = GetImagesSuccessful;

  const factory GetImages.error(dynamic error) = GetImagesError;
}