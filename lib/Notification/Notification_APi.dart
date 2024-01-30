// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationApi {
//
//   static final _notifications = FlutterLocalNotificationsPlugin();
//   static Future sowNotification({
//
//     int id =0 ,
//     String ? title,
//     String ? body ,
//     String ? payload ,
// }) async =>
// _notifications.show(
//           id,
//           title ,
//            body ,
//     await _notificationDetails(),
//     payload: payload,
//     //notificationDetails
//           );
//
//
// static Future _notificationDetails () async {
//   print('insde notification details ');
//   return NotificationDetails(
//     android: AndroidNotificationDetails(
//       'your channel id', 'your channel name',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//     ),
//     // iOS: IOSNotificationDetails(
//     //
//     // ),
//   );
//      }
// }
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static FlutterLocalNotificationsPlugin? _notifications;

  static FlutterLocalNotificationsPlugin get notifications {
    if (_notifications == null) {
      _notifications = FlutterLocalNotificationsPlugin();
    }
    return _notifications!;
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    await notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  static Future<NotificationDetails> _notificationDetails() async {
    print('Inside notification details');
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'your_channel_id',
        'your_channel_name',
        channelDescription: 'your_channel_description',
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: const BigTextStyleInformation(''),
      ),
      // iOS: IOSNotificationDetails(
      //
      // ),
    );
  }
}
