class ItemModel {
  final String id;
  final String titulo;
  final String descricao;
  final String categoria;

  ItemModel({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.categoria,
  });

  ItemModel copyWith({
    String? id,
    String? titulo,
    String? descricao,
    String? categoria,
  }) {
    return ItemModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
    );
  }
}
