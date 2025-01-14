
class Configuration {
  /// The application code of your Application from Push Portal website
  final String applicationCode;

  String? pluginVersion;

  final bool? inAppChatEnabled;

  final AndroidSettings? androidSettings;

  final IOSSettings? iosSettings;

  final PrivacySettings? privacySettings;

  final List<NotificationCategory>? notificationCategories;

  final bool? defaultMessageStorage;

  Configuration({
    required this.applicationCode,
    this.pluginVersion,
    this.inAppChatEnabled,
    this.androidSettings,
    this.iosSettings,
    this.privacySettings,
    this.notificationCategories,
    this.defaultMessageStorage,
  });

  Map<String, dynamic> toJson() {
    return {
      'applicationCode': applicationCode,
      'pluginVersion': pluginVersion,
      'inAppChatEnabled': inAppChatEnabled,
      'androidSettings': (this.androidSettings !=null)? this.androidSettings!.toJson() : null,
      'iosSettings': (this.iosSettings !=null)? this.iosSettings!.toJson(): null,
      'privacySettings': (this.privacySettings !=null)? this.privacySettings!.toJson() : null,
      'notificationCategories': (this.notificationCategories !=null)? this.notificationCategories!.map((e) => e.toJson()) : null,
      'defaultMessageStorage': defaultMessageStorage
    };
  }
}

class AndroidSettings {
  /// The application code of your Application from Push Portal website
  final String? firebaseSenderId;

  // A resource name for a status bar icon (without extension), located in '/platforms/android/app/src/main/res/mipmap'
  final String? notificationIcon;
  final bool? multipleNotifications;
  final String? notificationAccentColor;

  AndroidSettings({this.firebaseSenderId, this.notificationIcon,
    this.multipleNotifications, this.notificationAccentColor});

  Map<String, dynamic> toJson() =>
      {
        'firebaseSenderId': firebaseSenderId,
        'notificationIcon': notificationIcon,
        'multipleNotifications': multipleNotifications,
        'notificationAccentColor': notificationAccentColor
      };
}

class IOSSettings {
  final List<String>? notificationTypes;
  final bool? forceCleanup;
  final bool? logging;
  final WebViewSettings? webViewSettings;

  IOSSettings({this.notificationTypes, this.forceCleanup, this.logging, this.webViewSettings});

  Map<String, dynamic> toJson() =>
      {
        'notificationTypes': notificationTypes,
        'forceCleanup': forceCleanup,
        'logging': logging,
        'webViewSettings': (this.webViewSettings != null)? this.webViewSettings!.toJson() : null
      };
}

class WebViewSettings {
  final String? title;
  final String? barTintColor;
  final String? titleColor;
  final String? tintColor;

  WebViewSettings({this.title, this.barTintColor, this.tintColor, this.titleColor});

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'barTintColor': barTintColor,
        'titleColor': titleColor,
        'tintColor': tintColor
      };
}

class PrivacySettings {
  final bool? applicationCodePersistingDisabled;
  final bool? userDataPersistingDisabled;
  final bool? carrierInfoSendingDisabled;
  final bool? systemInfoSendingDisabled;

  PrivacySettings({this.applicationCodePersistingDisabled,
      this.userDataPersistingDisabled,
      this.carrierInfoSendingDisabled,
      this.systemInfoSendingDisabled});

  Map<String, dynamic> toJson() =>
      {
        'applicationCodePersistingDisabled': applicationCodePersistingDisabled,
        'userDataPersistingDisabled': userDataPersistingDisabled,
        'carrierInfoSendingDisabled': carrierInfoSendingDisabled,
        'systemInfoSendingDisabled': systemInfoSendingDisabled
      };
}

class NotificationAction {
  final String? identifier;
  final String? title;
  final bool? foreground;
  final bool? authenticationRequired;
  final bool? moRequired;
  final bool? destructive;
  final String? icon;
  final String? textInputActionButtonTitle;
  final String? textInputPlaceholder;

  NotificationAction({this.identifier,
      this.title,
      this.foreground,
      this.authenticationRequired,
      this.moRequired,
      this.destructive,
      this.icon,
      this.textInputActionButtonTitle,
      this.textInputPlaceholder});

  Map<String, dynamic> toJson() =>
      {
        'identifier': identifier,
        'title': title,
        'foreground': foreground,
        'authenticationRequired': authenticationRequired,
        'moRequired': moRequired,
        'destructive': destructive,
        'icon': icon,
        'textInputActionButtonTitle': textInputActionButtonTitle,
        'textInputPlaceholder': textInputPlaceholder,
      };

}

class NotificationCategory {
  final String? identifier;
  final List<NotificationAction>? actions;

  NotificationCategory({this.identifier, this.actions});

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>>? actions = this.actions!.map((i) => i.toJson()).toList();
    return {
      'identifier': identifier,
      'actions': actions
    };
  }

}