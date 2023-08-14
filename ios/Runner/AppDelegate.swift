import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var deviceToken = ""
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]) { (didAllow, error) in
            print(didAllow)
        }
        UIApplication.shared.registerForRemoteNotifications()
        let controller : FlutterViewController = window!.rootViewController as! FlutterViewController
        
        let channel = FlutterMethodChannel(name: "iOSPushNotification",
                                           binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({
            [weak self]  (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            // This method is invoked on the UI thread.
            // Handle battery messages.
            guard call.method == "getiOSPushToken" else {
                result(FlutterMethodNotImplemented)
                return
            }
            result(self?.getSum())
        })
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    //Get device token
    override  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        self.deviceToken = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print("The token: \(self.deviceToken)")
    }
    
    override  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        completionHandler(UIBackgroundFetchResult.noData)
    }
    
    override  func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        // Update the app interface directly.
        // Show a banner
        completionHandler(.badge)
    }
    
    private func getSum() -> String {
        return self.deviceToken
    }
    
    
}
