import 'package:flutter/material.dart';

import '../models/item_model.dart';

class ItemCardWidget extends StatelessWidget {
  final ItemModel item;
  final VoidCallback onTap;

  const ItemCardWidget({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(
          item.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          item.categoria,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
