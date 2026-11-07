# TaskFlow — Sesión 2

Esta versión convierte la bienvenida en un panel con estado. Sigue siendo el mismo archivo: `lib/main.dart`. No se agregan paquetes.

## Qué cambió

`WelcomeScreen` ahora es un `StatefulWidget`. El número de tareas vive en `_WelcomeScreenState` y la pantalla se redibuja con `setState`.

- **Agregar tarea** suma 1 a las pendientes.
- **Completar una tarea** resta 1. Si ya hay 0, no hace nada y el botón queda deshabilitado.
- En 0 el mensaje es `¡Excelente! No tienes tareas pendientes.`
- En cualquier otro valor dice `Aún tienes tareas por organizar.`
- `Completadas hoy: X de 5` sube al completar, y no pasa de 5 (`dailyGoal`).

Se conservan el saludo, `motivationalMessage`, el ícono de la app y la paleta verde.

## Prueba estos casos en el emulador

1. Al abrir: pendientes 3, completadas 0 de 5, los dos botones activos.
2. Pulsa **Agregar tarea** dos veces: debe quedar en 5.
3. Pulsa **Completar una tarea** cinco veces: debe llegar a 0, sin números negativos.
4. En 0, el mensaje felicita y **Completar** no se puede pulsar.
5. Agrega una: vuelve a 1 y **Completar** se habilita.

Toma tú dos capturas: una con el contador en 0 y otra en 1. En ambas debe verse “Completadas hoy”.

## Antes de entregar

Busca `Escribe tu nombre` en `lib/main.dart` y en `test/widget_test.dart`, y pon tu nombre en los dos sitios.

## Comprobar

```bash
dart format lib
flutter analyze
flutter test
```

## Commit de esta sesión

Las sesiones 2, 3 y 4 cierran el domingo 8 de noviembre de 2026 a las 23:59 (UTC-5). Si se pasa esa hora, la entrega puede no ser aceptada.

```bash
git add lib/main.dart
git commit -m "feat: agregar estado de tareas"
git push origin main
```

El mensaje del commit debe ir exactamente así. Si también cambiaste la prueba, inclúyela en el mismo commit:

```bash
git add lib/main.dart test/widget_test.dart
```
