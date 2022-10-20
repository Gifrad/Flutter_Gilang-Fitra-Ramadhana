// Mocks generated by Mockito 5.3.2 from annotations
// in unit_test_task/test/model/api/food_api_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:unit_test_task/model/food_model.dart' as _i4;
import 'package:unit_test_task/service/food_api.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FoodApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockFoodApi extends _i1.Mock implements _i2.FoodApi {
  MockFoodApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.FoodModel>> getAllFood() => (super.noSuchMethod(
        Invocation.method(
          #getAllFood,
          [],
        ),
        returnValue: _i3.Future<List<_i4.FoodModel>>.value(<_i4.FoodModel>[]),
      ) as _i3.Future<List<_i4.FoodModel>>);
}
