import 'package:possy_app/src/feature/notification_screens/model/notification_model.dart';

class NotificationState {
  List<List<NotificationModel>>? notificationList;
  NotificationState({this.notificationList});

  NotificationState copyWith({
    List<List<NotificationModel>>? notificationList,
  }) {
    return NotificationState(
      notificationList: notificationList ?? this.notificationList,
    );
  }
}
