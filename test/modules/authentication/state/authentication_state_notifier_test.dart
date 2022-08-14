import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_app/modules/authentication/state/authentication_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_app/utils/navigation_refresh.dart';

import '../../../utils/mock.dart';

class MockNavigationChangeNotifier extends Mock
    implements NavigationChangeNotifier {}

void main() {
  late AuthenticationStateNotifier notifier;
  late MockUser mockUser;
  late MockUser mockUser2;
  late MockFirebaseAuth firebaseAuthMock;
  late MockNavigationChangeNotifier navigationChangeNotifier;

  var userId = 'id';
  var userId2 = 'id2';

  setUp(() {
    mockUser = MockUser();
    mockUser2 = MockUser();

    navigationChangeNotifier = MockNavigationChangeNotifier();
    firebaseAuthMock = MockFirebaseAuth();

    when(() => mockUser.uid).thenReturn(userId);
    when(() => mockUser2.uid).thenReturn(userId2);
  });

  test('Is unauthenticated if no user is in firebase', () async {
    when(firebaseAuthMock.userChanges)
        .thenAnswer((invocation) => Stream.empty());
    when(() => firebaseAuthMock.currentUser).thenReturn(null);

    notifier =
        AuthenticationStateNotifier(firebaseAuthMock, navigationChangeNotifier);

    expect(notifier.debugState.isAuthenticated, false);
  });

  test('Is authenticated if default user is set', () async {
    when(firebaseAuthMock.userChanges)
        .thenAnswer((invocation) => Stream.empty());
    when(() => firebaseAuthMock.currentUser).thenReturn(mockUser);

    notifier =
        AuthenticationStateNotifier(firebaseAuthMock, navigationChangeNotifier);

    expect(notifier.debugState.isAuthenticated, true);
    expect(
        (notifier.debugState as AuthenticationAuthenticated).userId == userId,
        true);
  });

  test('Authentication is changed when firebase user stream updates', () async {
    var userStream = Stream.value(mockUser2).asBroadcastStream();

    when(firebaseAuthMock.userChanges).thenAnswer((invocation) => userStream);
    when(() => firebaseAuthMock.currentUser).thenReturn(mockUser);

    notifier =
        AuthenticationStateNotifier(firebaseAuthMock, navigationChangeNotifier);

    expect(notifier.debugState.isAuthenticated, true);
    expect(
        (notifier.debugState as AuthenticationAuthenticated).userId == userId,
        true);

    // Wait for the stream to finish
    await userStream.last;

    expect(notifier.debugState.isAuthenticated, true);
    expect(
        (notifier.debugState as AuthenticationAuthenticated).userId == userId2,
        true);
  });

  test('Firebase stream listener is disposed', () async {
    var controller = StreamController<User?>.broadcast();
    var canceled = false;
    controller.onCancel = () {
      canceled = true;
    };

    when(firebaseAuthMock.userChanges)
        .thenAnswer((invocation) => controller.stream);
    when(() => firebaseAuthMock.currentUser).thenReturn(mockUser);

    notifier =
        AuthenticationStateNotifier(firebaseAuthMock, navigationChangeNotifier);
    notifier.dispose();

    expect(canceled, true);
  });
}
