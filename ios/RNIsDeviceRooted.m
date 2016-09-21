#import "RNIsDeviceRooted.h"
#import "UIDevice+PasscodeStatus.h"

@implementation RNIsDeviceRooted

RCT_EXPORT_MODULE(RNIsDeviceRooted);

RCT_REMAP_METHOD(isDeviceLocked,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    // todo: import UIdevice passcodestatus then call the method to verify and return the callback to javascript
    LNPasscodeStatus status = [UIDevice currentDevice].passcodeStatus;
    
    @try{
        switch (status) {
            case LNPasscodeStatusEnabled:
                resolve(@true);
                break;
                
            case LNPasscodeStatusDisabled:
                resolve(@false);
                break;
                
            case LNPasscodeStatusUnknown:
            default:
                resolve(@false);
                break;
        }
        
    } @catch (NSException *exception)
    {
        reject(@"error", @"error retrieving password status", exception);
    }
    
}

@end

