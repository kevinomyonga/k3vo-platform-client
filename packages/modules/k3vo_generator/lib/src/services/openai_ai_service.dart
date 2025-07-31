import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:k3vo_generator/k3vo_generator.dart';

class OpenAIService {
  OpenAIService(String apiKey)
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.openai.com/v1',
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
        ),
      );
  final Dio dio;

  Future<List<String>> generateDomains(GeneratorOptions options) async {
    final prompt = _buildPrompt(options);

    final response = await dio.post(
      '/chat/completions',
      data: {
        'model': 'gpt-4.1',
        'messages': [
          {
            'role': 'system',
            'content':
                'You are a helpful assistant that generates domain name suggestions.',
          },
          {'role': 'user', 'content': prompt},
        ],
        'temperature': 0.8,
        'max_tokens': 300,
      },
    );

    final data = response.data;

    if (kDebugMode) {
      debugPrint('OpenAI API Response: $data');
    }

    final content = data['choices'][0]['message']['content'] as String;

    return content
        .split('\n')
        .map((line) => line.replaceAll(RegExp(r'^[\\d\\.\\-\\s]*'), '').trim())
        .where((line) => line.isNotEmpty)
        .toList();
  }

  String _buildPrompt(GeneratorOptions opts) {
    final langPrompt = switch (opts.language) {
      'fr' => 'Réponds en français.',
      'sw' => 'Jibu kwa Kiswahili.',
      _ => 'Respond in English.',
    };

    return '''
Generate 10 unique domain name suggestions for a ${opts.useCase.toLowerCase()} idea based in ${opts.location}.
The names should be ${opts.length.toLowerCase()}, ${opts.style.toLowerCase()}, and relate to the keyword "${opts.keyword}".
Only list the domain name suggestions. Do not include explanations. Use Kenyan TLDs like .ke, .co.ke, .me.ke if possible.
$langPrompt
''';
  }
}
