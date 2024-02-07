import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsense/app/common/widgets/button.dart';
import 'package:jobsense/app/common/widgets/input.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';
import 'package:jobsense/app/features/auth/domain/cubit/jobsense_auth_cubit.dart';
import 'package:jobsense/app/features/auth/domain/models/user_model.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:uuid/uuid.dart';

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
  final formKey = GlobalKey<FormState>();

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
    const url =
        'https://images.unsplash.com/photo-1508002366005-75a695ee2d17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80';
    return BlocListener<JobsenseAuthCubit, JobsenseAuthState>(
      listener: (context, state) {
        state.maybeMap(
          authenticated: (state) {
            context.router.replaceNamed('/jobsense-home');
          },
          orElse: () {},
          failure: (failure) => QuickAlert.show(
            context: context,
            title: 'Authentication Error',
            text: failure.failure,
            type: QuickAlertType.error,
          ),
        );
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  hint: 'Your full name',
                  controller: nameController,
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                InputBox(
                  label: 'Email',
                  hint: 'Enter your email',
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (!RegExp(
                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                    ).hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                InputBox(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                ),
                InputBox(
                  label: 'Confirm Password',
                  hint: 'Confirm your password',
                  controller: confirmPasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
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
                BlocBuilder<JobsenseAuthCubit, JobsenseAuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => _SubmissionAction(
                        formKey: formKey,
                        nameController: nameController,
                        emailController: emailController,
                        url: url,
                        passwordController: passwordController,
                      ),
                      loading: () {
                        return const LoadingButton(
                          text: 'Authenticating',
                        );
                      },
                    );
                  },
                ),
              ],
            ).hPaddingx(18),
          ),
        ),
      ),
    );
  }
}

class _SubmissionAction extends StatelessWidget {
  const _SubmissionAction({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.url,
    required this.passwordController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final String url;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return JobsenseButton(
      text: 'Authenticate',
      textColor: context.colorScheme.onPrimary,
      color: context.colorScheme.primary,
      action: () {
        if (formKey.currentState!.validate()) {
          final user = UserModel(
            userId: const Uuid().v4(),
            displayName: nameController.text,
            email: emailController.text,
            photoUrl: url,
            connections: [],
            bio: '',
          );
          context.read<JobsenseAuthCubit>().signInWithEmailAndPassword(
                email: emailController.text,
                password: passwordController.text,
                user: user,
              );
        }
      },
    );
  }
}
