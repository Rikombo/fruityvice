import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruttyvice/fruit_details_page.dart';
import 'package:fruttyvice/fruits_repository.dart';

class FruitsPage extends StatefulWidget {
  const FruitsPage({super.key});

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  late final FruitsRepository _fruitsRepository;
  late final Future<List<String>> _fruitsFuture;

  @override
  void initState() {
    super.initState();
    _fruitsRepository = context.read();
    _fruitsFuture = _fruitsRepository.getFruits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<String>>(
          future: _fruitsFuture,
          builder: (context, snapshot) {
            final connectionState = snapshot.connectionState;
            if (connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final fruits = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                final fruit = fruits[index];
                return GestureDetector(
                  onTap: () => _showDetails(context, fruit),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Fruit $fruit',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
              itemCount: fruits.length,
            );
          },
        ),
      ),
    );
  }

  void _showDetails(BuildContext context, String name) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FruitDetailsPage(name: name),
      ),
    );
  }
}
