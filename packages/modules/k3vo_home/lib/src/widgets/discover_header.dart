import 'package:flutter/material.dart';

// The main widget for the discover screen header.
// It is a StatelessWidget because the greeting text is determined once
// based on the current time, and doesn't need to be mutable after being built.
class DiscoverHeader extends StatelessWidget {
  const DiscoverHeader({super.key});

  // A helper method to determine the appropriate greeting based on
  // the hour of the day.
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  @override
  Widget build(BuildContext context) {
    // The total height of the header section.
    const headerHeight = 300.0;

    // The height of the ribbon section at the bottom.
    const ribbonHeight = 50.0;

    const stripeHeight = 10.0;

    // Use a Stack to layer the image, text, and the clipped ribbon.
    return Stack(
      children: [
        // Green Stripe
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: headerHeight + stripeHeight * 4,
            color: Colors.green,
          ),
        ),

        // White Stripe
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: headerHeight + stripeHeight * 3,
            color: Colors.white,
          ),
        ),

        // Red Stripe
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: headerHeight + stripeHeight * 2.5,
            color: Colors.red,
          ),
        ),

        // White Stripe
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: headerHeight + stripeHeight * 1.5,
            color: Colors.white,
          ),
        ),

        // Black Stripe
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: headerHeight + stripeHeight * 1,
            color: Colors.black,
          ),
        ),

        ClipPath(
          clipper: WaveClipper(),
          child:
              // Background Image Container
              Container(
                height: headerHeight,
                // Use a placeholder image that looks like a discovery or travel theme.
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1614531341773-3bff8b7cb3fc?q=80&w=2832&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    // Gradient Overlay for better text readability.
                    Container(
                      height: headerHeight,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    // Text Greeting. Positioned at the bottom-left of the header.
                    Positioned(
                      bottom:
                          ribbonHeight +
                          16, // Place it above the ribbon with some padding.
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getGreeting(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ],
    );
  }
}

// CustomClipper to create a simple, elegant wave shape at the bottom of the widget.
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()..lineTo(0, size.height);

    final firstEndPoint = Offset(size.width / 2, size.height - 30);
    final firstControlPoint = Offset(size.width / 4, size.height - 53);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    final secondEndPoint = Offset(size.width, size.height - 90);
    final secondControlPoint = Offset(size.width * 3 / 4, size.height - 14);
    path
      ..quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
