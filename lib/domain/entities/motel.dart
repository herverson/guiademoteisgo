import '../../data/models/motel_model.dart';

class Motel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final double media;
  final int qtdAvaliacoes;
  final List<Suite> suites;

  Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.media,
    required this.qtdAvaliacoes,
    required this.suites,
  });
}
