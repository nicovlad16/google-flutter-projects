library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'unsplash_image.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  UnsplashImage,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
