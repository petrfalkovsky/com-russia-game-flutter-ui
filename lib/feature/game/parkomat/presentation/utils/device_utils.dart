import 'package:flutter/material.dart';

// /// Определение типа устройства на основе размера экрана
// enum DeviceType {
//   mobile,
//   smallTablet,  // 800x1280
//   mediumTablet, // 1024x1350  
//   largeTablet,  // 1280x1880
// }

// /// Глобальная переменная для хранения последнего известного контекста
// BuildContext? _lastKnownContext;

// /// Обновляет последний известный контекст
// /// Вызывайте это в build методах ваших основных виджетов
// void updateScaleContext(BuildContext context) {
//   _lastKnownContext = context;
// }

// /// Определяет тип устройства на основе размера экрана
// DeviceType _getDeviceType(BuildContext context) {
//   final size = MediaQuery.of(context).size;
//   final width = size.width;
//   final height = size.height;
  
//   final minDimension = width < height ? width : height;
  
//   if (minDimension >= 1280) {
//     return DeviceType.largeTablet;
//   } else if (minDimension >= 1024) {
//     return DeviceType.mediumTablet;
//   } else if (minDimension >= 800) {
//     return DeviceType.smallTablet;
//   } else {
//     return DeviceType.mobile;
//   }
// }

// /// Получает коэффициент деления для масштабирования
// double _getScaleDivider(DeviceType deviceType) {
//   switch (deviceType) {
//     case DeviceType.largeTablet:
//       return 1.5;
//     case DeviceType.mediumTablet:
//       return 2.0;
//     case DeviceType.smallTablet:
//       return 2.5;
//     case DeviceType.mobile:
//       return 3.0;
//   }
// }

// /// Заменяем оригинальную функцию scale
// double scale(double value) {
//   if (_lastKnownContext != null) {
//     try {
//       final deviceType = _getDeviceType(_lastKnownContext!);
//       final divider = _getScaleDivider(deviceType);
//       return value / divider;
//     } catch (e) {
//       // Fallback в случае ошибки
//       return value / 3.0;
//     }
//   }
  
//   // Базовое масштабирование
//   return value / 3.0;
// }