// lib/services/gemini_service.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:k3vo_generator/k3vo_generator.dart';

class GeminiService {
  GeminiService(String apiKey)
    : _apiKey = apiKey,
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://generativelanguage.googleapis.com/v1beta',
          headers: {
            'Content-Type': 'application/json',
            'X-goog-api-key': apiKey,
          },
        ),
      );
  final Dio dio;
  final String _apiKey;

  Future<List<Map<String, dynamic>>> generateDomains(
    GeneratorOptions options,
  ) async {
    final prompt = _buildPrompt(options);

    final response = await dio.post(
      '/models/gemini-2.0-flash:generateContent',
      data: {
        'contents': [
          {
            'parts': [
              {'text': prompt},
            ],
          },
        ],
      },
    );

    if (kDebugMode) {
      debugPrint('Sending prompt to Gemini:\n$prompt');
    }

    if (response.statusCode != 200) {
      throw Exception('Gemini error: ${response.statusCode}');
    }

    final rawText =
        response.data['candidates']?[0]?['content']?['parts']?[0]?['text']
            as String?;
    if (rawText == null) {
      throw Exception('No response from Gemini.');
    }

    if (kDebugMode) {
      debugPrint('Gemini API Raw Response: $rawText');
    }

    try {
      final cleanJson = rawText
          .replaceAll('```json', '')
          .replaceAll('```', '')
          .trim();
      final decoded = jsonDecode(cleanJson);
      final suggestions = decoded['domain_suggestions'] as List<dynamic>?;
      if (suggestions == null) {
        throw Exception('Missing domain_suggestions field');
      }

      return suggestions
          .map<Map<String, dynamic>>(
            (entry) => {
              'domain': entry['domain'],
              'rationale': entry['rationale'],
              'available': null,
            },
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to parse Gemini JSON response: $e');
    }
  }

  String _buildPrompt(GeneratorOptions opts) {
    final langPrompt = switch (opts.language) {
      'fr' => 'Réponds en français.',
      'sw' => 'Jibu kwa Kiswahili.',
      _ => 'Respond in English.',
    };

    final prompt =
        '''
Generate 10 unique domain name suggestions making use of the Kenya Top-Level Domains (TLDs) like .ke, .co.ke, .me.ke, .or.ke, .info.ke, .biz.ke etc (depending on the context) for a ${opts.useCase.toLowerCase()} idea based in ${opts.location}.
The names should be ${opts.length.toLowerCase()}, ${opts.style.toLowerCase()}, 
and relate to the keyword \\"${opts.keyword}\\".
Return the results as a JSON array under the key domain_suggestions. Each item 
should have \\"domain\\" and \\"rationale\\" fields.
Do not include any explanation or markdown formatting. Just return JSON.
$langPrompt
''';

    if (kDebugMode) {
      debugPrint('Prompt to Gemini:\n$prompt');
    }

    return prompt;
  }
}
