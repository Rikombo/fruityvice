import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruttyvice/fruits_repository.dart';

import 'package:fruttyvice/fruits_response.dart';

class FruitDetailsPage extends StatefulWidget {
  const FruitDetailsPage({super.key, required this.name});

  final String name;

  @override
  State<FruitDetailsPage> createState() => _FruitsDetailsPageState();
}

class _FruitsDetailsPageState extends State<FruitDetailsPage> {
  late final FruitsRepository _fruitsRepository;
  late Future<FruitsResponse> _fruitDetailsFuture;

  @override
  void initState() {
    super.initState();
    _fruitsRepository = context.read();
    _fruitDetailsFuture = _fruitsRepository.getFruit(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: FutureBuilder<FruitsResponse>(
        future: _fruitDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final fruitDetails = snapshot.data;
            return Text(fruitDetails.toString());
          }
        },
      ),
    );
  }
}
