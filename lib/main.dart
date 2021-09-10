import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';
import 'package:laporhoax/common/navigation.dart';
import 'package:laporhoax/common/theme.dart';
import 'package:laporhoax/data/api/laporhoax_api.dart';
import 'package:laporhoax/data/preferences/preferences_helper.dart';
import 'package:laporhoax/provider/laporhoax_provider.dart';
import 'package:laporhoax/provider/preferences_provider.dart';
import 'package:laporhoax/ui/home_page.dart';
import 'package:laporhoax/util/background_service.dart';
import 'package:laporhoax/util/notification_helper.dart';
import 'package:laporhoax/util/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  _service.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final client = Client();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LaporhoaxProvider(apiservice: LaporhoaxApi(client)),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
              preferencesHelper: PreferencesHelper(
                  sharedPreferences: SharedPreferences.getInstance())),
        ),
      ],
      child: MaterialApp(
        title: 'Lapor Hoax',
        theme: mainTheme,
        navigatorKey: navigatorKey,
        initialRoute: HomePage.routeName,
        routes: routes,
      ),
    );
  }
}
