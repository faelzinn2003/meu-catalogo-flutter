import 'package:flutter/material.dart';

import '../controllers/item_controller.dart';
import '../models/item_model.dart';
import 'form_page.dart';

class DetailPage extends StatelessWidget {
  final ItemModel item;
  final ItemController controller;

  const DetailPage({super.key, required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, lista, child) {
        final itemAtualizado = lista.firstWhere(
          (element) => element.id == item.id,
          orElse: () => item,
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Detalhes do Item'),
            actions: [
              IconButton(
                tooltip: 'Editar Item',
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormPage(
                        controller: controller,
                        itemParaEditar: itemAtualizado,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                tooltip: 'Excluir Item',
                icon: const Icon(Icons.delete),
                onPressed: () {
                  controller.remover(itemAtualizado.id);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(label: Text(itemAtualizado.categoria)),
                const SizedBox(height: 16),
                Text(
                  itemAtualizado.titulo,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Text(
                  'Descrição:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  itemAtualizado.descricao,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
