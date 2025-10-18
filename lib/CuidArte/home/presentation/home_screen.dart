import 'package:cuidarte/CuidArte/application/home_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _loadShortName();
  }

  Future<void> _loadShortName() async {
    await _controller.loadUserName();
    if (mounted) {
      setState(() {}); // Actualiza la UI cuando el nombre ya esté cargado
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Bienvenida, ${_controller.shortName ?? ''}!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
