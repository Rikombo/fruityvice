import 'package:equatable/equatable.dart';

class NasaImageInfo extends Equatable {
  final String id;
  final String description;
  final String url;

  const NasaImageInfo({
    required this.id,
    required this.description,
    required this.url,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        url,
      ];
}
