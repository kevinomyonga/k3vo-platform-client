class GeneratorOptions {

  GeneratorOptions({
    required this.useCase,
    required this.length,
    required this.style,
    required this.location,
    required this.keyword,
    required this.language,
  });
  final String useCase;
  final String length;
  final String style;
  final String location;
  final String keyword;
  final String language;

  Map<String, dynamic> toJson() => {
    'useCase': useCase,
    'length': length,
    'style': style,
    'location': location,
    'keyword': keyword,
    'language': language,
  };

  @override
  String toString() =>
      r'Use: $useCase, Length: $length, Style: $style, Location: $location, Keyword: $keyword, Language: $language';
}
