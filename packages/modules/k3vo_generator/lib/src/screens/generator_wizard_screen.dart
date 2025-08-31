import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:k3vo_data/k3vo_data.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_generator/src/models/generator_options.dart';
import 'package:k3vo_generator/src/screens/suggestions_list.dart';
import 'package:k3vo_generator/src/services/services.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

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
  final geminiService = GeminiService(K3voFoundation.env.geminiApiKey);

  List<Map<String, dynamic>> suggestions = [];
  bool isLoading = false;

  late final List<String> useCases = [
    context.k3voL10n.personal,
    context.k3voL10n.business,
    context.k3voL10n.event,
    context.k3voL10n.social,
  ];

  late final List<String> lengths = [
    context.k3voL10n.short,
    context.k3voL10n.medium,
    context.k3voL10n.long,
  ];

  late final List<String> styles = [
    context.k3voL10n.creative,
    context.k3voL10n.professional,
    context.k3voL10n.fun,
  ];

  late final Map<String, String> languages = {
    context.k3voL10n.english: 'en',
    context.k3voL10n.french: 'fr',
    context.k3voL10n.swahili: 'sw',
  };

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
      final result = await geminiService.generateDomains(options);
      setState(() => suggestions = result);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${context.k3voL10n.generatorWizard_errorPrefix}: $e')),
      );
      if (kDebugMode) debugPrint('Error Generating Domains: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepTitle(context.k3voL10n.generatorWizard_step1),
        _buildChips(useCases, useCase, (v) => setState(() => useCase = v)),
        _buildStepTitle(context.k3voL10n.generatorWizard_step2),
        _buildChips(lengths, length, (v) => setState(() => length = v)),
        _buildStepTitle(context.k3voL10n.generatorWizard_step3),
        _buildChips(styles, style, (v) => setState(() => style = v)),
        _buildStepTitle(context.k3voL10n.generatorWizard_step4),
        TextField(
          controller: locationController,
          decoration: InputDecoration(
            hintText: context.k3voL10n.generatorWizard_locationHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        _buildStepTitle(context.k3voL10n.generatorWizard_step5),
        TextField(
          controller: keywordController,
          decoration: InputDecoration(
            hintText: context.k3voL10n.generatorWizard_keywordHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        _buildStepTitle(context.k3voL10n.generatorWizard_step6),
        DropdownButtonFormField<String>(
          value: language,
          items: languages.entries
              .map((e) => DropdownMenuItem(value: e.value, child: Text(e.key)))
              .toList(),
          onChanged: (v) => setState(() => language = v),
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
                : Text(context.k3voL10n.generatorWizard_generateButton),
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionsList({
    bool isInScrollableParent = true,
  }) {
    if (suggestions.isEmpty) {
      return Center(
        child: Text(context.k3voL10n.generatorWizard_noSuggestions),
      );
    }

    return SuggestionsList(
      suggestions: suggestions,
      domainRepository: DomainRepository(),
      onCheckAvailability: (domain) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${context.k3voL10n.generatorWizard_checkingDomain} $domain...')),
        );
      },
      isInScrollableParent: isInScrollableParent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 650;

    return Scaffold(
      appBar: AppBar(title: Text(context.k3voL10n.generatorWizard_title)),
      body: isWide
          ? K3voSplitLayout(
              startPane: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: _buildForm(),
              ),
              endPane: Padding(
                padding: const EdgeInsets.all(16),
                child: _buildSuggestionsList(isInScrollableParent: false),
              ),
            )
          : Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: _buildForm(),
                ),
                if (suggestions.isNotEmpty)
                  DraggableScrollableSheet(
                    minChildSize: 0.2,
                    maxChildSize: 0.9,
                    initialChildSize: 0.3,
                    builder: (context, controller) => Material(
                      elevation: 12,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 6,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              controller: controller,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    context.k3voL10n.generatorWizard_suggestionsTitle,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                _buildSuggestionsList(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
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
  ) =>
      Wrap(
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
