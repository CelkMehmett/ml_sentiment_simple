import 'package:ml_sentiment_simple/ml_sentiment_simple.dart';

void main() {
  final analyzer = SentimentAnalyzer(
    lexicon: WordSentimentLexicon(
      language: LexiconLanguage.both,
      customPositiveWords: {'delightful'},
      customNegativeWords: {'horrendous'},
    ),
  );

  const text = "This product is absolutely amazing and delightful, but the delivery was horrendous.";
  final result = analyzer.analyze(text);

  print(result); // Output: Label: positive, Score: 0.33, ...
}
