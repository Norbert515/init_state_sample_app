

import 'package:sample_app/modules/authentication/modules/password_reset/modules/initiate_password_reset/widgets/check_email_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../../utils/common.dart';

void main() {

  testWidgets('Shows email', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: CheckEmailPageContent(email: 'mymail@mail.com'),
    );
    expect(find.textContaining('mymail@mail.com'), findsOneWidget);
  });
}