// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  AuthenticationAuthenticated authenticated(String userId) {
    return AuthenticationAuthenticated(
      userId,
    );
  }

  AuthenticationUnauthenticated unauthenticated() {
    return const AuthenticationUnauthenticated();
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? authenticated,
    TResult Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationUnauthenticated value)
        unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationUnauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class $AuthenticationAuthenticatedCopyWith<$Res> {
  factory $AuthenticationAuthenticatedCopyWith(
          AuthenticationAuthenticated value,
          $Res Function(AuthenticationAuthenticated) then) =
      _$AuthenticationAuthenticatedCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class _$AuthenticationAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationAuthenticatedCopyWith<$Res> {
  _$AuthenticationAuthenticatedCopyWithImpl(AuthenticationAuthenticated _value,
      $Res Function(AuthenticationAuthenticated) _then)
      : super(_value, (v) => _then(v as AuthenticationAuthenticated));

  @override
  AuthenticationAuthenticated get _value =>
      super._value as AuthenticationAuthenticated;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(AuthenticationAuthenticated(
      userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticationAuthenticated extends AuthenticationAuthenticated
    with DiagnosticableTreeMixin {
  const _$AuthenticationAuthenticated(this.userId) : super._();

  @override
  final String userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationState.authenticated(userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationState.authenticated'))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenticationAuthenticated &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  $AuthenticationAuthenticatedCopyWith<AuthenticationAuthenticated>
      get copyWith => _$AuthenticationAuthenticatedCopyWithImpl<
          AuthenticationAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return authenticated?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationUnauthenticated value)
        unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationUnauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationAuthenticated extends AuthenticationState {
  const factory AuthenticationAuthenticated(String userId) =
      _$AuthenticationAuthenticated;
  const AuthenticationAuthenticated._() : super._();

  String get userId;
  @JsonKey(ignore: true)
  $AuthenticationAuthenticatedCopyWith<AuthenticationAuthenticated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationUnauthenticatedCopyWith<$Res> {
  factory $AuthenticationUnauthenticatedCopyWith(
          AuthenticationUnauthenticated value,
          $Res Function(AuthenticationUnauthenticated) then) =
      _$AuthenticationUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationUnauthenticatedCopyWith<$Res> {
  _$AuthenticationUnauthenticatedCopyWithImpl(
      AuthenticationUnauthenticated _value,
      $Res Function(AuthenticationUnauthenticated) _then)
      : super(_value, (v) => _then(v as AuthenticationUnauthenticated));

  @override
  AuthenticationUnauthenticated get _value =>
      super._value as AuthenticationUnauthenticated;
}

/// @nodoc

class _$AuthenticationUnauthenticated extends AuthenticationUnauthenticated
    with DiagnosticableTreeMixin {
  const _$AuthenticationUnauthenticated() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthenticationState.unauthenticated'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthenticationUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? authenticated,
    TResult Function()? unauthenticated,
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
    required TResult Function(AuthenticationAuthenticated value) authenticated,
    required TResult Function(AuthenticationUnauthenticated value)
        unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationUnauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthenticationAuthenticated value)? authenticated,
    TResult Function(AuthenticationUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthenticationUnauthenticated extends AuthenticationState {
  const factory AuthenticationUnauthenticated() =
      _$AuthenticationUnauthenticated;
  const AuthenticationUnauthenticated._() : super._();
}
