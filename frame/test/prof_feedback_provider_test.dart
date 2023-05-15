import 'package:flutter_test/flutter_test.dart';
import 'package:frame/Provider/prof_feedback_provider.dart';

void main() {
  test('provider add feedback test', () {
    ProfFeedbackProvider provider = ProfFeedbackProvider();
    provider.addFeedback('test');
    expect('test', provider.feedback[0]);
    provider.addFeedback('value');
    expect('value', provider.feedback.last);
  });
}