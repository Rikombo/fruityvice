import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruttyvice/fruits_api_client.dart';
import 'package:fruttyvice/fruits_page.dart';
import 'package:fruttyvice/fruits_repository.dart';
import 'package:fruttyvice/images_repository.dart';
import 'package:fruttyvice/in_memory_images_repository.dart';
import 'package:fruttyvice/network_fruits_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final imagesRepository = InMemoryImagesRepository();
  final imagesRepositoryProvider = RepositoryProvider<ImagesRepository>(
    create: (context) => imagesRepository,
  );

/*  final fruitsJson = json.decode(
    await rootBundle.loadString('assets/data/fruits.json'),
  );*/
  // final jsonFruitsRepository = JsonFruitsRepository(fruitsJson);

  // final fruitsRepository = InMemoryFruitsRepository();
  // final fruitsRepositoryProvider = RepositoryProvider<FruitsRepository>(
  //   create: (context) => jsonFruitsRepository,
  // );

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.fruityvice.com/api/',
    ),
  );

  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );

  final fruitsApiClient = FruitsApiClient(dio);
  final networkFruitsRepository = NetworkFruitsRepository(fruitsApiClient);
  final fruitsRepositoryProvider = RepositoryProvider<FruitsRepository>(
    create: (context) => networkFruitsRepository,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [imagesRepositoryProvider, fruitsRepositoryProvider],
      child: const MaterialApp(
        home: FruitsPage(),
      ),
    ),
  );
}
