import 'package:cuidarte/CuidArte/onboarding/presentation/widgets/auto_explore_page.dart';
import 'package:cuidarte/CuidArte/onboarding/presentation/widgets/cycle_page.dart';
import 'package:cuidarte/CuidArte/onboarding/presentation/widgets/form_page.dart';
import 'package:cuidarte/CuidArte/onboarding/presentation/widgets/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cuidarte/domain/const/routes.dart';
import '../application/onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController();

    _controller.pageController.addListener(() {
      if (_controller.pageController.page != null) {
        int next = _controller.pageController.page!.round();
        if (_controller.currentPageNotifier.value != next) {
          _controller.currentPageNotifier.value = next;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: _controller.currentPageNotifier,
            builder: (context, currentPage, _) {
              if (currentPage < _controller.totalPages - 1) {
                return TextButton(
                  onPressed: _controller.skipToEnd,
                  child: const Text(
                    'SALTAR',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller.pageController,
              children: [
                const WelcomePage(),
                const CyclePage(),
                const AutoexplorePage(),
                FormPage(controller: _controller),
              ],
            ),
          ),
          _buildNavigationControls(),
        ],
      ),
    );
  }

  Widget _buildNavigationControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ValueListenableBuilder<int>(
            valueListenable: _controller.currentPageNotifier,
            builder: (context, currentPage, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_controller.totalPages, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: currentPage == index ? 24 : 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? Colors.pinkAccent
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              );
            },
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder<int>(
            valueListenable: _controller.currentPageNotifier,
            builder: (context, currentPage, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: currentPage > 0
                        ? _controller.previousPage
                        : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Anterior'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => _controller.nextPage(
                      context,
                      () {},
                      () => context.go(Routes.home),
                    ),
                    icon: const Icon(Icons.arrow_forward),
                    label: currentPage == 3
                        ? const Text('Comenzar')
                        : const Text('Siguiente'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
