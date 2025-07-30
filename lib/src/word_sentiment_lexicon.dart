/// Supported lexicon languages for sentiment analysis.
enum LexiconLanguage { turkish, english, both }

/// A multilingual (Turkish + English) word-level sentiment lexicon.
///
/// Allows built-in word lists and optional custom vocabulary extension.
class WordSentimentLexicon {
  // --- Default Turkish word lists ---
  static final Set<String> _turkishPositive = {
    'iyi', 'güzel', 'harika', 'mükemmel', 'mutlu', 'pozitif',
    'hoş', 'başarılı', 'sevgi', 'keyifli', 'neşeli', 'şahane'
  };

  static final Set<String> _turkishNegative = {
    'kötü', 'berbat', 'rezalet', 'mutsuz', 'negatif', 'çirkin',
    'nefret', 'korkunç', 'üzücü', 'kayıp', 'vasat', 'iğrenç'
  };

  // --- Default English word lists ---
  static final Set<String> _englishPositive = {
    'good', 'great', 'awesome', 'excellent', 'happy', 'positive',
    'nice', 'love', 'joyful', 'beautiful', 'amazing', 'fantastic'
  };

  static final Set<String> _englishNegative = {
    'bad', 'terrible', 'awful', 'sad', 'negative', 'ugly',
    'hate', 'horrible', 'disappointing', 'loss', 'poor', 'worst'
  };

  /// Combined positive words used by the analyzer.
  final Set<String> positiveWords;

  /// Combined negative words used by the analyzer.
  final Set<String> negativeWords;

  /// Creates a [WordSentimentLexicon] using the selected [language] option.
  ///
  /// You can provide additional [customPositiveWords] and [customNegativeWords]
  /// to expand the built-in lexicon.
  WordSentimentLexicon({
    LexiconLanguage language = LexiconLanguage.both,
    Set<String>? customPositiveWords,
    Set<String>? customNegativeWords,
  })  : positiveWords = _buildPositive(language, customPositiveWords),
        negativeWords = _buildNegative(language, customNegativeWords);

  /// Merges built-in and custom positive words based on language option.
  static Set<String> _buildPositive(
      LexiconLanguage lang, Set<String>? custom) {
    final base = <String>{};
    if (lang == LexiconLanguage.turkish || lang == LexiconLanguage.both) {
      base.addAll(_turkishPositive);
    }
    if (lang == LexiconLanguage.english || lang == LexiconLanguage.both) {
      base.addAll(_englishPositive);
    }
    if (custom != null) base.addAll(custom);
    return base;
  }

  /// Merges built-in and custom negative words based on language option.
  static Set<String> _buildNegative(
      LexiconLanguage lang, Set<String>? custom) {
    final base = <String>{};
    if (lang == LexiconLanguage.turkish || lang == LexiconLanguage.both) {
      base.addAll(_turkishNegative);
    }
    if (lang == LexiconLanguage.english || lang == LexiconLanguage.both) {
      base.addAll(_englishNegative);
    }
    if (custom != null) base.addAll(custom);
    return base;
  }

  /// Returns the sentiment of a [word]: 'positive', 'negative', or 'neutral'.
  String analyzeWord(String word) {
    final normalized = word.toLowerCase().trim();
    if (positiveWords.contains(normalized)) return 'positive';
    if (negativeWords.contains(normalized)) return 'negative';
    return 'neutral';
  }

  /// Checks if a [word] is labeled as positive.
  bool isPositive(String word) =>
      positiveWords.contains(word.toLowerCase().trim());

  /// Checks if a [word] is labeled as negative.
  bool isNegative(String word) =>
      negativeWords.contains(word.toLowerCase().trim());
}
