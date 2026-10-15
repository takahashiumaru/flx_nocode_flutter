import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/shared/services/studio_network_log_interceptor.dart';

void main() {
  group('Studio request id header policy', () {
    test('omits the custom header in browsers where CORS applies', () {
      expect(shouldAttachStudioRequestId(isWeb: true), isFalse);
    });

    test('keeps request correlation on native clients', () {
      expect(shouldAttachStudioRequestId(isWeb: false), isTrue);
    });
  });
}
