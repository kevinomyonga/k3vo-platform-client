import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_generator/k3vo_generator.dart';

class Domain {
  Domain({required this.name, this.rationale});
  final String name;
  final String? rationale;
}

class DomainStore {
  DomainStore._privateConstructor();
  static final DomainStore instance = DomainStore._privateConstructor();

  final List<Domain> _domains = [];

  List<Domain> get domains => List.unmodifiable(_domains);

  void addDomain(Domain domain) {
    _domains.add(domain);
  }

  void removeDomain(String name) {
    _domains.removeWhere((d) => d.name == name);
  }
}

class DomainsScreen extends StatefulWidget {
  const DomainsScreen({super.key});

  @override
  State<DomainsScreen> createState() => _DomainsScreenState();
}

class _DomainsScreenState extends State<DomainsScreen> {
  @override
  Widget build(BuildContext context) {
    final domains = DomainStore.instance.domains;
    final l10n = context.k3voL10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.domainsScreen_title)),
      body: domains.isEmpty
          ? Center(
              child: Text(
                l10n.domainsScreen_empty,
                style: const TextStyle(fontSize: 16),
              ),
            )
          : ListView.separated(
              itemCount: domains.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final domain = domains[index];
                return Dismissible(
                  key: Key(domain.name),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(l10n.domainsScreen_deleteTitle),
                        content: Text(
                          l10n.domainsScreen_deleteConfirm(domain.name),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pop(false),
                            child: Text(l10n.cancel),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(
                              context,
                              rootNavigator: true,
                            ).pop(true),
                            child: Text(l10n.delete),
                          ),
                        ],
                      ),
                    );
                    return result ?? false;
                  },
                  onDismissed: (_) {
                    setState(() {
                      DomainStore.instance.removeDomain(domain.name);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.domainsScreen_deleted(domain.name)),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      domain.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: domain.rationale != null
                        ? Text(domain.rationale!)
                        : null,
                    onTap: () => showRegistrarBottomSheet(context, domain.name),
                  ),
                );
              },
            ),
    );
  }
}
