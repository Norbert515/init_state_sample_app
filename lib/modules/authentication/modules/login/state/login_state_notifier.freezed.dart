// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  LoginUnauthenticated unauthenticated() {
    return const LoginUnauthenticated();
  }

  LoginError error(
      {LocalizedString? emailError, LocalizedString? passwordError}) {
    return LoginError(
      emailError: emailError,
      passwordError: passwordError,
    );
  }

  LoginLoading loading() {
    return const LoginLoading();
  }

  LoginSuccess success() {
    return const LoginSuccess();
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
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
    required TResult Function(LoginUnauthenticated value) unauthenticated,
    required TResult Function(LoginError value) error,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class $LoginUnauthenticatedCopyWith<$Res> {
  factory $LoginUnauthenticatedCopyWith(LoginUnauthenticated value,
          $Res Function(LoginUnauthenticated) then) =
      _$LoginUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginUnauthenticatedCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginUnauthenticatedCopyWith<$Res> {
  _$LoginUnauthenticatedCopyWithImpl(
      LoginUnauthenticated _value, $Res Function(LoginUnauthenticated) _then)
      : super(_value, (v) => _then(v as LoginUnauthenticated));

  @override
  LoginUnauthenticated get _value => super._value as LoginUnauthenticated;
}

/// @nodoc

class _$LoginUnauthenticated extends LoginUnauthenticated {
  const _$LoginUnauthenticated() : super._();

  @override
  String toString() {
    return 'LoginState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginUnauthenticated);
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
    required TResult Function(LoginUnauthenticated value) unauthenticated,
    required TResult Function(LoginError value) error,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class LoginUnauthenticated extends LoginState {
  const factory LoginUnauthenticated() = _$LoginUnauthenticated;
  const LoginUnauthenticated._() : super._();
}

/// @nodoc
abstract class $LoginErrorCopyWith<$Res> {
  factory $LoginErrorCopyWith(
          LoginError value, $Res Function(LoginError) then) =
      _$LoginErrorCopyWithImpl<$Res>;
  $Res call({LocalizedString? emailError, LocalizedString? passwordError});
}

/// @nodoc
class _$LoginErrorCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginErrorCopyWith<$Res> {
  _$LoginErrorCopyWithImpl(LoginError _value, $Res Function(LoginError) _then)
      : super(_value, (v) => _then(v as LoginError));

  @override
  LoginError get _value => super._value as LoginError;

  @override
  $Res call({
    Object? emailError = freezed,
    Object? passwordError = freezed,
  }) {
    return _then(LoginError(
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

class _$LoginError extends LoginError {
  const _$LoginError({this.emailError, this.passwordError}) : super._();

  @override
  final LocalizedString? emailError;
  @override
  final LocalizedString? passwordError;

  @override
  String toString() {
    return 'LoginState.error(emailError: $emailError, passwordError: $passwordError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginError &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailError, passwordError);

  @JsonKey(ignore: true)
  @override
  $LoginErrorCopyWith<LoginError> get copyWith =>
      _$LoginErrorCopyWithImpl<LoginError>(this, _$identity);

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
    required TResult Function(LoginUnauthenticated value) unauthenticated,
    required TResult Function(LoginError value) error,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoginError extends LoginState {
  const factory LoginError(
      {LocalizedString? emailError,
      LocalizedString? passwordError}) = _$LoginError;
  const LoginError._() : super._();

  LocalizedString? get emailError;
  LocalizedString? get passwordError;
  @JsonKey(ignore: true)
  $LoginErrorCopyWith<LoginError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginLoadingCopyWith<$Res> {
  factory $LoginLoadingCopyWith(
          LoginLoading value, $Res Function(LoginLoading) then) =
      _$LoginLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginLoadingCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginLoadingCopyWith<$Res> {
  _$LoginLoadingCopyWithImpl(
      LoginLoading _value, $Res Function(LoginLoading) _then)
      : super(_value, (v) => _then(v as LoginLoading));

  @override
  LoginLoading get _value => super._value as LoginLoading;
}

/// @nodoc

class _$LoginLoading extends LoginLoading {
  const _$LoginLoading() : super._();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginLoading);
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
    required TResult Function(LoginUnauthenticated value) unauthenticated,
    required TResult Function(LoginError value) error,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoading extends LoginState {
  const factory LoginLoading() = _$LoginLoading;
  const LoginLoading._() : super._();
}

/// @nodoc
abstract class $LoginSuccessCopyWith<$Res> {
  factory $LoginSuccessCopyWith(
          LoginSuccess value, $Res Function(LoginSuccess) then) =
      _$LoginSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(
      LoginSuccess _value, $Res Function(LoginSuccess) _then)
      : super(_value, (v) => _then(v as LoginSuccess));

  @override
  LoginSuccess get _value => super._value as LoginSuccess;
}

/// @nodoc

class _$LoginSuccess extends LoginSuccess {
  const _$LoginSuccess() : super._();

  @override
  String toString() {
    return 'LoginState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginSuccess);
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
    required TResult Function(LoginUnauthenticated value) unauthenticated,
    required TResult Function(LoginError value) error,
    required TResult Function(LoginLoading value) loading,
    required TResult Function(LoginSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginUnauthenticated value)? unauthenticated,
    TResult Function(LoginError value)? error,
    TResult Function(LoginLoading value)? loading,
    TResult Function(LoginSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess extends LoginState {
  const factory LoginSuccess() = _$LoginSuccess;
  const LoginSuccess._() : super._();
}
