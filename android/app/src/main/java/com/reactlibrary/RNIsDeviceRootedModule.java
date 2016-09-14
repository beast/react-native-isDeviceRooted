
package com.reactlibrary;

import com.facebook.react.bridge.*;
import java.io.File;
import java.io.BufferedReader;
import java.io.InputStreamReader;


public class RNIsDeviceRootedModule extends ReactContextBaseJavaModule {

	private final ReactContext mReactContext;
    private Activity mActivity;

	public RNIsDeviceRootedModule(ReactApplicationContext reactContext, Activity activity) {
	super(reactContext);

	mActivity = activity;
	mReactContext = reactContext;
	}

	@Override
	public String getName() {
	return "RNIsDeviceRooted";
	}

	@ReactMethod
	public void isDeviceRooted(Callback successCallback, Callback errorCallback) {
		try {
			boolean isRooted = checkRootMethod1() || checkRootMethod2() || checkRootMethod3();
			successCallback.invoke(isRooted);
		}
		catch (Exception e) {
			errorCallback.invoke(e.getMessage());
		}


	}

	private static boolean checkRootMethod1() {
	    String buildTags = android.os.Build.TAGS;
	    return buildTags != null && buildTags.contains("test-keys");
	}

	private static boolean checkRootMethod2() {
	    String[] paths = { "/system/app/Superuser.apk", "/sbin/su", "/system/bin/su", "/system/xbin/su", "/data/local/xbin/su", "/data/local/bin/su", "/system/sd/xbin/su",
	            "/system/bin/failsafe/su", "/data/local/su" };
	    for (String path : paths) {
	        if (new File(path).exists()) return true;
	    }
	    return false;
	}

	private static boolean checkRootMethod3() {
	    Process process = null;
	    try {
	        process = Runtime.getRuntime().exec(new String[] { "/system/xbin/which", "su" });
	        BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
	        if (in.readLine() != null) return true;
	        return false;
	    } catch (Throwable t) {
	        return false;
	    } finally {
	        if (process != null) process.destroy();
	    }
	}
}