// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'initiate_password_reset_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InitiatePasswordResetStateTearOff {
  const _$InitiatePasswordResetStateTearOff();

  PasswordResetReady ready() {
    return const PasswordResetReady();
  }

  PasswordResetError error(
      {LocalizedString? emailError, LocalizedString? generalError}) {
    return PasswordResetError(
      emailError: emailError,
      generalError: generalError,
    );
  }

  PasswordResetLoading loading() {
    return const PasswordResetLoading();
  }

  PasswordResetSent sent({required String toMail}) {
    return PasswordResetSent(
      toMail: toMail,
    );
  }
}

/// @nodoc
const $InitiatePasswordResetState = _$InitiatePasswordResetStateTearOff();

/// @nodoc
mixin _$InitiatePasswordResetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)
        error,
    required TResult Function() loading,
    required TResult Function(String toMail) sent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordResetReady value) ready,
    required TResult Function(PasswordResetError value) error,
    required TResult Function(PasswordResetLoading value) loading,
    required TResult Function(PasswordResetSent value) sent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitiatePasswordResetStateCopyWith<$Res> {
  factory $InitiatePasswordResetStateCopyWith(InitiatePasswordResetState value,
          $Res Function(InitiatePasswordResetState) then) =
      _$InitiatePasswordResetStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitiatePasswordResetStateCopyWithImpl<$Res>
    implements $InitiatePasswordResetStateCopyWith<$Res> {
  _$InitiatePasswordResetStateCopyWithImpl(this._value, this._then);

  final InitiatePasswordResetState _value;
  // ignore: unused_field
  final $Res Function(InitiatePasswordResetState) _then;
}

/// @nodoc
abstract class $PasswordResetReadyCopyWith<$Res> {
  factory $PasswordResetReadyCopyWith(
          PasswordResetReady value, $Res Function(PasswordResetReady) then) =
      _$PasswordResetReadyCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordResetReadyCopyWithImpl<$Res>
    extends _$InitiatePasswordResetStateCopyWithImpl<$Res>
    implements $PasswordResetReadyCopyWith<$Res> {
  _$PasswordResetReadyCopyWithImpl(
      PasswordResetReady _value, $Res Function(PasswordResetReady) _then)
      : super(_value, (v) => _then(v as PasswordResetReady));

  @override
  PasswordResetReady get _value => super._value as PasswordResetReady;
}

/// @nodoc

class _$PasswordResetReady extends PasswordResetReady {
  const _$PasswordResetReady() : super._();

  @override
  String toString() {
    return 'InitiatePasswordResetState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetReady);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)
        error,
    required TResult Function() loading,
    required TResult Function(String toMail) sent,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordResetReady value) ready,
    required TResult Function(PasswordResetError value) error,
    required TResult Function(PasswordResetLoading value) loading,
    required TResult Function(PasswordResetSent value) sent,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class PasswordResetReady extends InitiatePasswordResetState {
  const factory PasswordResetReady() = _$PasswordResetReady;
  const PasswordResetReady._() : super._();
}

/// @nodoc
abstract class $PasswordResetErrorCopyWith<$Res> {
  factory $PasswordResetErrorCopyWith(
          PasswordResetError value, $Res Function(PasswordResetError) then) =
      _$PasswordResetErrorCopyWithImpl<$Res>;
  $Res call({LocalizedString? emailError, LocalizedString? generalError});
}

/// @nodoc
class _$PasswordResetErrorCopyWithImpl<$Res>
    extends _$InitiatePasswordResetStateCopyWithImpl<$Res>
    implements $PasswordResetErrorCopyWith<$Res> {
  _$PasswordResetErrorCopyWithImpl(
      PasswordResetError _value, $Res Function(PasswordResetError) _then)
      : super(_value, (v) => _then(v as PasswordResetError));

  @override
  PasswordResetError get _value => super._value as PasswordResetError;

  @override
  $Res call({
    Object? emailError = freezed,
    Object? generalError = freezed,
  }) {
    return _then(PasswordResetError(
      emailError: emailError == freezed
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as LocalizedString?,
      generalError: generalError == freezed
          ? _value.generalError
          : generalError // ignore: cast_nullable_to_non_nullable
              as LocalizedString?,
    ));
  }
}

/// @nodoc

class _$PasswordResetError extends PasswordResetError {
  const _$PasswordResetError({this.emailError, this.generalError}) : super._();

  @override
  final LocalizedString? emailError;
  @override
  final LocalizedString? generalError;

  @override
  String toString() {
    return 'InitiatePasswordResetState.error(emailError: $emailError, generalError: $generalError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PasswordResetError &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.generalError, generalError) ||
                other.generalError == generalError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailError, generalError);

  @JsonKey(ignore: true)
  @override
  $PasswordResetErrorCopyWith<PasswordResetError> get copyWith =>
      _$PasswordResetErrorCopyWithImpl<PasswordResetError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)
        error,
    required TResult Function() loading,
    required TResult Function(String toMail) sent,
  }) {
    return error(emailError, generalError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
  }) {
    return error?.call(emailError, generalError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(emailError, generalError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordResetReady value) ready,
    required TResult Function(PasswordResetError value) error,
    required TResult Function(PasswordResetLoading value) loading,
    required TResult Function(PasswordResetSent value) sent,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PasswordResetError extends InitiatePasswordResetState {
  const factory PasswordResetError(
      {LocalizedString? emailError,
      LocalizedString? generalError}) = _$PasswordResetError;
  const PasswordResetError._() : super._();

  LocalizedString? get emailError;
  LocalizedString? get generalError;
  @JsonKey(ignore: true)
  $PasswordResetErrorCopyWith<PasswordResetError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetLoadingCopyWith<$Res> {
  factory $PasswordResetLoadingCopyWith(PasswordResetLoading value,
          $Res Function(PasswordResetLoading) then) =
      _$PasswordResetLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordResetLoadingCopyWithImpl<$Res>
    extends _$InitiatePasswordResetStateCopyWithImpl<$Res>
    implements $PasswordResetLoadingCopyWith<$Res> {
  _$PasswordResetLoadingCopyWithImpl(
      PasswordResetLoading _value, $Res Function(PasswordResetLoading) _then)
      : super(_value, (v) => _then(v as PasswordResetLoading));

  @override
  PasswordResetLoading get _value => super._value as PasswordResetLoading;
}

/// @nodoc

class _$PasswordResetLoading extends PasswordResetLoading {
  const _$PasswordResetLoading() : super._();

  @override
  String toString() {
    return 'InitiatePasswordResetState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)
        error,
    required TResult Function() loading,
    required TResult Function(String toMail) sent,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
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
    required TResult Function(PasswordResetReady value) ready,
    required TResult Function(PasswordResetError value) error,
    required TResult Function(PasswordResetLoading value) loading,
    required TResult Function(PasswordResetSent value) sent,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PasswordResetLoading extends InitiatePasswordResetState {
  const factory PasswordResetLoading() = _$PasswordResetLoading;
  const PasswordResetLoading._() : super._();
}

/// @nodoc
abstract class $PasswordResetSentCopyWith<$Res> {
  factory $PasswordResetSentCopyWith(
          PasswordResetSent value, $Res Function(PasswordResetSent) then) =
      _$PasswordResetSentCopyWithImpl<$Res>;
  $Res call({String toMail});
}

/// @nodoc
class _$PasswordResetSentCopyWithImpl<$Res>
    extends _$InitiatePasswordResetStateCopyWithImpl<$Res>
    implements $PasswordResetSentCopyWith<$Res> {
  _$PasswordResetSentCopyWithImpl(
      PasswordResetSent _value, $Res Function(PasswordResetSent) _then)
      : super(_value, (v) => _then(v as PasswordResetSent));

  @override
  PasswordResetSent get _value => super._value as PasswordResetSent;

  @override
  $Res call({
    Object? toMail = freezed,
  }) {
    return _then(PasswordResetSent(
      toMail: toMail == freezed
          ? _value.toMail
          : toMail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordResetSent extends PasswordResetSent {
  const _$PasswordResetSent({required this.toMail}) : super._();

  @override

  /// The email the password reset link was sent to
  final String toMail;

  @override
  String toString() {
    return 'InitiatePasswordResetState.sent(toMail: $toMail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PasswordResetSent &&
            (identical(other.toMail, toMail) || other.toMail == toMail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toMail);

  @JsonKey(ignore: true)
  @override
  $PasswordResetSentCopyWith<PasswordResetSent> get copyWith =>
      _$PasswordResetSentCopyWithImpl<PasswordResetSent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ready,
    required TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)
        error,
    required TResult Function() loading,
    required TResult Function(String toMail) sent,
  }) {
    return sent(toMail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
  }) {
    return sent?.call(toMail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ready,
    TResult Function(
            LocalizedString? emailError, LocalizedString? generalError)?
        error,
    TResult Function()? loading,
    TResult Function(String toMail)? sent,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(toMail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordResetReady value) ready,
    required TResult Function(PasswordResetError value) error,
    required TResult Function(PasswordResetLoading value) loading,
    required TResult Function(PasswordResetSent value) sent,
  }) {
    return sent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
  }) {
    return sent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordResetReady value)? ready,
    TResult Function(PasswordResetError value)? error,
    TResult Function(PasswordResetLoading value)? loading,
    TResult Function(PasswordResetSent value)? sent,
    required TResult orElse(),
  }) {
    if (sent != null) {
      return sent(this);
    }
    return orElse();
  }
}

abstract class PasswordResetSent extends InitiatePasswordResetState {
  const factory PasswordResetSent({required String toMail}) =
      _$PasswordResetSent;
  const PasswordResetSent._() : super._();

  /// The email the password reset link was sent to
  String get toMail;
  @JsonKey(ignore: true)
  $PasswordResetSentCopyWith<PasswordResetSent> get copyWith =>
      throw _privateConstructorUsedError;
}
