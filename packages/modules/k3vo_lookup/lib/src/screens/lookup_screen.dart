import 'package:flutter/material.dart';
import 'package:k3vo_data/k3vo_data.dart';

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

    return Scaffold(
      appBar: AppBar(title: const Text('Domain Lookup')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Domain Name',
                hintText: 'e.g. example.com',
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
              label: const Text('Check'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_error != null)
              Text(
                _error!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              )
            else if (_data != null)
              Expanded(
                child: SingleChildScrollView(
                  child: isWide
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildDomainInfo(_data!)),
                            const SizedBox(width: 16),
                            Expanded(child: _buildRegistrantInfo(_data!)),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: _buildDomainInfo(_data!),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: _buildRegistrantInfo(_data!),
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

  Widget _buildDomainInfo(Map<String, dynamic> data) {
    final domain = data['domain'];
    if (domain == null) return const SizedBox();

    final isAvailable = data.containsKey('error');

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              domain['domain'] as String? ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              isAvailable ? '✅ Available to purchase' : '❌ Already registered',
              style: TextStyle(
                color: isAvailable ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            if (!isAvailable) ...[
              Text("Created: ${domain['created_date']}"),
              Text("Updated: ${domain['updated_date']}"),
              Text("Expires: ${domain['expiration_date']}"),
              const SizedBox(height: 8),
              Text("Status: ${(domain['status'] as List).join(', ')}"),
              const SizedBox(height: 8),
              Text(
                "Name Servers: ${(domain['name_servers'] as List).join(', ')}",
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRegistrantInfo(Map<String, dynamic> data) {
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
            const Text(
              'Registrant Info',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Name: ${registrant['name']}"),
            Text("Email: ${registrant['email']}"),
            Text("Phone: ${registrant['phone']}"),
            Text("Country: ${registrant['country']}"),
            const SizedBox(height: 12),
            const Text(
              'Registrar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text("Name: ${registrar['name']}"),
            Text("Email: ${registrar['email']}"),
            Text("Phone: ${registrar['phone']}"),
          ],
        ),
      ),
    );
  }
}
