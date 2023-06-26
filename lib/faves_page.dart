import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruttyvice/images_repository.dart';
import 'package:fruttyvice/nasa_image_info.dart';

class FavesPage extends StatefulWidget {
  const FavesPage({Key? key}) : super(key: key);

  @override
  State<FavesPage> createState() => _FavesPageState();
}

class _FavesPageState extends State<FavesPage> {
  late final ImagesRepository imagesRepository;
  Future<List<NasaImageInfo>>? imagesFuture;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debouncer;

  @override
  void initState() {
    super.initState();
    imagesRepository = context.read();
    imagesFuture = imagesRepository.getFavorites();
    _searchController.addListener(() {
      _debounceSearch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fave Images'),
      ),
      body: FutureBuilder<List<NasaImageInfo>>(
        future: imagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final images = snapshot.data ?? [];
          return Column(
            children: [
              TextFormField(
                controller: _searchController,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = images[index];
                    return GestureDetector(
                      onTap: () {
                        // open SpaceImagePage
                      },
                      child: Image.network(item.url),
                    );
                  },
                  itemCount: images.length,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  void _debounceSearch() {
    if (_debouncer != null) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(seconds: 1), () {
      final query = _searchController.text;
      setState(() {
        imagesFuture = imagesRepository.search(query);
      });
    });
  }
}
