import '../../domain/entities/motel.dart';

class MotelModel extends Motel {
  MotelModel({
    required super.fantasia,
    required super.logo,
    required super.bairro,
    required super.distancia,
    required super.qtdFavoritos,
    required super.media,
    required super.qtdAvaliacoes,
    required super.suites,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) {
    return MotelModel(
      fantasia: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: json['distancia'],
      qtdFavoritos: json['qtdFavoritos'],
      media: json['media'],
      qtdAvaliacoes: json['qtdAvaliacoes'],
      suites: List<Suite>.from(json['suites'].map((x) => Suite.fromJson(x))),
    );
  }

  Motel toEntity() {
    return Motel(
      fantasia: fantasia,
      logo: logo,
      bairro: bairro,
      distancia: distancia,
      qtdFavoritos: qtdFavoritos,
      media: media,
      qtdAvaliacoes: qtdAvaliacoes,
      suites: suites,
    );
  }
}

class Suite {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<Item> itens;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      fotos: List<String>.from(json['fotos']),
      itens: List<Item>.from(json['itens'].map((x) => Item.fromJson(x))),
      categoriaItens: List<CategoriaItem>.from(
          json['categoriaItens'].map((x) => CategoriaItem.fromJson(x))),
      periodos:
          List<Periodo>.from(json['periodos'].map((x) => Periodo.fromJson(x))),
    );
  }
}

class Item {
  final String nome;

  Item({required this.nome});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(nome: json['nome']);
  }
}

class CategoriaItem {
  final String nome;
  final String icone;

  CategoriaItem({required this.nome, required this.icone});

  factory CategoriaItem.fromJson(Map<String, dynamic> json) {
    return CategoriaItem(
      nome: json['nome'],
      icone: json['icone'],
    );
  }
}

class Periodo {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final Desconto? desconto;

  Periodo({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      tempo: json['tempo'],
      valor: json['valor'],
      valorTotal: json['valorTotal'],
      temCortesia: json['temCortesia'],
      desconto:
          json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null,
    );
  }
}

class Desconto {
  final double desconto;

  Desconto({required this.desconto});

  factory Desconto.fromJson(Map<String, dynamic> json) {
    return Desconto(desconto: json['desconto']);
  }
}
