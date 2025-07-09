import 'package:flutter/material.dart';
/// {@category SDP}
///
/// Этот файл предоставляет утилиту для адаптивного изменения размера элементов
/// в зависимости от размеров экрана. Используется для достижения масштабируемости
/// пользовательского интерфейса.
///
/// Поддерживает экраны с различным соотношением сторон и обеспечивает
/// согласованное представление элементов на разных устройствах.
///
/// Пример использования:
/// ```dart

/// import 'package:your_package_name/sdp.globals.dart';
///
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(title: Text('SDP Example')),
///       body: Center(
///         child: Container(
///           width: sdp(context, 100), // адаптивная ширина
///           height: sdp(context, 50), // адаптивная высота
///           color: AppColors.blue,
///           child: Center(
///             child: Text('Adaptive Size'),
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```

/// Преобразует значение пикселей в адаптивные размеры в зависимости от размера экрана.
///
/// Использует ширину или высоту экрана (в зависимости от того, какая из них меньше),
/// чтобы масштабировать размер пикселей (px) в единицы, подходящие для текущего экрана.
///
/// В случае, если ширина экрана меньше высоты, используется ширина экрана для расчета.
/// В противном случае используется высота экрана.
///
/// Параметры:
/// - [context] — контекст виджета, который используется для получения информации о размере экрана.
/// - [px] — значение в пикселях, которое необходимо преобразовать в адаптивный размер.
///
/// Возвращаемое значение:
/// - Размер в логических единицах, который масштабируется в зависимости от размера экрана.
///
/// Пример использования:
/// ```dart
/// double adaptiveWidth = sdp(context, 150); // адаптивная ширина
/// double adaptiveHeight = sdp(context, 75); // адаптивная высота
/// ```
///
///
/// Этим коэфициентов можно подгоять размер всего содержимого на экране (при единице у меня все сошлось по макету, но
/// на Android Resizable эмуляторе контент выходил за рамки экрана по ширине)
const fittingCoefficient = 0.873;

double sdp(BuildContext context, double px) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  if (width < height) {
    return (px * 0.29166 / 300) * width * fittingCoefficient;
  } else {
    return (px * 0.29166 / 300) * height * fittingCoefficient;
  }
}

const fittingCoefficientW = 0.873;

double sdpW(BuildContext context, double px) {
  double width = MediaQuery.of(context).size.width * 0.5;
  double height = MediaQuery.of(context).size.height;
  if (width < height) {
    return (px * 0.29166 / 300) * width * fittingCoefficientW;
  } else {
    return (px * 0.29166 / 300) * height * fittingCoefficientW;
  }
}

const fittingCoefficientWH = 0.873;

double sdpWH(BuildContext context, double px) {
  double width = MediaQuery.of(context).size.width * 0.5;
  double height = MediaQuery.of(context).size.height * 0.5;
  if (width < height) {
    return (px * 0.29166 / 300) * width * fittingCoefficientWH;
  } else {
    return (px * 0.29166 / 300) * height * fittingCoefficientWH;
  }
}

double sdpExtraW(BuildContext context, double px) {
  double width = MediaQuery.of(context).size.width * 0.35;
  double height = MediaQuery.of(context).size.height;
  if (width < height) {
    return (px * 0.29166 / 300) * width * fittingCoefficient;
  } else {
    return (px * 0.29166 / 300) * height * fittingCoefficient;
  }
}


scale(double value) =>  value / 3.0;