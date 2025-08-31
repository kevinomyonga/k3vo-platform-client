import 'package:flutter/material.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class SuggestionsList extends StatelessWidget {
  const SuggestionsList({
    required this.suggestions,
    required this.onCheckAvailability,
    super.key,
  });
  final List<Map<String, dynamic>> suggestions;
  final void Function(String) onCheckAvailability;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: suggestions.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        final domain = suggestion['domain'] as String;
        final rationale = suggestion['rationale'] as String?;

        return ListTile(
          title: K3voText(
            text: domain,
            fontWeight: FontWeight.bold,
          ),
          subtitle: rationale != null ? Text(rationale) : null,
          trailing: ElevatedButton(
            onPressed: () => onCheckAvailability(domain),
            child: const Text('Check'),
          ),
        );
      },
    );
  }
}
