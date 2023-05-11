import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wedplan/views/login.dart';

void main() {
  testWidgets('login halaman WedPlan', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextFormField), findsWidgets);
    expect(find.byType(ElevatedButton), findsWidgets);
  });
}
