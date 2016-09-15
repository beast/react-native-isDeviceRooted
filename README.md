
# react-native-is-device-rooted (WIP)

##Features
### Android
- [x] Check if the device is rooted.
- [x] Check if the device has screen lock enabled.
### iOS (WIP)
- [] Check if the device is jailbroken. 
- [] Check if the device has screen lock enabled.

##Requirements
### Android
API 16+
### iOS
iOS 8+


## Getting started

`$ npm install react-native-is-device-rooted --save`

### Mostly automatic installation

`$ react-native link react-native-is-device-rooted`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-is-device-rooted` and add `RNIsDeviceRooted.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNIsDeviceRooted.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNIsDeviceRootedPackage;` to the imports at the top of the file
  - Add `new RNIsDeviceRootedPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-is-device-rooted'
  	project(':react-native-is-device-rooted').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-is-device-rooted/android/app')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-is-device-rooted')
  	```

## Usage
```javascript
import RNIsDeviceRooted from 'react-native-is-device-rooted';

// Check if device is rooted or jailbroken.
RNIsDeviceRooted.isDeviceRooted((err) => { console.log(err); },
		(isRooted) => { console.log(isRooted); });
		
// Check if device has screenslock enabled.
RNIsDeviceRooted.isDeviceLocked((err) => { console.log(err); },
		(isLocked) => { console.log(isLocked); });
```
  