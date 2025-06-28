import 'package:com_russia_game_flutter_ui/core/di/locator.dart';
import 'package:flutter/material.dart';

class AdaptiveSize {
  final double screenWidth;
  final double screenHeight;
  final double designWidth;
  final double designHeight;
  final bool isPhoneDevice;

  AdaptiveSize._({
    required this.screenWidth,
    required this.screenHeight,
    required this.designWidth,
    required this.designHeight,
    required this.isPhoneDevice,
  });

  double dp(double phoneSize, double tabletSize) {
    final targetSize = isPhoneDevice ? phoneSize : tabletSize;
    return (targetSize / designWidth) * screenWidth;
  }

  double dpH(double phoneSize, double tabletSize) {
    final targetSize = isPhoneDevice ? phoneSize : tabletSize;
    return (targetSize / designHeight) * screenHeight;
  }

  double scaleW(double designPixels) {
    return (designPixels / designWidth) * screenWidth;
  }

  double scaleH(double designPixels) {
    return (designPixels / designHeight) * screenHeight;
  }

  bool get isPhone => isPhoneDevice;

  bool get isTablet => !isPhoneDevice;
}

class AdaptiveSizeProvider extends StatefulWidget {
  final Widget child;
  final double designWidthPhone;
  final double designHeightPhone;
  final double designWidthTablet;
  final double designHeightTablet;

  const AdaptiveSizeProvider({
    super.key,
    required this.child,
    this.designWidthPhone = 2340,
    this.designHeightPhone = 1080,
    this.designWidthTablet = 1280,
    this.designHeightTablet = 800,
  });

  @override
  State<AdaptiveSizeProvider> createState() => _AdaptiveSizeProviderState();
}

class _AdaptiveSizeProviderState extends State<AdaptiveSizeProvider> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    const tabletBreakpoint = 1000.0;
    final isPhone = screenWidth < tabletBreakpoint;

    final designWidth =
        isPhone ? widget.designWidthPhone : widget.designWidthTablet;
    final designHeight =
        isPhone ? widget.designHeightPhone : widget.designHeightTablet;

    final adaptiveSizeData = AdaptiveSize._(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      designWidth: designWidth,
      designHeight: designHeight,
      isPhoneDevice: isPhone,
    );

    if (getIt.isRegistered<AdaptiveSize>()) {
      getIt.unregister<AdaptiveSize>();
    }
    getIt.registerSingleton<AdaptiveSize>(adaptiveSizeData);

    return widget.child;
  }
}
