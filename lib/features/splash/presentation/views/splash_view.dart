import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/assets_data.dart';
import 'package:flutter_application_2/features/auth/presentation/views/login_view.dart';
import 'package:flutter_application_2/features/home/presentation/home_view.dart';
import 'package:flutter_application_2/features/splash/presentation/view_models/cubit/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => SplashCubit(),
      child: const SplashViewBody(),
    ));
  }
}

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Get.off(() => context.read<SplashCubit>().isLoggedIn()
          ? const HomeView()
          : const LoginView());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Image.asset(
          AssetsData.logo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
