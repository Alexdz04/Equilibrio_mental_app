import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as img;

void main() {
  final int size = 1024;
  final image = img.Image(width: size, height: size);

  // Fondo blanco
  img.fill(image, color: img.ColorRgba8(255, 255, 255, 255));

  // Color teal/verde azulado (como el de la app)
  final teal = img.ColorRgba8(0, 150, 136, 255); // #009688

  final centerX = size ~/ 2;
  final centerY = size ~/ 2;

  // Dibujar cabeza (círculo)
  final headRadius = size ~/ 10;
  final headY = centerY - size ~/ 5;
  drawFilledCircle(image, centerX, headY, headRadius, teal);

  // Dibujar cuerpo (triángulo/torso)
  final bodyTop = headY + headRadius + 10;
  final bodyBottom = centerY + size ~/ 6;
  final bodyWidth = size ~/ 4;

  // Torso como un triángulo redondeado
  for (int y = bodyTop; y <= bodyBottom; y++) {
    final progress = (y - bodyTop) / (bodyBottom - bodyTop);
    final halfWidth = (bodyWidth * progress * 0.8).toInt() + size ~/ 20;
    for (int x = centerX - halfWidth; x <= centerX + halfWidth; x++) {
      if (x >= 0 && x < size && y >= 0 && y < size) {
        image.setPixel(x, y, teal);
      }
    }
  }

  // Dibujar piernas cruzadas (como en posición de loto)
  final legY = bodyBottom;
  final legHeight = size ~/ 12;
  final legWidth = size ~/ 3;

  // Pierna izquierda (curva hacia la derecha)
  drawLeg(image, centerX - legWidth ~/ 3, legY, legWidth ~/ 2, legHeight, teal, true);

  // Pierna derecha (curva hacia la izquierda)
  drawLeg(image, centerX + legWidth ~/ 3, legY, legWidth ~/ 2, legHeight, teal, false);

  // Base de las piernas (óvalo horizontal)
  final baseY = legY + legHeight ~/ 2;
  for (int y = baseY - legHeight ~/ 3; y <= baseY + legHeight ~/ 3; y++) {
    for (int x = centerX - legWidth ~/ 2 - size ~/ 20; x <= centerX + legWidth ~/ 2 + size ~/ 20; x++) {
      final dx = (x - centerX) / (legWidth ~/ 2 + size ~/ 20);
      final dy = (y - baseY) / (legHeight ~/ 3);
      if (dx * dx + dy * dy <= 1) {
        if (x >= 0 && x < size && y >= 0 && y < size) {
          image.setPixel(x, y, teal);
        }
      }
    }
  }

  // Dibujar brazos (posición de meditación, manos en las rodillas)
  final armY = bodyTop + (bodyBottom - bodyTop) ~/ 2;
  final armLength = size ~/ 5;
  final armThickness = size ~/ 25;

  // Brazo izquierdo
  drawArm(image, centerX, armY, centerX - armLength, legY + legHeight ~/ 4, armThickness, teal);

  // Brazo derecho
  drawArm(image, centerX, armY, centerX + armLength, legY + legHeight ~/ 4, armThickness, teal);

  // Guardar imagen
  final outputPath = 'assets/icon/app_icon.png';
  final dir = Directory('assets/icon');
  if (!dir.existsSync()) {
    dir.createSync(recursive: true);
  }

  File(outputPath).writeAsBytesSync(img.encodePng(image));
  print('✅ Icono generado en: $outputPath');
  print('📐 Tamaño: ${size}x${size} píxeles');
}

void drawFilledCircle(img.Image image, int cx, int cy, int radius, img.Color color) {
  for (int y = cy - radius; y <= cy + radius; y++) {
    for (int x = cx - radius; x <= cx + radius; x++) {
      if ((x - cx) * (x - cx) + (y - cy) * (y - cy) <= radius * radius) {
        if (x >= 0 && x < image.width && y >= 0 && y < image.height) {
          image.setPixel(x, y, color);
        }
      }
    }
  }
}

void drawLeg(img.Image image, int startX, int startY, int width, int height, img.Color color, bool curveRight) {
  final thickness = image.width ~/ 20;
  for (int i = 0; i <= width; i++) {
    final progress = i / width;
    final curveAmount = sin(progress * 3.14159) * height ~/ 2;
    final x = curveRight ? startX + i : startX - i;
    final y = startY + curveAmount.toInt();

    drawFilledCircle(image, x, y, thickness ~/ 2, color);
  }
}

void drawArm(img.Image image, int x1, int y1, int x2, int y2, int thickness, img.Color color) {
  final steps = 100;
  for (int i = 0; i <= steps; i++) {
    final t = i / steps;
    // Curva bezier para el brazo
    final midX = (x1 + x2) ~/ 2 + (x2 > x1 ? 1 : -1) * image.width ~/ 15;
    final midY = y1 + (y2 - y1) ~/ 3;

    final x = ((1 - t) * (1 - t) * x1 + 2 * (1 - t) * t * midX + t * t * x2).toInt();
    final y = ((1 - t) * (1 - t) * y1 + 2 * (1 - t) * t * midY + t * t * y2).toInt();

    drawFilledCircle(image, x, y, thickness ~/ 2, color);
  }
}
