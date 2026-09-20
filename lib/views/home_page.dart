import 'package:flutter/material.dart';

import '../controllers/item_controller.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/item_card_widget.dart';
import 'detail_page.dart';
import 'form_page.dart';

class HomePage extends StatelessWidget {
  final ItemController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo Pessoal')),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, lista, child) {
          if (lista.isEmpty) {
            return EmptyStateWidget(
              onAddPressed: () => _abrirFormulario(context),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;

              if (crossAxisCount == 1) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    final item = lista[index];
                    return ItemCardWidget(
                      item: item,
                      onTap: () => _abrirDetalhe(context, item),
                    );
                  },
                );
              } else {
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    final item = lista[index];
                    return ItemCardWidget(
                      item: item,
                      onTap: () => _abrirDetalhe(context, item),
                    );
                  },
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Adicionar Item',
        onPressed: () => _abrirFormulario(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _abrirFormulario(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormPage(controller: controller)),
    );
  }

  void _abrirDetalhe(BuildContext context, item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(item: item, controller: controller),
      ),
    );
  }
}
