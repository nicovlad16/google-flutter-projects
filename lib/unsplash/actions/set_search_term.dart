library set_search_term;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_search_term.freezed.dart';

@freezed
abstract class SetSearchTerm with _$SetSearchTerm {
  const factory SetSearchTerm(String searchTerm) = _SetSearchTerm;
}
