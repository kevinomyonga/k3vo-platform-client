import 'package:flutter/material.dart';
import 'package:k3vo_data/k3vo_data.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

class LookupScreen extends StatefulWidget {
  const LookupScreen({super.key});

  @override
  State<LookupScreen> createState() => _LookupScreenState();
}

class _LookupScreenState extends State<LookupScreen> {
  final TextEditingController _controller = TextEditingController();
  final WhoisRepository _repo = WhoisRepository();

  bool _isLoading = false;
  Map<String, dynamic>? _data;
  String? _error;

  Future<void> _lookupDomain() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _data = null;
      _error = null;
    });

    try {
      final result = await _repo.lookupDomain(query);

      if (result.containsKey('error')) {
        setState(() {
          _error = result['error'] as String?;
        });
      } else {
        setState(() {
          _data = result;
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 600;
    final l10n = context.k3voL10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.lookupScreen_title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: l10n.lookupScreen_enterDomain,
                hintText: l10n.lookupScreen_enterDomainHint,
                prefixIcon: const Icon(Icons.domain),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (_) => _lookupDomain(),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _lookupDomain,
              icon: const Icon(Icons.search),
              label: Text(l10n.lookupScreen_checkButton),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_isLoading)
              Center(child: Text(l10n.lookupScreen_loading))
            else if (_error != null)
              Text(
                context.k3voL10n.lookupScreen_error(_error!),
                style: const TextStyle(color: Colors.red, fontSize: 16),
              )
            else if (_data != null)
              Expanded(
                child: SingleChildScrollView(
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildDomainInfo(_data!, l10n)),
                            const SizedBox(width: 16),
                            Expanded(child: _buildRegistrantInfo(_data!, l10n)),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: _buildDomainInfo(_data!, l10n),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: _buildRegistrantInfo(_data!, l10n),
                            ),
                          ],
                        ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDomainInfo(Map<String, dynamic> data, dynamic l10n) {
    final domain = data['domain'];
    final hasError = data.containsKey('error');
    final query = _controller.text.trim();

    final isAvailable = hasError && _isValidDomainFormat(query);

    String formatList(List<dynamic> list) => list.join(', ');

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              query,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              isAvailable
                  ? context.k3voL10n.lookupScreen_available
                  : context.k3voL10n.lookupScreen_registered,
              style: TextStyle(
                color: isAvailable ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (!isAvailable && domain != null) ...[
              Text(
                context.k3voL10n.lookupScreen_created(
                  (domain['created_date'] ?? '').toString(),
                ),
              ),
              Text(
                context.k3voL10n.lookupScreen_updated(
                  (domain['updated_date'] ?? '').toString(),
                ),
              ),
              Text(
                context.k3voL10n.lookupScreen_expires(
                  (domain['expiration_date'] ?? '').toString(),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                context.k3voL10n.lookupScreen_status(
                  formatList(
                    (domain['status'] is List)
                        ? domain['status'] as List<dynamic>
                        : [],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                context.k3voL10n.lookupScreen_nameServers(
                  formatList(
                    domain['name_servers'] is List
                        ? domain['name_servers'] as List<dynamic>
                        : [],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Widget _buildDomainInfo(Map<String, dynamic> data, dynamic l10n) {
  //   final domain = data['domain'];
  //   if (domain == null) return const SizedBox();

  //   final hasError = data.containsKey('error');

  //   // Domain is available if WHOIS returned an error, but the domain format is valid
  //   final isAvailable =
  //       hasError && _isValidDomainFormat(_controller.text.trim());

  //   String formatList(List<dynamic> list) => list.join(', ');

  //   return Card(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     elevation: 3,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             domain['domain'] as String? ?? '',
  //             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 8),
  //           Text(
  //             isAvailable
  //                 ? context.k3voL10n.lookupScreen_available
  //                 : context.k3voL10n.lookupScreen_registered,
  //             style: TextStyle(
  //               color: isAvailable ? Colors.green : Colors.red,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           const SizedBox(height: 12),
  //           if (!isAvailable) ...[
  //             Text(
  //               context.k3voL10n.lookupScreen_created(
  //                 (domain['created_date'] ?? '').toString(),
  //               ),
  //             ),
  //             Text(
  //               context.k3voL10n.lookupScreen_updated(
  //                 (domain['updated_date'] ?? '').toString(),
  //               ),
  //             ),
  //             Text(
  //               context.k3voL10n.lookupScreen_expires(
  //                 (domain['expiration_date'] ?? '').toString(),
  //               ),
  //             ),
  //             const SizedBox(height: 8),
  //             Text(
  //               context.k3voL10n.lookupScreen_status(
  //                 formatList(
  //                   (domain['status'] is List)
  //                       ? domain['status'] as List<dynamic>
  //                       : [],
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 8),
  //             Text(
  //               context.k3voL10n.lookupScreen_nameServers(
  //                 formatList(
  //                   domain['name_servers'] is List
  //                       ? domain['name_servers'] as List<dynamic>
  //                       : [],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildRegistrantInfo(Map<String, dynamic> data, dynamic l10n) {
    final registrant = data['registrant'];
    final registrar = data['registrar'];

    if (registrant == null || registrar == null) return const SizedBox();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.k3voL10n.lookupScreen_registrantInfo,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              context.k3voL10n.lookupScreen_registrantName(
                (registrant['name'] ?? '').toString(),
              ),
            ),
            Text(
              context.k3voL10n.lookupScreen_registrantEmail(
                (registrant['email'] ?? '').toString(),
              ),
            ),
            Text(
              context.k3voL10n.lookupScreen_registrantPhone(
                (registrant['phone'] ?? '').toString(),
              ),
            ),
            Text(
              context.k3voL10n.lookupScreen_registrantCountry(
                (registrant['country'] ?? '').toString(),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.k3voL10n.lookupScreen_registrarInfo,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              context.k3voL10n.lookupScreen_registrarName(
                (registrar['name'] ?? '').toString(),
              ),
            ),
            Text(
              context.k3voL10n.lookupScreen_registrarEmail(
                (registrar['email'] ?? '').toString(),
              ),
            ),
            Text(
              context.k3voL10n.lookupScreen_registrarPhone(
                (registrar['phone'] ?? '').toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidDomainFormat(String domain) {
    final regex = RegExp(r'^[a-zA-Z0-9-]{1,63}\.[a-zA-Z]{2,}$');
    return regex.hasMatch(domain);
  }
}
