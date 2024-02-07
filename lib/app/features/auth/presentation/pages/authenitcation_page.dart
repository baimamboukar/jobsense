import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobsense/app/common/widgets/button.dart';
import 'package:jobsense/app/common/widgets/input.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';

@RoutePage()
class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            54.vGap,
            Text(
              '✨Jobsense',
              style: context.theme.textTheme.displaySmall
                  ?.copyWith(color: context.theme.colorScheme.primary),
            ),
            14.vGap,
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  'Welcome to Jobsense',
                  textStyle: context.theme.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.secondary,
                    fontSize: 18.5,
                  ),
                  speed: const Duration(milliseconds: 50),
                  cursor: '🚀',
                ),
              ],
              //totalRepeatCount: 4,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            24.vGap,
            InputBox(
              label: 'Name',
              hint: 'Your fulll name',
              controller: nameController,
              obscureText: false,
            ),
            InputBox(
              label: 'Email',
              hint: 'Enter your email',
              controller: emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
            ),
            // Password
            InputBox(
              label: 'Password',
              hint: 'Enter your password',
              controller: passwordController,
              obscureText: true,
            ),
            // Confirm Password
            InputBox(
              label: 'Confirm Password',
              hint: 'Confirm your password',
              controller: confirmPasswordController,
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ?',
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                  ),
                ),

                ///4.hGap,
                TextButton(
                  onPressed: () {
                    context.router.replaceNamed('/jobsense-login');
                  },
                  child: Text(
                    'Login here',
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            54.vGap,
            JobsenseButton(
              text: 'Authenticate',
              textColor: context.colorScheme.onPrimary,
              color: context.colorScheme.primary,
              action: () {
                context.router.pushNamed('/jobsense-auth');
              },
            ),
          ],
        ).hPaddingx(18),
      ),
    );
  }
}
