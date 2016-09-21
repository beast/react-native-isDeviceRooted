
# react-native-isDeviceRooted (WIP)

##Features
### Android
- [x] Check if the device is rooted.
- [x] Check if the device has screen lock enabled.
  
### iOS (WIP)
- [ ] Check if the device is jailbroken. 
- [x] Check if the device has screen lock enabled.

##Requirements
### Android
API 16+
### iOS
iOS 8+
### React Native
RN 0.27+


## Getting started

`$ npm install react-native-isDeviceRooted --save`

### Mostly automatic installation
Please follow manual instructions if this is not working.  
**Note: iOS will not automatically install because I am wrapping another library via cocoapods. Please follow manual instruction. (Suggestions welcome.)**

`$ rnpm link react-native-isDeviceRooted`

## Manual installation


### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-isDeviceRooted` and add `RNIsDeviceRooted.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNIsDeviceRooted.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Click RNIsDeviceRooted.xcodeproj in the project navigator and go the **Build Settings** tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for **Header Search Paths** and make sure it contains:

	**$(SRCROOT)/../../React  
	$(SRCROOT)/../../react-native/React  
	${SRCROOT}/../../react-native-isDeviceRooted/ios/Pods/Headers/Public  
	${SRCROOT}/../../react-native-isDeviceRooted/ios/Pods/Headers/Public/UIDevice-PasscodeStatus**

5. Inside your ../node_modules/react-native-isDeviceRooted/ios directory add a file named **Podfile** with the following [content](https://github.com/beast/react-native-isDeviceRooted/blob/master/Podfile.template)
6. Run pod install in the directory mentioned in step 5
7. Run react-native run-ios

**Note: If you are building inside of xcode, make sure you open the workspace file not the proejct file.**

#### CocoaPods Warning

If you get the following warning.

```
!] The `<YourAppName> [Debug]` target overrides the `OTHER_LDFLAGS` build setting defined in `Pods/Target Support Files/Pods/Pods.debug.xcconfig'. This can lead to problems with the CocoaPods installation
    - Use the `$(inherited)` flag, or
    - Remove the build settings from the target.

[!] The `<YourAppName> [Release]` target overrides the `OTHER_LDFLAGS` build setting defined in `Pods/Target Support Files/Pods/Pods.release.xcconfig'. This can lead to problems with the CocoaPods installation
    - Use the `$(inherited)` flag, or
    - Remove the build settings from the target.
```

Click `<YourAppName>.xcodeproj` in the project navigator and go the `Build Settings` tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for `Other Linker Flags` and replace the value `-ObjC` with the value `$(inherited)` for your Application's Target.

### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import my.fin.RNIsDeviceRootedPackage;` to the imports at the top of the file
  - Add `new RNIsDeviceRootedPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-isDeviceRooted'
  	project(':react-native-isDeviceRooted').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-isDeviceRooted/android/app')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-isDeviceRooted')
  	```

## Usage
```javascript
import RNIsDeviceRooted from 'react-native-isDeviceRooted';

// Check if device is rooted or jailbroken.
	async isDeviceRooted() {
		try {
			const result = await RNIsDeviceRooted.isDeviceRooted();
			console.log(result);
		} catch (e) {
			console.error(e);
		}
	}
		
// Check if device has screenslock enabled.
	async isDeviceLocked() {
		try {
			const result = await RNIsDeviceRooted.isDeviceLocked();
			console.log(result);
		} catch (e) {
			console.error(e);
		}
	}
```
 
##License 
[MIT](./License)

##Credit
liamnichols - [UIDevice-Password](https://github.com/liamnichols/UIDevice-PasscodeStatus)
