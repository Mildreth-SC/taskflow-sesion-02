import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('el panel agrega, completa y respeta la meta de hoy', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('¡Hola, Mildreth Guanoluisa!'), findsOneWidget);
    expect(
      find.text('Cada tarea terminada te acerca a tu meta.'),
      findsOneWidget,
    );
    expect(find.text('Tareas pendientes: 3'), findsOneWidget);
    expect(find.text('Completadas hoy: 0 de 5'), findsOneWidget);
    expect(find.text('Aún tienes tareas por organizar.'), findsOneWidget);
    expect(completeButton(tester).onPressed, isNotNull);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Agregar tarea'));
    await tester.pump();
    await tester.tap(find.widgetWithText(ElevatedButton, 'Agregar tarea'));
    await tester.pump();
    expect(find.text('Tareas pendientes: 5'), findsOneWidget);

    for (var i = 0; i < 5; i++) {
      await tester.tap(
        find.widgetWithText(OutlinedButton, 'Completar una tarea'),
      );
      await tester.pump();
    }

    expect(find.text('Tareas pendientes: 0'), findsOneWidget);
    expect(find.text('Completadas hoy: 5 de 5'), findsOneWidget);
    expect(
      find.text('¡Excelente! No tienes tareas pendientes.'),
      findsOneWidget,
    );
    expect(completeButton(tester).onPressed, isNull);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Agregar tarea'));
    await tester.pump();
    expect(find.text('Tareas pendientes: 1'), findsOneWidget);
    expect(find.text('Completadas hoy: 5 de 5'), findsOneWidget);
    expect(completeButton(tester).onPressed, isNotNull);

    await tester.tap(
      find.widgetWithText(OutlinedButton, 'Completar una tarea'),
    );
    await tester.pump();
    expect(find.text('Tareas pendientes: 0'), findsOneWidget);
    expect(find.text('Completadas hoy: 5 de 5'), findsOneWidget);
    expect(completeButton(tester).onPressed, isNull);
  });
}

OutlinedButton completeButton(WidgetTester tester) {
  return tester.widget<OutlinedButton>(
    find.widgetWithText(OutlinedButton, 'Completar una tarea'),
  );
}
