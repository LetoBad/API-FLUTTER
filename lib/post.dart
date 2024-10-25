class Post{
  int id;
  String receita;
  String nomesIngredientes;
  String linkImagem;
  String tipo;
  String created_at;
  String ingredientesBase;


  Post(
    {
      required this.id,
      required this.receita,
      required this.nomesIngredientes,
      required this.linkImagem,
      required this.tipo,
      required this.created_at,
      required this.ingredientesBase,
    }
  );

  factory Post.fromMap(Map<String, dynamic> map){
    return Post(
      id:map['id'],
      receita:map['receita'],
      nomesIngredientes:map['nomesIngredientes'],
      linkImagem:map['linkImagem'],
      tipo:map['tipo'],
      created_at:map['created_at'],
      ingredientesBase:map['ingredientesBase'],
    );


  }

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      'receita': receita,
      'nomesIngredientes': nomesIngredientes,
      'tipo': tipo,
      'created_at': created_at,
      'ingredientesBase': ingredientesBase,
    };
  }

}