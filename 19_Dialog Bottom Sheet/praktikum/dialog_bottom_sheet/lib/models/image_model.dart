class ImageModel {
  final String image;
  final String desc;
  final int positionNumber;

  ImageModel({
    required this.positionNumber,
    required this.image,
    required this.desc,
  });
}

List<ImageModel> dataImage = [
  ImageModel(
    positionNumber: 1,
    image: 'assets/berdiri.png',
    desc: 'Berdiri',
  ),
  ImageModel(
      positionNumber: 2,
      image: 'assets/bersedekap.png',
      desc: 'Tangan Bersedekap'),
  ImageModel(
    positionNumber: 3,
    image: 'assets/rukuk.png',
    desc: 'Rukuk',
  ),
  ImageModel(
    positionNumber: 4,
    image: 'assets/iktidal.png',
    desc: 'I\'tidal',
  ),
  ImageModel(
    positionNumber: 5,
    image: 'assets/sujud.png',
    desc: 'Sujud',
  ),
  ImageModel(
      positionNumber: 6,
      image: 'assets/duduk_diantara_2sujud.png',
      desc: 'Duduk Diantar 2 Sujud'),
  ImageModel(
      positionNumber: 7,
      image: 'assets/tahiyat_awal.png',
      desc: 'Tahiyat Awal'),
  ImageModel(
      positionNumber: 8,
      image: 'assets/tahiyat_akhir.png',
      desc: 'Tahiyat Akhir'),
  ImageModel(
    positionNumber: 9,
    image: 'assets/salam.png',
    desc: 'Salam',
  ),
];
