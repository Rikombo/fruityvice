import 'package:fruttyvice/images_repository.dart';
import 'package:fruttyvice/nasa_image_info.dart';

class InMemoryImagesRepository implements ImagesRepository {
  final List<NasaImageInfo> _faveImages = [];

  @override
  Future<List<NasaImageInfo>> getImages() async {
    await Future.delayed(const Duration(seconds: 1));
    return _nasaImages;
  }

  @override
  Future<void> addToFavorites(NasaImageInfo info) async {
    _faveImages.add(info);
  }

  @override
  Future<List<NasaImageInfo>> getFavorites() async {
    await Future.delayed(const Duration(seconds: 1));
    return _faveImages;
  }

  @override
  Future<List<NasaImageInfo>> search(String query) async {
    return _nasaImages
        .where((element) => element.description.contains(query))
        .toList();
  }

  final List<NasaImageInfo> _nasaImages = const [
    NasaImageInfo(
        id: "1",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/hubble_j0206_potw2323a.jpg",
        description:
            "This image captured by the Hubble Space Telescope showcases the beauty of the J0206 galaxy."),
    NasaImageInfo(
        id: "2",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss069e018147orig.jpg",
        description:
            "A breathtaking view of Earth captured from the International Space Station (ISS)."),
    NasaImageInfo(
        id: "3",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/ksc-20230605-ph-fmx01_0206orig.jpg",
        description:
            "This stunning photograph was taken at Kennedy Space Center during a rocket launch."),
    NasaImageInfo(
        id: "4",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/hubble_jw39_potw2321a.jpg",
        description:
            "The Hubble Space Telescope captures the mesmerizing beauty of the JW39 galaxy."),
    NasaImageInfo(
        id: "5",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia19836-ngc2174.jpg",
        description:
            "NGC 2174, also known as the Monkey Head Nebula, is a vibrant region of star formation."),
    NasaImageInfo(
        id: "6",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/hubble_ngc6325_potw2320a_0.jpg",
        description:
            "The Hubble Space Telescope reveals the intricate details of the NGC 6325 galaxy."),
    NasaImageInfo(
        id: "7",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss069e008558orig.jpg",
        description:
            "A stunning view of the Earth captured from the International Space Station (ISS)."),
    NasaImageInfo(
        id: "8",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss067-e-190647.jpg",
        description:
            "The International Space Station (ISS) gracefully orbits above Earth's colorful horizon."),
    NasaImageInfo(
        id: "9",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/hubble_acos520_potw2317a.jpg",
        description:
            "The Hubble Space Telescope reveals the vibrant colors of the ACOS520 galaxy."),
    NasaImageInfo(
        id: "10",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/52688121607_bcce2a690e_o.jpg",
        description:
            "This mesmerizing photograph captures the beauty of a distant celestial object."),
    NasaImageInfo(
        id: "11",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss068e056415.jpg",
        description:
            "A spectacular view of the International Space Station (ISS) against the backdrop of Earth."),
    NasaImageInfo(
        id: "12",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/579054main_pia14417_full.jpg",
        description:
            "This image reveals the grandeur of a celestial object, showcasing its intricate details."),
    NasaImageInfo(
        id: "13",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/nhq201708210303_orig.jpg",
        description:
            "A captivating photograph of a historic event that took place at NASA Headquarters."),
    NasaImageInfo(
        id: "14",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/e-pia00104-venus-full-alt-1041.jpg",
        description:
            "Venus, the second planet from the Sun, shines brightly in the night sky."),
    NasaImageInfo(
        id: "15",
        url:
            "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/682400main_pia14922_full_full.jpg",
        description:
            "This image captures a celestial phenomenon, showcasing the beauty of the universe."),
  ];
}
