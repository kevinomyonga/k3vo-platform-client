import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';

class K3voBlocProviders extends StatelessWidget {
  const K3voBlocProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
          create: (_) => getIt<LanguageCubit>(),
        ),
      ],
      child: child,
    );
  }
}
