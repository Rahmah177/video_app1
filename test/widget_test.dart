import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:video_app2/main.dart'; // تأكد من مسار الاستيراد الصحيح

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // بناء التطبيق
    await tester.pumpWidget(MyApp());

    // التحقق من أن العداد يبدأ عند 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // النقر على أيقونة '+' وتحفيز الإطار
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // التحقق من أن العداد قد ازداد
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
