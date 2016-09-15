
#import "RNIsDeviceRooted.h"
#import "UIDevice+PasscodeStatus.h"

@implementation RNIsDeviceRooted

RCT_EXPORT_MODULE(RNIsDeviceRooted)

RCT_EXPORT_METHOD(isDeviceRooted:(RCTResponseSenderBlock)callback)
{
    // todo: import UIdevice passcodestatus then call the method to verify and return the callback to javascript
    LNPasscodeStatus status = [UIDevice currentDevice].passcodeStatus;
    
    switch (status) {
        case LNPasscodeStatusEnabled:
            callback(@[[NSNull null], true]);
            break;
            
        case LNPasscodeStatusDisabled:
            callback(@[[NSNull null], false]);
            break;
            
        case LNPasscodeStatusUnknown:
        default:
            callback(@[[NSString @"Unable to retrieve the status of passcode."], null]);
            break;
    }
    
}
@end
  