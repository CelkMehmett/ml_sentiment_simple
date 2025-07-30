import 'package:test/test.dart';
import 'package:ml_sentiment_simple/ml_sentiment_simple.dart';

void main() {
  group('SentimentAnalyzer', () {
    final analyzer = SentimentAnalyzer();

    test('should return positive sentiment', () {
      final result = analyzer.analyze('I feel great and awesome!');
      expect(result.label, equals('positive'));
    });

    test('should return negative sentiment', () {
      final result = analyzer.analyze('This is a terrible and bad day.');
      expect(result.label, equals('negative'));
    });

    test('should return neutral sentiment', () {
      final result = analyzer.analyze('The sky is blue and the grass is green.');
      expect(result.label, equals('neutral'));
    });
  });
}
