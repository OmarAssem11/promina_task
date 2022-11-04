import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/presentation/resources/color_manager.dart';
import 'package:promina_task/core/presentation/resources/routes_manager.dart';
import 'package:promina_task/core/presentation/resources/values_manager.dart';
import 'package:promina_task/core/presentation/util/toast.dart';
import 'package:promina_task/core/presentation/validation/validators.dart';
import 'package:promina_task/core/presentation/widgets/custom_elevated_button.dart';
import 'package:promina_task/core/presentation/widgets/custom_text_form_field.dart';
import 'package:promina_task/features/auth/domain/entities/login_data.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_state.dart';
import 'package:promina_task/generated/assets.gen.dart';
import 'package:promina_task/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late TextTheme _textTheme;
  late Size _screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _textTheme = Theme.of(context).textTheme;
    _screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.pink,
                  ColorManager.primary,
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -140,
                  left: -70,
                  child: Image.asset(
                    Assets.images.loginTopLeft.path,
                    scale: 1.05,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: _screenSize.height * 0.24),
                    Text(
                      S.current.my,
                      style: _textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      S.current.gallery,
                      style: _textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: _screenSize.width * 0.08,
            left: _screenSize.width * 0.08,
            bottom: _screenSize.height * 0.18,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: Container(
                  height: _screenSize.height * 0.4,
                  width: _screenSize.width * 0.8,
                  padding: const EdgeInsets.symmetric(horizontal: Insets.xl),
                  decoration: const BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.s32),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          S.current.login,
                          style: _textTheme.headlineLarge,
                        ),
                        const Spacer(),
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: S.current.emailAddress,
                          keyboardType: TextInputType.emailAddress,
                          validator: (email) => emailValidator(email),
                          fillColor: ColorManager.white,
                        ),
                        const Spacer(),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: S.current.password,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (password) => passwordValidator(password),
                          isObscure: true,
                          fillColor: ColorManager.white,
                        ),
                        const Spacer(),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            bool isLoading = false;
                            state.mapOrNull(
                              loading: (_) => isLoading = true,
                              error: (_) =>
                                  showToast(S.current.wrongEmailOrPassword),
                              success: (_) =>
                                  WidgetsBinding.instance.addPostFrameCallback(
                                (_) =>
                                    Navigator.of(context).pushReplacementNamed(
                                  AppRoutes.gallery,
                                ),
                              ),
                            );
                            return CustomElevatedButton(
                              label: S.current.submit,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthCubit>(context).login(
                                    LoginData(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                }
                              },
                              isLoading: isLoading,
                            );
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
