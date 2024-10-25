class Post {
  final int id;
  final String receita;
  final String ingredientes;
  final String modoPreparo;
  final String linkImagem;
  final String tipo;
  final String createdAt;
  final List<IngredienteBase> ingredientesBase;

  Post({
    required this.id,
    required this.receita,
    required this.ingredientes,
    required this.modoPreparo,
    required this.linkImagem,
    required this.tipo,
    required this.createdAt,
    required this.ingredientesBase,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      receita: map['receita'],
      ingredientes: map['ingredientes'],
      modoPreparo: map['modo_preparo'],
      linkImagem: map['link_imagem'],
      tipo: map['tipo'],
      createdAt: map['created_at'],
      ingredientesBase: (map['IngredientesBase'] as List<dynamic>)
          .map((item) => IngredienteBase.fromMap(item))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'receita': receita,
      'ingredientes': ingredientes,
      'modo_preparo': modoPreparo,
      'link_imagem': linkImagem,
      'tipo': tipo,
      'created_at': createdAt,
      'IngredientesBase': ingredientesBase.map((e) => e.toMap()).toList(),
    };
  }
}

class IngredienteBase {
  final int id;
  final List<String> nomesIngrediente;
  final int receitaId;
  final String createdAt;

  IngredienteBase({
    required this.id,
    required this.nomesIngrediente,
    required this.receitaId,
    required this.createdAt,
  });

  factory IngredienteBase.fromMap(Map<String, dynamic> map) {
    return IngredienteBase(
      id: map['id'],
      nomesIngrediente: List<String>.from(map['nomesIngrediente']),
      receitaId: map['receita_id'],
      createdAt: map['created_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomesIngrediente': nomesIngrediente,
      'receita_id': receitaId,
      'created_at': createdAt,
    };
  }
}
