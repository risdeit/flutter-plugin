/// Copyright 2021 Google LLC.
/// SPDX-License-Identifier: Apache-2.0

part of '../../pay.dart';

/// A widget to show the Apple Pay button according to the rules and constraints
/// specified in [PayButton].
///
/// Example usage:
/// ```dart
/// ApplePayButton(
///   paymentConfigurationAsset: 'apple_pay_config.json',
///   paymentItems: _paymentItems,
///   style: ApplePayButtonStyle.black,
///   type: ApplePayButtonType.buy,
///   margin: const EdgeInsets.only(top: 15.0),
///   onPaymentResult: onApplePayResult,
///   loadingIndicator: const Center(
///     child: CircularProgressIndicator(),
///   ),
/// )
/// ```
class ApplePayButton extends PayButton {

  ApplePayButton({
    Key key,
    @required String paymentConfigurationAsset,
    @required void Function(Map<String, dynamic> result) onPaymentResult,
    @required List<PaymentItem> paymentItems,
    ApplePayButtonStyle style = ApplePayButtonStyle.black,
    ApplePayButtonType type = ApplePayButtonType.plain,
    double width = RawApplePayButton.minimumButonWidth,
    double height = RawApplePayButton.minimumButtonHeight,
    EdgeInsets margin = EdgeInsets.zero,
    VoidCallback onPressed,
    void Function(Object error) onError,
    Widget childOnError,
    Widget loadingIndicator,
  })  : assert(width >= RawApplePayButton.minimumButonWidth),
        assert(height >= RawApplePayButton.minimumButtonHeight),
        super(
          key,
          paymentConfigurationAsset,
          onPaymentResult,
          width,
          height,
          margin,
          onError,
          childOnError,
          loadingIndicator,
        ) {
    _payButton = RawApplePayButton(
        style: style,
        type: type,
        onPressed: _defaultOnPressed(onPressed, paymentItems));
  }

  @override
  final List<TargetPlatform> _supportedPlatforms = [TargetPlatform.iOS];

  @override
  Widget _payButton;
}
