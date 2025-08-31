import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrarSelector {
  // URL with placeholder {domain}

  RegistrarSelector({required this.name, required this.urlTemplate});
  final String name;
  final String urlTemplate;

  String buildUrl(String domain) => urlTemplate.replaceAll('{domain}', domain);
}

// Updated list of registrars with the links you provided
final List<RegistrarSelector> registrars = [
  RegistrarSelector(
    name: 'Host Pinnacle',
    urlTemplate:
        'https://www.hostpinnacle.co.ke/clients/cart.php?a=add&domain=register&query={domain}',
  ),
  RegistrarSelector(
    name: 'Truehost',
    urlTemplate:
        'https://truehost.co.ke/cloud/cart.php?a=add&domain=register&query={domain}',
  ),
  RegistrarSelector(
    name: 'Safaricom',
    urlTemplate:
        'https://domains.safaricom.co.ke/cart.php?a=add&domain=register&query={domain}',
  ),
  RegistrarSelector(
    name: 'Softlink',
    urlTemplate:
        'https://billing.softlinkoptions.co.ke/cart.php?a=add&domain=register&query={domain}',
  ),
];

Future<void> showRegistrarBottomSheet(
  BuildContext context,
  String domain,
) async {
  showModalBottomSheet(
    context: context,
    builder: (_) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              context.k3voL10n.registrarSelector_title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...registrars.map((r) {
            return ListTile(
              title: Text(r.name),
              onTap: () async {
                final url = r.buildUrl(domain);
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch ${r.name}')),
                  );
                }
              },
            );
          }),
          const SizedBox(height: 12),
        ],
      ),
    ),
  );
}
