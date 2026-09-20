import 'package:flutter/foundation.dart';

import '../models/item_model.dart';

class ItemController extends ValueNotifier<List<ItemModel>> {
  ItemController() : super([]);

  void adicionar(String titulo, String descricao, String categoria) {
    final novoItem = ItemModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titulo: titulo,
      descricao: descricao,
      categoria: categoria,
    );
    value = [...value, novoItem];
  }

  void editar(String id, String titulo, String descricao, String categoria) {
    final index = value.indexWhere((item) => item.id == id);
    if (index != -1) {
      final listaAtualizada = List<ItemModel>.from(value);
      listaAtualizada[index] = listaAtualizada[index].copyWith(
        titulo: titulo,
        descricao: descricao,
        categoria: categoria,
      );
      value = listaAtualizada;
    }
  }

  void remover(String id) {
    value = value.where((item) => item.id != id).toList();
  }
}
