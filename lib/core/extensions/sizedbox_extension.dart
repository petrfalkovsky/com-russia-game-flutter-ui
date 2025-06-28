import 'package:flutter/material.dart';
/// Расширение для типа [num], предоставляющее удобные методы для создания
/// [SizedBox] с заданной шириной и высотой.
///
/// Пример использования:
/// ```dart
/// final widthBox = 20.width;  // Создаёт SizedBox с шириной 20
/// final heightBox = 50.height;  // Создаёт SizedBox с высотой 50
/// ```
extension SizedBoxX on num {
  /// Создаёт [SizedBox] с шириной, равной значению числа.
  SizedBox get width => SizedBox(width: toDouble());

  /// Создаёт [SizedBox] с высотой, равной значению числа.
  SizedBox get height => SizedBox(height: toDouble());
}

/// Расширение для типа [String], предоставляющее методы для работы
/// с длиной строк.
///
/// Пример использования:
/// ```dart
/// final shortString = 'Hello'.maxLen(3);  // Результат: 'Hel'
/// final safePartString = 'Hello, Flutter!'.safePart(5);  // Результат: 'Hello..er!'
/// ```
extension StringLengthExtensions on String {
  /// Ограничивает длину строки до [max] символов.
  /// Если длина строки меньше [max], то возвращается исходная строка.
  ///
  /// [max] должен быть неотрицательным числом.
  ///
  /// Пример:
  /// ```dart
  /// final longString = 'Hello, World!'.maxLen(5);  // Результат: 'Hello'
  /// ```
  String maxLen(int max) {
    assert(max > -1, 'max should be non-negative');
    return length < max ? this : substring(0, max);
  }

  /// Возвращает строку, состоящую из двух частей:
  /// первой части (начало строки) длиной [partLength] и
  /// последней части (конец строки) длиной [partLength], с разделителем между ними.
  /// Если [partLength] больше или равно половине длины строки, возвращается исходная строка.
  ///
  /// [partLength] должен быть неотрицательным числом.
  ///
  /// Пример:
  /// ```dart
  /// final shortString = 'Hi'.safePart(1);  // Результат: 'Hi'
  /// final longString = 'Hello, World!'.safePart(5);  // Результат: 'Hello..orld!'
  /// ```
  String safePart(int partLength) {
    assert(partLength > -1, 'partLength should be non-negative');
    if (partLength == 0) {
      return this;
    }
    if (partLength * 2 >= length) {
      return this;
    }
    final start = substring(0, partLength);
    final end = substring(length - partLength, length);
    return '$start..$end';
  }
}
