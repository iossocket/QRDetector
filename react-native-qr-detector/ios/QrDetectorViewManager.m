#import "React/RCTViewManager.h"

@interface RCT_EXTERN_REMAP_MODULE(QrDetectorView, QrDetectorViewManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(color, NSString)

RCT_EXTERN_METHOD(getCameraPermissionStatus:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject);
RCT_EXTERN_METHOD(requestCameraPermission:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject);

RCT_EXPORT_VIEW_PROPERTY(onResult, RCTDirectEventBlock);

@end
