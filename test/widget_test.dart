import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:meu_catalogo_flutter/controllers/item_controller.dart';
import 'package:meu_catalogo_flutter/views/home_page.dart';

void main() {
  testWidgets('Valida a exibição do estado vazio ao iniciar o app', (
    WidgetTester tester,
  ) async {
    final controller = ItemController();

    await tester.pumpWidget(
      MaterialApp(home: HomePage(controller: controller)),
    );

    expect(find.text('Nenhum item cadastrado'), findsOneWidget);
    expect(find.text('Cadastrar Primeiro Item'), findsOneWidget);
  });
}
