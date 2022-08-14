// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'registration_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RegistrationStateTearOff {
  const _$RegistrationStateTearOff();

  RegistrationUnauthenticated unauthenticated() {
    return const RegistrationUnauthenticated();
  }

  RegistrationError error(
      {LocalizedString? emailError, LocalizedString? passwordError}) {
    return RegistrationError(
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  RegistrationLoading loading() {
    return const RegistrationLoading();
  }

  RegistrationSuccess success() {
    return const RegistrationSuccess();
  }
}

/// @nodoc
const $RegistrationState = _$RegistrationStateTearOff();

/// @nodoc
mixin _$RegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)
        error,
    required TResult Function() loading,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationUnauthenticated value)
        unauthenticated,
    required TResult Function(RegistrationError value) error,
    required TResult Function(RegistrationLoading value) loading,
    required TResult Function(RegistrationSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  final RegistrationState _value;
  // ignore: unused_field
  final $Res Function(RegistrationState) _then;
}

/// @nodoc
abstract class $RegistrationUnauthenticatedCopyWith<$Res> {
  factory $RegistrationUnauthenticatedCopyWith(
          RegistrationUnauthenticated value,
          $Res Function(RegistrationUnauthenticated) then) =
      _$RegistrationUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistrationUnauthenticatedCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationUnauthenticatedCopyWith<$Res> {
  _$RegistrationUnauthenticatedCopyWithImpl(RegistrationUnauthenticated _value,
      $Res Function(RegistrationUnauthenticated) _then)
      : super(_value, (v) => _then(v as RegistrationUnauthenticated));

  @override
  RegistrationUnauthenticated get _value =>
      super._value as RegistrationUnauthenticated;
}

/// @nodoc

class _$RegistrationUnauthenticated extends RegistrationUnauthenticated {
  const _$RegistrationUnauthenticated() : super._();

  @override
  String toString() {
    return 'RegistrationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegistrationUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)
        error,
    required TResult Function() loading,
    required TResult Function() success,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationUnauthenticated value)
        unauthenticated,
    required TResult Function(RegistrationError value) error,
    required TResult Function(RegistrationLoading value) loading,
    required TResult Function(RegistrationSuccess value) success,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class RegistrationUnauthenticated extends RegistrationState {
  const factory RegistrationUnauthenticated() = _$RegistrationUnauthenticated;
  const RegistrationUnauthenticated._() : super._();
}

/// @nodoc
abstract class $RegistrationErrorCopyWith<$Res> {
  factory $RegistrationErrorCopyWith(
          RegistrationError value, $Res Function(RegistrationError) then) =
      _$RegistrationErrorCopyWithImpl<$Res>;
  $Res call({LocalizedString? emailError, LocalizedString? passwordError});
}

/// @nodoc
class _$RegistrationErrorCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationErrorCopyWith<$Res> {
  _$RegistrationErrorCopyWithImpl(
      RegistrationError _value, $Res Function(RegistrationError) _then)
      : super(_value, (v) => _then(v as RegistrationError));

  @override
  RegistrationError get _value => super._value as RegistrationError;

  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(RegistrationError(
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as LocalizedString?,
      passwordError: passwordError == freezed
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as LocalizedString?,
    ));
  }
}

/// @nodoc

class _$RegistrationError extends RegistrationError {
  const _$RegistrationError({this.emailError, this.passwordError}) : super._();

  @override
  final LocalizedString? emailError;
  @override
  final LocalizedString? passwordError;

  @override
  String toString() {
    return 'RegistrationState.error(emailError: $emailError, passwordError: $passwordError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegistrationError &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailError, passwordError);

  @JsonKey(ignore: true)
  @override
  $RegistrationErrorCopyWith<RegistrationError> get copyWith =>
      _$RegistrationErrorCopyWithImpl<RegistrationError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)
        error,
    required TResult Function() loading,
    required TResult Function() success,
  }) {
    return error(emailError, passwordError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
  }) {
    return error?.call(emailError, passwordError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(emailError, passwordError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationUnauthenticated value)
        unauthenticated,
    required TResult Function(RegistrationError value) error,
    required TResult Function(RegistrationLoading value) loading,
    required TResult Function(RegistrationSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RegistrationError extends RegistrationState {
  const factory RegistrationError(
      {LocalizedString? emailError,
      LocalizedString? passwordError}) = _$RegistrationError;
  const RegistrationError._() : super._();

  LocalizedString? get emailError;
  LocalizedString? get passwordError;
  @JsonKey(ignore: true)
  $RegistrationErrorCopyWith<RegistrationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationLoadingCopyWith<$Res> {
  factory $RegistrationLoadingCopyWith(
          RegistrationLoading value, $Res Function(RegistrationLoading) then) =
      _$RegistrationLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistrationLoadingCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationLoadingCopyWith<$Res> {
  _$RegistrationLoadingCopyWithImpl(
      RegistrationLoading _value, $Res Function(RegistrationLoading) _then)
      : super(_value, (v) => _then(v as RegistrationLoading));

  @override
  RegistrationLoading get _value => super._value as RegistrationLoading;
}

/// @nodoc

class _$RegistrationLoading extends RegistrationLoading {
  const _$RegistrationLoading() : super._();

  @override
  String toString() {
    return 'RegistrationState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)
        error,
    required TResult Function() loading,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationUnauthenticated value)
        unauthenticated,
    required TResult Function(RegistrationError value) error,
    required TResult Function(RegistrationLoading value) loading,
    required TResult Function(RegistrationSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegistrationLoading extends RegistrationState {
  const factory RegistrationLoading() = _$RegistrationLoading;
  const RegistrationLoading._() : super._();
}

/// @nodoc
abstract class $RegistrationSuccessCopyWith<$Res> {
  factory $RegistrationSuccessCopyWith(
          RegistrationSuccess value, $Res Function(RegistrationSuccess) then) =
      _$RegistrationSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$RegistrationSuccessCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationSuccessCopyWith<$Res> {
  _$RegistrationSuccessCopyWithImpl(
      RegistrationSuccess _value, $Res Function(RegistrationSuccess) _then)
      : super(_value, (v) => _then(v as RegistrationSuccess));

  @override
  RegistrationSuccess get _value => super._value as RegistrationSuccess;
}

/// @nodoc

class _$RegistrationSuccess extends RegistrationSuccess {
  const _$RegistrationSuccess() : super._();

  @override
  String toString() {
    return 'RegistrationState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegistrationSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unauthenticated,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)
        error,
    required TResult Function() loading,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unauthenticated,
    TResult Function(
            LocalizedString? emailError, LocalizedString? passwordError)?
        error,
    TResult Function()? loading,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegistrationUnauthenticated value)
        unauthenticated,
    required TResult Function(RegistrationError value) error,
    required TResult Function(RegistrationLoading value) loading,
    required TResult Function(RegistrationSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegistrationUnauthenticated value)? unauthenticated,
    TResult Function(RegistrationError value)? error,
    TResult Function(RegistrationLoading value)? loading,
    TResult Function(RegistrationSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RegistrationSuccess extends RegistrationState {
  const factory RegistrationSuccess() = _$RegistrationSuccess;
  const RegistrationSuccess._() : super._();
}
