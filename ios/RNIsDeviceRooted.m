#import "RNIsDeviceRooted.h"
#import "UIDevice+PasscodeStatus.h"

@implementation RNIsDeviceRooted

RCT_EXPORT_MODULE(RNIsDeviceRooted);

RCT_EXPORT_METHOD(isDeviceLocked:(RCTResponseSenderBlock)errorCallback, (RCTResponseSenderBlock)successCallback)
{
    // todo: import UIdevice passcodestatus then call the method to verify and return the callback to javascript
    LNPasscodeStatus status = [UIDevice currentDevice].passcodeStatus;
    
    switch (status) {
        case LNPasscodeStatusEnabled:
            successCallback(@[@true]);
            break;
            
        case LNPasscodeStatusDisabled:
            successCallback(@[@false]);
            break;
            
        case LNPasscodeStatusUnknown:
        default:
            errorCallback(@[@"Unable to retrieve the status of passcode."]);
            break;
    }
    
}

@end
