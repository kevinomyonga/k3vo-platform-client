import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:k3vo_auth/k3vo_auth.dart';
import 'package:k3vo_foundation/k3vo_foundation.dart';
import 'package:k3vo_router/k3vo_router.dart';
import 'package:k3vo_ui_kit/k3vo_ui_kit.dart';
// import 'auth_bloc.dart'; // Your AuthBloc implementation

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
                        constraints: BoxConstraints(
                          maxHeight: height,
                        ),
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
                                const K3voText(
                                  text: 'Access. Connection. Ownership',
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
                                          tooltip: 'Login',
                                          onPressed: () => _showForm(1),
                                          label: const Text('Sign In'),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: FloatingActionButton.extended(
                                          heroTag: 'register',
                                          tooltip: 'Register',
                                          onPressed: () => _showForm(2),
                                          label: const Text('Sign Up'),
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
                                K3voLanguageSwitcherButton(
                                  showLabel: true,
                                ),
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
            Container(
              color: Colors.black54,
              alignment: Alignment.center,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _toggleButton('Login', 1),
                            const SizedBox(width: 10),
                            _toggleButton('Register', 2),
                            const SizedBox(width: 10),
                            _toggleButton('Forgot', 3),
                            const SizedBox(width: 10),
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.clear),
                              onPressed: _hideForm,
                            ),
                          ],
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
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
          // Navigate to app home
          getNavigationService().push(
            HomeRouteNames.home,
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
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(16),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  // backgroundColor: Colors.red,
                  // foregroundColor: Colors.white,
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
                child: const Text('Login'),
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
          // Navigate to app home
          getNavigationService().push(
            HomeRouteNames.home,
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
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(16),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: confirmController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  // backgroundColor: Colors.red,
                  // foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (passwordController.text != confirmController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Passwords do not match')),
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
                child: const Text('Signup'),
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
            const SnackBar(content: Text('Password reset email sent')),
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
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(16),
          // ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  // backgroundColor: Colors.red,
                  // foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(
                    PasswordResetRequested(emailController.text),
                  );
                },
                child: const Text('Send Reset Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
