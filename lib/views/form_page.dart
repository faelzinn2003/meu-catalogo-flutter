import 'package:flutter/material.dart';

import '../controllers/item_controller.dart';
import '../models/item_model.dart';

class FormPage extends StatefulWidget {
  final ItemController controller;
  final ItemModel? itemParaEditar;

  const FormPage({super.key, required this.controller, this.itemParaEditar});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _tituloController;
  late TextEditingController _descricaoController;
  late TextEditingController _categoriaController;

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(
      text: widget.itemParaEditar?.titulo ?? '',
    );
    _descricaoController = TextEditingController(
      text: widget.itemParaEditar?.descricao ?? '',
    );
    _categoriaController = TextEditingController(
      text: widget.itemParaEditar?.categoria ?? '',
    );
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _categoriaController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      if (widget.itemParaEditar == null) {
        widget.controller.adicionar(
          _tituloController.text.trim(),
          _descricaoController.text.trim(),
          _categoriaController.text.trim(),
        );
      } else {
        widget.controller.editar(
          widget.itemParaEditar!.id,
          _tituloController.text.trim(),
          _descricaoController.text.trim(),
          _categoriaController.text.trim(),
        );
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.itemParaEditar != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Editar Item' : 'Novo Item')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(
                  labelText: 'Título *',
                  hintText: 'Digite o título do item',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o título do item';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoriaController,
                decoration: const InputDecoration(
                  labelText: 'Categoria *',
                  hintText: 'Ex: Livro, Equipamento, Jogo',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe a categoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descricaoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descrição *',
                  hintText: 'Digite a descrição detalhada',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe a descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _salvar,
                      child: Text(isEditing ? 'Atualizar' : 'Salvar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
