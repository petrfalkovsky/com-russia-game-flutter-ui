import 'package:flutter/material.dart';

/// определение типа устройства на основе размера экрана
enum DeviceType {
  mobile,
  smallTablet, // 800x1280
  mediumTablet, // 1024x1350
  largeTablet, // 1280x1880
}

/// глобальная переменная для хранения последнего известного контекста
BuildContext? _lastKnownContext;

/// обновляем последний известный контекст
/// вызывается в build методах основных виджетов
void updateScaleContext(BuildContext context) {
  _lastKnownContext = context;
}

/// определяет тип устройства на основе размера экрана
DeviceType _getDeviceType(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final width = size.width;
  final height = size.height;

  final minDimension = width < height ? width : height;

  if (minDimension >= 1280) {
    return DeviceType.largeTablet;
  } else if (minDimension >= 1024) {
    return DeviceType.mediumTablet;
  } else if (minDimension >= 800) {
    return DeviceType.smallTablet;
  } else {
    return DeviceType.mobile;
  }
}

/// коэффициент деления для масштабирования
double _getScaleDivider(DeviceType deviceType) {
  switch (deviceType) {
    case DeviceType.largeTablet:
      return 1.08;
    case DeviceType.mediumTablet:
      return 1.5;
    case DeviceType.smallTablet:
      return 1.6;
    case DeviceType.mobile:
      return 3.0;
  }
}

/// внедрено в оригинальную функцию scale
double scale(double value) {
  if (_lastKnownContext != null) {
    try {
      final deviceType = _getDeviceType(_lastKnownContext!);
      final divider = _getScaleDivider(deviceType);
      return value / divider;
    } catch (e) {
      return value / 3.0;
    }
  }

  // базовое масштабирование
  return value / 3.0;
}
