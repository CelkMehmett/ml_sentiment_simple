# 📊 ml_sentiment_simple

**ml_sentiment_simple** is a lightweight and multilingual (🇹🇷 Turkish + 🇺🇸 English) word-level sentiment analysis library for Dart and Flutter.  
It analyzes a given text and classifies it as **positive**, **negative**, or **neutral** based on predefined sentiment lexicons.

---

## ✅ Features

- 📦 Simple word-based sentiment classification
- 🌐 Supports Turkish, English, or both
- 🧩 Easily extendable with custom word lists
- ⚡ Zero dependencies, blazing fast
- ✅ Fully tested and production-ready

---

## 🚀 Installation

Add the following line to your `pubspec.yaml`:

```yaml
dependencies:
  ml_sentiment_simple: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 💡 Usage

```dart
import 'package:ml_sentiment_simple/ml_sentiment_simple.dart';

void main() {
  final analyzer = SentimentAnalyzer();

  final result = analyzer.analyze("This is awesome but also terrible.");
  print(result); // Label: neutral, Score: 0.0, ...
}
```

You can also customize the lexicon:

```dart
final customAnalyzer = SentimentAnalyzer(
  lexicon: WordSentimentLexicon(
    language: LexiconLanguage.both,
    customPositiveWords: {'wonderful'},
    customNegativeWords: {'disaster'},
  ),
);

final result = customAnalyzer.analyze("It was a wonderful disaster.");
print(result); // Label: neutral, Score: 0.0
```

---

## 🧪 Testing

To run unit tests:

```bash
dart test
```

---

## 📚 API

### `SentimentAnalyzer`
Main entry point for analyzing sentences.

### `WordSentimentLexicon`
Contains sentiment word lists (positive/negative), can be customized.

### `LexiconLanguage`
Enum to specify language: `turkish`, `english`, or `both`.

### `SentimentResult`
Model class with fields: `label`, `score`, `positiveCount`, `negativeCount`, `totalWords`.

---

## 📄 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

Developed by [Mehmet Çelik](https://github.com/CelkMehmett)