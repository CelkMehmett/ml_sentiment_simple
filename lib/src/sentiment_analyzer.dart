import 'word_sentiment_lexicon.dart';

/// Analyzes a given text and classifies its overall sentiment as
/// 'positive', 'negative', or 'neutral' based on word scoring.
class SentimentAnalyzer {
  final WordSentimentLexicon lexicon;

  /// Creates a SentimentAnalyzer with an optional custom lexicon.
  SentimentAnalyzer({WordSentimentLexicon? lexicon})
      : lexicon = lexicon ?? WordSentimentLexicon();

  /// Analyzes the input [text] and returns a [SentimentResult]
  /// containing sentiment label, score, and word counts.
  SentimentResult analyze(String text) {
    final words = _tokenize(text);
    int positiveCount = 0;
    int negativeCount = 0;

    for (final word in words) {
      final sentiment = lexicon.analyzeWord(word);
      if (sentiment == 'positive') positiveCount++;
      if (sentiment == 'negative') negativeCount++;
    }

    final totalSentimentWords = positiveCount + negativeCount;
    final score = totalSentimentWords == 0
        ? 0.0
        : (positiveCount - negativeCount) / totalSentimentWords;

    final label = score > 0
        ? 'positive'
        : score < 0
            ? 'negative'
            : 'neutral';

    return SentimentResult(
      label: label,
      score: score,
      positiveCount: positiveCount,
      negativeCount: negativeCount,
      totalWords: words.length,
    );
  }

  /// Splits the text into words, removing punctuation and extra spaces.
  List<String> _tokenize(String text) {
    final cleaned = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\sçğıöşü]'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    return cleaned.split(' ');
  }
}

/// Stores the result of sentiment analysis, including:
/// - [label]: overall sentiment ('positive', 'negative', 'neutral')
/// - [score]: float between -1.0 and 1.0
/// - [positiveCount], [negativeCount], [totalWords]: analysis stats
class SentimentResult {
  final String label;
  final double score;
  final int positiveCount;
  final int negativeCount;
  final int totalWords;

  SentimentResult({
    required this.label,
    required this.score,
    required this.positiveCount,
    required this.negativeCount,
    required this.totalWords,
  });

  @override
  String toString() {
    return 'Label: $label, Score: ${score.toStringAsFixed(2)}, '
        'Positive: $positiveCount, Negative: $negativeCount, '
        'Total Words: $totalWords';
  }
}
