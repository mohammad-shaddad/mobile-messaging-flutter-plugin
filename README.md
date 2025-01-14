# Mobile Messaging SDK plugin for Flutter

Mobile Messaging SDK is designed and developed to easily enable push notification channel in your mobile application. In almost no time of implementation you get push notification in your application and access to the features of [Infobip IP Messaging Platform](https://portal.infobip.com/push/).
The document describes plugin integration steps for your Flutter project.

  * [Requirements](#requirements)
  * [Quick start guide](#quick-start-guide)

  ## Requirements
  - Flutter 2.12+

  For iOS project:
  - Xcode 12.5
  - Minimum deployment target 10.0

  For Android project:
  - Android Studio
  - API Level: 19 (Android	4.4 - 4.4.4 KitKat)

  ## Quick start guide
  This guide is designed to get you up and running with Mobile Messaging SDK plugin for Flutter

  1. Make sure to [setup application at Infobip portal](https://www.infobip.com/docs/mobile-app-messaging/create-mobile-application-profile), if you haven't already.

  2. Add MobileMessaging plugin to dependencies at `pubspec.yaml`:

  ```yaml
  dependencies:
      infobip_mobilemessaging: '^0.5.2'

  ```

  3. Run `flutter pub get` to install plugin

  4. Configure iOS.

  - Import MobileMessaging `@import MobileMessaging;` and add `[MobileMessagingPluginApplicationDelegate install];` into `<ProjectName>/ios/Runner/AppDelegate.m` (this is required for OS callbacks such as `didRegisterForRemoteNotifications` to be intercepted by native MobileMessaging SDK) :

  ```objc
              ...
              @import MobileMessaging;

              @implementation AppDelegate

              - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
              {
                  ...
                  [MobileMessagingPluginApplicationDelegate install];
                  ...
              }
              ...
  ```


  <details><summary>expand to see Swift code</summary>

  ```swift

              import MobileMessaging
              ...
              @UIApplicationMain
              @objc class AppDelegate: FlutterAppDelegate {
                override func application(
                   _ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
                 ) -> Bool {
                    ...
                    MobileMessagingPluginApplicationDelegate.install()
                    ...
                 }
               }
              ...
  ```
  </details>


  - Configure your project to support Push Notification as described in item 2 of [iOS integration quick start guide](https://github.com/infobip/mobile-messaging-sdk-ios#quick-start-guide)

  5. Use plugin at yours dart code:
  ```dart
  import 'package:infobip_mobilemessaging/infobip_mobilemessaging.dart';
  import 'package:infobip_mobilemessaging/models/Configuration.dart';

  ...

      await InfobipMobilemessagingFlutterPlugin.init(Configuration(
        applicationCode: "<Your app code>",
        androidSettings: AndroidSettings(
          firebaseSenderId: "<Your Firebase Sender ID>"
        ),
        iosSettings: IOSSettings(
          notificationTypes: ["alert", "badge", "sound"],
          logging: true
        )
      ));

      InfobipMobilemessaging.on(LibraryEvent.MESSAGE_RECEIVED, (Map<String, dynamic> event) => {
        print("Callback. MESSAGE_RECEIVED event,  message title: "  + event["body"])
      });

  ...

  ```
