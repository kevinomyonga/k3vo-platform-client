import 'package:flutter/material.dart';
import 'package:k3vo_data/k3vo_data.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart'; // for context.k3voL10n

enum DomainStatus { idle, checking, available, taken, error }

class SuggestionsList extends StatefulWidget {
  const SuggestionsList({
    required this.suggestions,
    required this.domainRepository,
    required this.onCheckAvailability,
    this.isInScrollableParent = true,
    super.key,
  });

  final List<Map<String, dynamic>> suggestions;
  final DomainRepository domainRepository;
  final void Function(String) onCheckAvailability;
  final bool isInScrollableParent;

  @override
  State<SuggestionsList> createState() => _SuggestionsListState();
}

class _SuggestionsListState extends State<SuggestionsList> {
  final Map<String, DomainStatus> _statusMap = {};

  Future<void> _checkDomain(String domain) async {
    setState(() {
      _statusMap[domain] = DomainStatus.checking;
    });

    try {
      final exists = await widget.domainRepository.checkDomain(domain);
      setState(() {
        _statusMap[domain] = exists
            ? DomainStatus.taken
            : DomainStatus.available;
      });
    } catch (_) {
      setState(() {
        _statusMap[domain] = DomainStatus.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: widget.isInScrollableParent,
      physics: widget.isInScrollableParent
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      itemCount: widget.suggestions.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final suggestion = widget.suggestions[index];
        final domain = suggestion['domain'] as String;
        final rationale = suggestion['rationale'] as String?;
        final status = _statusMap[domain] ?? DomainStatus.idle;

        Widget trailing;
        switch (status) {
          case DomainStatus.idle:
            trailing = ElevatedButton(
              onPressed: () => _checkDomain(domain),
              child: Text(context.k3voL10n.suggestionsList_checkButton),
            );
            break;
          case DomainStatus.checking:
            trailing = const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            );
            break;
          case DomainStatus.available:
            trailing = Tooltip(
              message: context.k3voL10n.suggestionsList_status_available,
              child: const Icon(Icons.check_circle, color: Colors.green),
            );
            break;
          case DomainStatus.taken:
            trailing = Tooltip(
              message: context.k3voL10n.suggestionsList_status_taken,
              child: const Icon(Icons.cancel, color: Colors.red),
            );
            break;
          case DomainStatus.error:
            trailing = Tooltip(
              message: context.k3voL10n.suggestionsList_status_error,
              child: const Icon(Icons.error, color: Colors.orange),
            );
            break;
        }

        return ListTile(
          title: K3voText(
            text: domain,
            fontWeight: FontWeight.bold,
          ),
          subtitle: rationale != null ? Text(rationale) : null,
          trailing: trailing,
        );
      },
    );
  }
}
