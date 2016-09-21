
# react-native-isDeviceRooted (WIP)

##Features
### Android
- [x] Check if the device is rooted.
- [x] Check if the device has screen lock enabled.
  
### iOS (WIP)
- [ ] Check if the device is jailbroken. 
- [ ] Check if the device has screen lock enabled.

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
Please follow manual instructions if this is not working. (iOS is not quite there yet. Suggestions welcome.)

`$ rnpm link react-native-isDeviceRooted`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-isDeviceRooted` and add `RNIsDeviceRooted.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNIsDeviceRooted.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Click RNIsDeviceRooted.xcodeproj in the project navigator and go the **Build Settings** tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for **Header Search Paths** and make sure it contains $(SRCROOT)/../react-native/React, $(SRCROOT)/../../React, ${SRCROOT}/../../ios/Pods/Headers/Public marked as **recursive**.
5. Inside your ios directory add a file named **Podfile** with the following [content](https://github.com/beast/react-native-isDeviceRooted/blob/master/Podfile.template)
6. Run pod install --project-directory=ios
7. Run react-native run-ios

Note: If you are building inside of xcode, make sure you open the workspace file not the proejct file.

#### Android

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
RNIsDeviceRooted.isDeviceRooted((err) => { console.log(err); },
		(isRooted) => { console.log(isRooted); });
		
// Check if device has screenslock enabled.
RNIsDeviceRooted.isDeviceLocked((err) => { console.log(err); },
		(isLocked) => { console.log(isLocked); });
```
 
##License 
[MIT](./License)

##Credit
liamnichols - [UIDevice-Password](https://github.com/liamnichols/UIDevice-PasscodeStatus)
