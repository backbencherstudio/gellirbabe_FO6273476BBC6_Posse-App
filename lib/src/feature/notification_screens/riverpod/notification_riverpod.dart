import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/feature/notification_screens/model/notification_model.dart';
import 'package:possy_app/src/feature/notification_screens/riverpod/notification_state.dart';

final notificationRiverpod =
    StateNotifierProvider<NotificationRiverpod, NotificationState>(
      (ref) => NotificationRiverpod(),
    );

class NotificationRiverpod extends StateNotifier<NotificationState> {
  NotificationRiverpod() : super(NotificationState()) {
    fetchNotificationData();
  }

  final List<Map<String, dynamic>> dummyJsonNotificationData = const [
    {
      "title":
          "Shakin Sent You a Private Message: I Can’t Stop Thinking About You",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-08T14:30:00Z",
    },
    {
      "title": "Angie Sent You a Private Message: You Make Me Smile",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-09T09:00:00Z",
    },
    {
      "title": "Safrid Sent You a Private Message: You Looked Cute Today",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-07T18:45:00Z",
    },
    {
      "title": "Sujoy Sent You a Private Message: I Have a Crush on You",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-06T11:15:00Z",
    },
    {
      "title": "Shakhawat Sent You a Private Message: What’s on Your Mind?",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-08T22:10:00Z",
    },
    {
      "title": "Saiful Sent You a Private Message: Want to Go Out Sometime?",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-05T07:40:00Z",
    },
    {
      "title": "Sharah Sent You a Private Message: Need to Tell You Something",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-04T12:00:00Z",
    },
    {
      "title": "Shakin Sent You a Private Message: Miss You!",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-08T16:50:00Z",
    },
    {
      "title": "Sujoy Sent You a Private Message: Want to Go Out Sometime?",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-09T02:00:00Z",
    },
    {
      "title": "Olivia Sent You a Private Message: You’re Amazing",
      "profilePicture": AppImages.male,
      "dateTime": "2025-05-03T10:25:00Z",
    },
  ];

  Future<void> fetchNotificationData() async {
    /// convert json/map data to dart list
    final List<NotificationModel> notificationList =
        dummyJsonNotificationData.map((notification) {
          return NotificationModel.fromJson(notification);
          // return NotificationModel(
          //   title: notification["title"],
          //   profilePicture: notification["profilePicture"],
          //   dateTime: notification["dateTime"],
          // );
        }).toList();

    notificationList.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    debugPrint("\n\Raw Notification List : $notificationList\n\n");

    List<List<NotificationModel>> convertedNotificationList =
        makeNotificationList(list: notificationList);

    debugPrint(
      "\n\nConverted Notification List : $convertedNotificationList\n\n",
    );

    state = state.copyWith(notificationList: convertedNotificationList);
  }

  /// make notification sub list by date matching
  List<List<NotificationModel>> makeNotificationList({
    required List<NotificationModel> list,
  }) {
    final List<List<NotificationModel>> mainList = [];
    List<NotificationModel> subList = [];
    for (int i = 0; i < list.length; i++) {
      /// If the first item of the list then just add it to sublist
      if (i == 0) {
        subList.add(list[i]);
        continue;
      }

      /// If the current index day is same with previous index day then add it to the sublist
      if (list[i].dateTime.day == list[i - 1].dateTime.day) {
        subList.add(list[i]);
        continue;
      }
      /// if not same then make the sublist empty, add notification to a new empty sublist
      else if (list[i].dateTime.isBefore(list[i - 1].dateTime)) {
        mainList.add(subList);
        subList = [];
        subList.add(list[i]);
        continue;
      }
    }

    return mainList;
  }
}
