#import "RNIsDeviceRooted.h"
#import "UIDevice+PasscodeStatus.h"

@implementation RNIsDeviceRooted

RCT_EXPORT_MODULE(RNIsDeviceRooted);

RCT_REMAP_METHOD(isDeviceLocked,
                 lockresolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    
    @try{
        LNPasscodeStatus status = [UIDevice currentDevice].passcodeStatus;
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

RCT_REMAP_METHOD(isDeviceRooted,
                 rootresolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    // todo: import UIdevice passcodestatus then call the method to verify and return the callback to javascript
    
    @try{
        BOOL isRooted = isJailbroken();
        if (isRooted){
            resolve(@true);
        } else {
            resolve(@false);
        }
        
    } @catch (NSException *exception)
    {
        reject(@"error", @"error trying to detect jailbreaking", exception);
    }
    
}

BOOL isJailbroken()
{
#if !(TARGET_IPHONE_SIMULATOR)
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"] ||
        [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] ||
        [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]])  {
        return YES;
    }
    
    FILE *f = NULL ;
    if ((f = fopen("/bin/bash", "r")) ||
        (f = fopen("/Applications/Cydia.app", "r")) ||
        (f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r")) ||
        (f = fopen("/usr/sbin/sshd", "r")) ||
        (f = fopen("/etc/apt", "r")))  {
        fclose(f);
        return YES;
    }
    fclose(f);
    
    NSError *error;
    NSString *stringToBeWritten = @"This is a test.";
    [stringToBeWritten writeToFile:@"/private/jailbreak.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];
    if(error == nil)
    {
        return YES;
    }
    
#endif
    
    return NO;
}

@end



