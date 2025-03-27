import Flutter
import UIKit
import FirebaseCore
import FirebaseMessaging

@main
@objc class AppDelegate: FlutterAppDelegate {
  
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Configure Firebase
    FirebaseApp.configure()

    // Register for push notifications
    UNUserNotificationCenter.current().delegate = self
    Messaging.messaging().delegate = self

    // Make sure to call the superclass's implementation
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // This is required to handle background push notifications in iOS
  override func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    // Pass device token to Firebase Messaging
    Messaging.messaging().apnsToken = deviceToken
  }

  // Handle push notification settings (permissions)
  override func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    print("Failed to register for remote notifications with error: \(error)")
  }

  // Handle the incoming push notification
  override func application(
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable: Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    // This method is called when the app is in the background
    Messaging.messaging().appDidReceiveMessage(userInfo)
    completionHandler(UIBackgroundFetchResult.newData)
  }
  
  // This is needed to handle the push notifications in the foreground.
  @available(iOS 10, *)
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    // Show notification when the app is in the foreground
    completionHandler([.alert, .badge, .sound])
  }

  // Handle token updates
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("Firebase registration token: \(String(describing: fcmToken))")
    // Send the token to your backend server or use it within your app
  }
}
