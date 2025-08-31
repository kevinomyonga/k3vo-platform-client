import 'dart:io';

import 'package:flutter/material.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_router/k3vo_router.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(title: Text('Account')),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  _buildProfileSection(context),
                  const SizedBox(height: 24),
                  _buildOtherActionsSection(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: const NetworkImage(
                'https://blog.playstation.com/tachyon/2022/06/0c3c20a8d8514501524a0859461f391572ea6e61.jpg?resize=1088%2C612&crop_strategy=smart',
              ),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.edit, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const K3voText(
          text: 'Kevin Omyonga',
          type: K3voTextType.titleMedium,
        ),
        const K3voText(
          text: 'kevin@motybase.com',
          type: K3voTextType.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildOtherActionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const K3voText(
          text: 'Other',
          type: K3voTextType.labelLarge,
        ),
        const SizedBox(height: 8),
        K3voListTile(
          leadingIcon: Icons.settings,
          title: 'Settings',
          onTap: () {
            getNavigationService().push(SettingsRouteNames.settings);
          },
        ),
        K3voListTile(
          leadingIcon: Icons.share_outlined,
          title: 'Invite Friends',
          onTap: () {
            _inviteFriend(context);
          },
        ),
        K3voListTile(
          leadingIcon: Icons.info_outline,
          title: 'About MotyBase',
          onTap: () {
            getNavigationService().push(SettingsRouteNames.about);
          },
        ),
        const Divider(),
        K3voListTile(
          leadingIcon: Icons.logout,
          title: 'Logout',
          color: Colors.red,
          onTap: _proceedToSignOut,
        ),
      ],
    );
  }

  /// Launches an app selection popup to select the app to be used for sharing
  /// a link to MotyBase.
  void _inviteFriend(BuildContext context) {
    String appLink;

    if (Platform.isAndroid) {
      appLink = AppConstants.appGooglePlayUrl;
    } else if (Platform.isIOS) {
      appLink = AppConstants.appAppleStoreUrl;
    } else {
      appLink = AppConstants.appWebsiteUrl;
    }

    ShareHelper().shareText(
      context: context,
      text: '${context.k3voL10n.shareApp}\n$appLink',
      subject: context.k3voL10n.shareAppRecommendation,
    );
  }

  /// Initiates the sign out process.
  void _proceedToSignOut() {
    getNavigationService().push(AuthRouteNames.auth);
  }
}
