import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      version = info.version;
      buildNumber = info.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.k3voL10n.about),
      ),
      body: MotyBaseSplitLayout(
        scrollable: true,
        startPane: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 300,
                ),
                child: const K3voLogo(),
              ),
              const SizedBox(height: 12),
              K3voText(
                text: context.k3voL10n.appName,
                type: K3voTextType.headlineLarge,
                casing: K3voTextCasing.camelCase,
              ),
              K3voText(
                text: '$version ($buildNumber)',
                type: K3voTextType.titleMedium,
              ),
            ],
          ),
        ),
        endPane: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              MotyBaseListTile(
                leadingIcon: FontAwesomeIcons.globe,
                title: 'Visit Website',
                onTap: _proceedToAppWebsite,
              ),
              MotyBaseListTile(
                leadingIcon: FontAwesomeIcons.code,
                title: 'About The Developer',
                onTap: _proceedToDeveloperWebsite,
              ),
              const SizedBox(height: 24),
              const K3voText(
                text: 'Legal',
                type: K3voTextType.labelLarge,
              ),
              const SizedBox(height: 8),
              MotyBaseListTile(
                leadingIcon: FontAwesomeIcons.scaleBalanced,
                title: context.k3voL10n.termsOfService,
                onTap: _proceedToTerms,
              ),
              MotyBaseListTile(
                leadingIcon: Icons.privacy_tip_outlined,
                title: context.k3voL10n.privacyPolicy,
                onTap: _proceedToPrivacyPolicy,
              ),
              MotyBaseListTile(
                leadingIcon: Icons.copyright,
                title: 'Open Source Licenses',
                showDivider: true,
                onTap: () {
                  showLicensePage(context: context);
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: K3voText(
                  text: context.k3voL10n.madeInKenya,
                  type: K3voTextType.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              Image(
                height: 120,
                image: ExactAssetImage(
                  Assets.images.branding.proudlyKe.keyName,
                ),
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              Center(
                child: K3voText(
                  text:
                      '© ${DateTime.now().year} '
                      '${context.k3voL10n.appAuthor} '
                      '(${context.k3voL10n.appAuthorAlias})',
                  type: K3voTextType.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const Center(
                child: K3voText(
                  text: 'All Rights Reserved.',
                  type: K3voTextType.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Opens the MotyBase website
  void _proceedToAppWebsite() {
    UrlLauncherHelper.launchWebUrl(AppConstants.appWebsiteUrl);
  }

  /// Opens the developer website
  void _proceedToDeveloperWebsite() {
    UrlLauncherHelper.launchWebUrl(AppConstants.appDeveloperWebsite);
  }

  /// Opens the Terms of Service page
  void _proceedToTerms() {
    UrlLauncherHelper.launchWebUrl(AppConstants.termsOfServiceUrl);
  }

  /// Opens the Privacy Policy page
  void _proceedToPrivacyPolicy() {
    UrlLauncherHelper.launchWebUrl(AppConstants.privacyPolicyUrl);
  }

  /// Shows the License page
  void showLicensePage({
    @required BuildContext? context,
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
  }) {
    Navigator.push(
      context!,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => LicensePage(
          applicationName: context.k3voL10n.appName,
          applicationVersion:
              '$version '
              '($buildNumber)',
          applicationLegalese: '© ${DateTime.now().year}',
        ),
      ),
    );
  }
}
