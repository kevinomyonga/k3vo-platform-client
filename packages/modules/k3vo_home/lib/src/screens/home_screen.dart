import 'dart:ui';

import 'package:flutter/material.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          // _buildAppBar(context),
          // _buildContent(context),
        ],
      ),
    );
  }

//   Widget _buildAppBar(
//     BuildContext context,
//   ) {
//     var isCollapsed = false;

//     return SliverAppBar.large(
//       expandedHeight: 250,
//       stretch: true,
//       flexibleSpace: LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints) {
//           // Determine if the SliverAppBar is collapsed
//           isCollapsed =
//               constraints.biggest.height <=
//               kToolbarHeight + MediaQuery.of(context).padding.top + 10;

//           return FlexibleSpaceBar(
//             title: isCollapsed ? const Text('MotyBase') : null,
//             centerTitle: true,
//             stretchModes: const [
//               StretchMode.zoomBackground,
//               StretchMode.fadeTitle,
//             ],
//             background: _buildHeaderBackground(context),
//           );
//         },
//       ),
//       leading: CircleAvatar(
//         backgroundColor: Colors.grey.shade300,
//         backgroundImage: const NetworkImage(
//           'https://blog.playstation.com/tachyon/2022/06/0c3c20a8d8514501524a0859461f391572ea6e61.jpg?resize=1088%2C612&crop_strategy=smart',
//         ),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {
//             getIt<NavigationService>().push(
//               NotificationsRouteNames.notifications,
//             );
//           },
//           icon: Icon(
//             FontAwesomeIcons.bell,
//             color: Colors.white,
//             shadows: AppShadows.shadows,
//           ),
//           tooltip: 'Notifications',
//         ),
//       ],
//     );
//   }

//   Widget _buildHeaderBackground(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       clipBehavior: Clip.none,
//       children: <Widget>[
//         KenBurns(
//           minAnimationDuration: const Duration(milliseconds: 6000),
//           maxAnimationDuration: const Duration(milliseconds: 20000),
//           child: const MotyBaseCachedNetworkImage(
//             imageUrl:
//                 'https://images.pexels.com/photos/29069329/pexels-photo-29069329/free-photo-of-stunning-nairobi-skyline-at-dusk.jpeg',
//           ),
//         ),
//         SizedBox(
//           child: BackdropFilter(
//             filter: ImageFilter.blur(),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(
//                   context,
//                 ).colorScheme.primary.withValues(alpha: 0.3),
//               ),
//             ),
//           ),
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(
//               height: 25,
//             ),
//             MotyBaseText(
//               text: 'Good Morning,',
//               type: MotyBaseTextType.titleMedium,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               shadows: AppShadows.shadows,
//               overflow: TextOverflow.ellipsis,
//             ),
//             MotyBaseText(
//               text: 'Kevin O.',
//               type: MotyBaseTextType.headlineLarge,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               shadows: AppShadows.shadows,
//               overflow: TextOverflow.ellipsis,
//             ),
//             MotyBaseText(
//               text: 'Nairobi, Kenya',
//               type: MotyBaseTextType.titleMedium,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               shadows: AppShadows.shadows,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildContent(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: <Widget>[
//             _buildServicesSection(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildServicesSection(BuildContext context) {
//     final services = <Map<String, String>>[
//       {
//         'image': Assets.images.services.serviceRide.keyName,
//         'title': 'Ride',
//       },
//       {
//         'image': Assets.images.services.serviceCarpool.keyName,
//         'title': 'Carpool',
//       },
//       {
//         'image': Assets.images.services.serviceRental.keyName,
//         'title': 'Rental',
//       },
//     ];

//     final serviceIcons = [
//       Icons.local_taxi,
//       Icons.group,
//       Icons.car_rental,
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const MotyBaseText(
//           text: 'Services',
//         ),
//         const SizedBox(height: 16),
//         LayoutWidget(
//           isExpanded: true,
//           child: M3Carousel(
//             // type: 'uncontained',
//             freeScroll: true,
//             onTap: (int tapIndex) {
//               getIt<NavigationService>().pushNamed(
//                 'locationPicker',
//               );
//             },
//             children: services
//                 .map(
//                   (service) => MotyBaseServiceCard(
//                     service: service,
//                     iconData: serviceIcons[services.indexOf(service)],
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const Divider(),
//       ],
//     );
//   }
// }

// class LayoutWidget extends StatelessWidget {
//   const LayoutWidget({required this.child, super.key, this.isExpanded = false});
//   final bool isExpanded;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: isExpanded
//           ? EdgeInsets.zero
//           : const EdgeInsets.symmetric(horizontal: 4),
//       child: SizedBox(
//         width: double.maxFinite,
//         height: 200, // Adjusted height for balance cards
//         child: child,
//       ),
//     );
//   }
}
