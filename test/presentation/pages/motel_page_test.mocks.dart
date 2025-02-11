// Mocks generated by Mockito 5.4.5 from annotations
// in guiademoteisgo/test/presentation/pages/motel_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_bloc/flutter_bloc.dart' as _i6;
import 'package:guiademoteisgo/domain/usecases/get_moteis.dart' as _i2;
import 'package:guiademoteisgo/presentation/bloc/motel_cubit.dart' as _i4;
import 'package:guiademoteisgo/presentation/bloc/motel_state.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetMoteis_0 extends _i1.SmartFake implements _i2.GetMoteis {
  _FakeGetMoteis_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeMotelState_1 extends _i1.SmartFake implements _i3.MotelState {
  _FakeMotelState_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MotelCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockMotelCubit extends _i1.Mock implements _i4.MotelCubit {
  MockMotelCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetMoteis get getMoteis =>
      (super.noSuchMethod(
            Invocation.getter(#getMoteis),
            returnValue: _FakeGetMoteis_0(this, Invocation.getter(#getMoteis)),
          )
          as _i2.GetMoteis);

  @override
  _i3.MotelState get state =>
      (super.noSuchMethod(
            Invocation.getter(#state),
            returnValue: _FakeMotelState_1(this, Invocation.getter(#state)),
          )
          as _i3.MotelState);

  @override
  _i5.Stream<_i3.MotelState> get stream =>
      (super.noSuchMethod(
            Invocation.getter(#stream),
            returnValue: _i5.Stream<_i3.MotelState>.empty(),
          )
          as _i5.Stream<_i3.MotelState>);

  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);

  @override
  _i5.Future<void> fetchMoteis() =>
      (super.noSuchMethod(
            Invocation.method(#fetchMoteis, []),
            returnValue: _i5.Future<void>.value(),
            returnValueForMissingStub: _i5.Future<void>.value(),
          )
          as _i5.Future<void>);

  @override
  void emit(_i3.MotelState? state) => super.noSuchMethod(
    Invocation.method(#emit, [state]),
    returnValueForMissingStub: null,
  );

  @override
  void onChange(_i6.Change<_i3.MotelState>? change) => super.noSuchMethod(
    Invocation.method(#onChange, [change]),
    returnValueForMissingStub: null,
  );

  @override
  void addError(Object? error, [StackTrace? stackTrace]) => super.noSuchMethod(
    Invocation.method(#addError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );

  @override
  void onError(Object? error, StackTrace? stackTrace) => super.noSuchMethod(
    Invocation.method(#onError, [error, stackTrace]),
    returnValueForMissingStub: null,
  );

  @override
  _i5.Future<void> close() =>
      (super.noSuchMethod(
            Invocation.method(#close, []),
            returnValue: _i5.Future<void>.value(),
            returnValueForMissingStub: _i5.Future<void>.value(),
          )
          as _i5.Future<void>);
}
