import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_generator/src/models/generator_options.dart';
import 'package:k3vo_generator/src/screens/suggestions_list.dart';
import 'package:k3vo_generator/src/services/services.dart';

class GeneratorWizardScreen extends StatefulWidget {
  const GeneratorWizardScreen({super.key});

  @override
  State<GeneratorWizardScreen> createState() => _GeneratorWizardScreenState();
}

class _GeneratorWizardScreenState extends State<GeneratorWizardScreen> {
  String? useCase;
  String? length;
  String? style;
  String? language = 'en';
  final locationController = TextEditingController();
  final keywordController = TextEditingController();
  // final openAiService = OpenAIService('openai-api-key');
  final geminiService = GeminiService(
    K3voFoundation.env.geminiApiKey,
  );
  List<Map<String, dynamic>> suggestions = [];
  bool isLoading = false;

  final useCases = ['Personal', 'Business', 'Event', 'Social'];
  final lengths = ['Short', 'Medium', 'Long'];
  final styles = ['Creative', 'Professional', 'Fun'];
  final languages = {'English': 'en', 'French': 'fr', 'Swahili': 'sw'};

  bool get isReady =>
      useCase != null &&
      length != null &&
      style != null &&
      locationController.text.isNotEmpty &&
      keywordController.text.isNotEmpty &&
      language != null;

  @override
  void dispose() {
    locationController.dispose();
    keywordController.dispose();
    super.dispose();
  }

  Future<void> _handleGenerate() async {
    final options = GeneratorOptions(
      useCase: useCase!,
      length: length!,
      style: style!,
      location: locationController.text.trim(),
      keyword: keywordController.text.trim(),
      language: language!,
    );

    setState(() => isLoading = true);
    try {
      // final result = await openAiService.generateDomains(options);
      final result = await geminiService.generateDomains(options);
      setState(() => suggestions = result);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));

      if (kDebugMode) {
        debugPrint('Error Generating Domains: $e');
      }
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Domain Name Generator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepTitle('1. What is the domain for?'),
            _buildChips(
              useCases,
              useCase,
              (value) => setState(() => useCase = value),
            ),

            _buildStepTitle('2. Preferred domain length:'),
            _buildChips(
              lengths,
              length,
              (value) => setState(() => length = value),
            ),

            _buildStepTitle('3. Preferred style:'),
            _buildChips(
              styles,
              style,
              (value) => setState(() => style = value),
            ),

            _buildStepTitle('4. Location:'),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'e.g. Nairobi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            _buildStepTitle('5. Keyword (idea):'),
            TextField(
              controller: keywordController,
              decoration: InputDecoration(
                hintText: 'e.g. agriculture, fintech',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            _buildStepTitle('6. Language:'),
            DropdownButtonFormField<String>(
              value: language,
              items: languages.entries
                  .map(
                    (entry) => DropdownMenuItem(
                      value: entry.value,
                      child: Text(entry.key),
                    ),
                  )
                  .toList(),
              onChanged: (value) => setState(() => language = value),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isReady && !isLoading ? _handleGenerate : null,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Generate'),
              ),
            ),

            if (suggestions.isNotEmpty) ...[
              const SizedBox(height: 32),
              const Text(
                'Suggestions:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SuggestionsList(
                suggestions: suggestions,
                onCheckAvailability: (domain) {
                  // You can integrate WHOIS check here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Checking $domain...')),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStepTitle(String text) => Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 8),
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
  );

  Widget _buildChips(
    List<String> options,
    String? selected,
    Function(String) onSelected,
  ) => Wrap(
    spacing: 8,
    children: options
        .map(
          (opt) => ChoiceChip(
            label: Text(opt),
            selected: selected == opt,
            onSelected: (_) => onSelected(opt),
          ),
        )
        .toList(),
  );
}
