#import "ApplePayFlutterPlugin.h"
#if __has_include(<flutter_apple_pay_plus/flutter_apple_pay_plus-Swift.h>)
#import <flutter_apple_pay_plus/flutter_apple_pay_plus-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_apple_pay_plus-Swift.h"
#endif

@implementation ApplePayFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftApplePayFlutterPlugin registerWithRegistrar:registrar];
}
@end
