import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k3vo_auth/k3vo_auth.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_router/k3vo_router.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool formVisible = false;
  int formsIndex = 1; // 1=Login, 2=Signup, 3=Forgot

  void _showForm(int index) {
    setState(() {
      formVisible = true;
      formsIndex = index;
    });
  }

  void _hideForm() {
    setState(() => formVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.images.backgrounds.background.keyName,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: ColoredBox(
              color: Colors.black54,
              child: Center(
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final height = constraints.maxHeight > 800
                          ? 700.0
                          : 700.0;
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: height),
                        child: Column(
                          children: [
                            const SizedBox(height: kToolbarHeight),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 300,
                                  ),
                                  child: const K3voLogo(),
                                ),
                                const SizedBox(height: 10),
                                K3voText(
                                  text: context.k3voL10n.appTagline,
                                  color: Colors.white70,
                                  type: K3voTextType.headlineSmall,
                                ),
                              ],
                            ),
                            const Spacer(),
                            const SizedBox(height: 10),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final width = constraints.maxWidth > 500
                                    ? 400.0
                                    : constraints.maxWidth * 0.9;
                                return ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: width),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: FloatingActionButton.extended(
                                          heroTag: 'login',
                                          tooltip: context.k3voL10n.login,
                                          onPressed: () => _showForm(1),
                                          label: Text(context.k3voL10n.signIn),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: FloatingActionButton.extended(
                                          heroTag: 'register',
                                          tooltip: context.k3voL10n.register,
                                          onPressed: () => _showForm(2),
                                          label: Text(context.k3voL10n.signUp),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                K3voLanguageSwitcherButton(showLabel: true),
                              ],
                            ),
                            const SizedBox(height: 20),
                            K3voText(
                              text:
                                  '© ${DateTime.now().year} '
                                  '${context.k3voL10n.appAuthor} '
                                  '(${context.k3voL10n.appAuthorAlias})',
                              type: K3voTextType.labelLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // Form Overlay
          if (formVisible)
            GestureDetector(
              onTap: _hideForm, // closes overlay when tapping outside
              child: Container(
                color: Colors.black54,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap:
                      () {}, // prevents tap events from propagating to the outer GestureDetector
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth > 500
                          ? 400.0
                          : constraints.maxWidth * 0.9;
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: width),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SingleChildScrollView(
                              scrollDirection:
                                  Axis.horizontal, // scrollable toggle buttons
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _toggleButton(context.k3voL10n.login, 1),
                                  const SizedBox(width: 10),
                                  _toggleButton(context.k3voL10n.register, 2),
                                  const SizedBox(width: 10),
                                  _toggleButton(
                                    context.k3voL10n.forgotPassword,
                                    3,
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    color: Colors.white,
                                    icon: const Icon(Icons.clear),
                                    onPressed: _hideForm,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: formsIndex == 1
                                  ? const LoginForm(key: ValueKey(1))
                                  : formsIndex == 2
                                  ? const SignupForm(key: ValueKey(2))
                                  : const ForgotPasswordForm(key: ValueKey(3)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _toggleButton(String text, int index) {
    final isSelected = formsIndex == index;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected
            ? Theme.of(context).primaryColor
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () => setState(() => formsIndex = index),
      child: Text(text),
    );
  }
}

// ------------------- Forms -------------------

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          getNavigationService().push(HomeRouteNames.home);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: context.k3voL10n.email,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: context.k3voL10n.password,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(
                    EmailSignInRequested(
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                },
                child: Text(context.k3voL10n.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          getNavigationService().push(HomeRouteNames.home);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: context.k3voL10n.email,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: context.k3voL10n.password,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: confirmController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: context.k3voL10n.confirmPassword,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (passwordController.text != confirmController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.k3voL10n.passwordsDoNotMatch),
                      ),
                    );
                    return;
                  }
                  context.read<AuthBloc>().add(
                    EmailSignUpRequested(
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                },
                child: Text(context.k3voL10n.signUp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.k3voL10n.passwordResetEmailSent)),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: context.k3voL10n.enterYourEmail,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(
                    PasswordResetRequested(emailController.text),
                  );
                },
                child: Text(context.k3voL10n.sendResetEmail),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
