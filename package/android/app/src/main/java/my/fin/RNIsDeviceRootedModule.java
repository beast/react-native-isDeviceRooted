
package my.fin;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import java.io.File;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import android.content.Context;
import android.app.KeyguardManager;


public class RNIsDeviceRootedModule extends ReactContextBaseJavaModule {

	private final ReactApplicationContext reactContext;

	public RNIsDeviceRootedModule(ReactApplicationContext reactContext) {
	super(reactContext);
	this.reactContext = reactContext;
	}

	@Override
	public String getName() {
	return "RNIsDeviceRooted";
	}

	@ReactMethod
	public void isDeviceRooted(Callback errorCallback, Callback successCallback) {
		try {
			boolean isRooted = checkRootMethod1() || checkRootMethod2() || checkRootMethod3();
			successCallback.invoke(isRooted);
		}
		catch (Exception e) {
			errorCallback.invoke(e.getMessage());
		}
	}

	@ReactMethod
	public void isDeviceLocked(Callback errorCallback,Callback successCallback) {
		try {
			boolean isRooted = isLockScreenDisabled();
			successCallback.invoke(isRooted);
		}
		catch (Exception e) {
			errorCallback.invoke(e.getMessage());
		}
	}

    private boolean isLockScreenDisabled() {
        KeyguardManager km = (KeyguardManager) this.reactContext.getSystemService(Context.KEYGUARD_SERVICE);
        if (km.isKeyguardSecure())
        	return true;
        else
			return false;
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