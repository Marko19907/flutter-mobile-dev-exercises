import 'package:exercise_e2/tools.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  test('Step 3 - timestamp formatting', () {
    final DateTime currentTime = DateTime.now();
    final DateTime someMsInTheFuture =
        currentTime.add(Duration(milliseconds: 20));
    final DateTime someMsInThePast =
        currentTime.subtract(Duration(milliseconds: 20));
    final DateTime future = DateTime(2025, 8, 2, 5, 2, 4);
    final expectedFormattedFuture = "2025-08-02 05:02:04";
    final DateTime oneSecAgo = currentTime.subtract(Duration(seconds: 1));
    final DateTime twoSecAgo = currentTime.subtract(Duration(seconds: 2));
    final DateTime fiftyNineSecAgo =
        currentTime.subtract(Duration(seconds: 59));
    final DateTime longTimeAgo = DateTime(1983, 12, 10, 23, 59, 59);
    final String longTimeAgoString = "1983-12-10 23:59:59";
    final DateTime oneMinAgo = currentTime.subtract(Duration(minutes: 1));
    final DateTime twoMin29SecAgo =
        currentTime.subtract(Duration(minutes: 2, seconds: 29));
    final DateTime twoMin50SecAgo =
        currentTime.subtract(Duration(minutes: 2, seconds: 50));
    final DateTime fiftyNineMinAgo =
        currentTime.subtract(Duration(minutes: 59));
    final DateTime fiftyNineMin59SecAgo =
        currentTime.subtract(Duration(minutes: 59, seconds: 59));
    final DateTime oneHourAgo = currentTime.subtract(Duration(hours: 1));
    final DateTime twoHoursAgo = currentTime.subtract(Duration(hours: 2));
    final DateTime twelveHours20MinAgo =
        currentTime.subtract(Duration(hours: 12, minutes: 20));
    final DateTime twelveHours40MinAgo =
        currentTime.subtract(Duration(hours: 12, minutes: 40));
    final DateTime twentyThreeHoursAgo =
        currentTime.subtract(Duration(hours: 23));
    final DateTime twentyThreeHours29Min29SecAgo =
        currentTime.subtract(Duration(hours: 23, minutes: 29, seconds: 29));
    final DateTime twentyFourHoursAgo =
        currentTime.subtract(Duration(hours: 24));
    final DateTime twentyThreeHours59Min59Sec =
        currentTime.subtract(Duration(hours: 23, minutes: 59, seconds: 59));
    final DateTime twentyFourHours29Min29SecAgo =
        currentTime.subtract(Duration(hours: 24, minutes: 29, seconds: 29));
    final DateTime oneDayAgo = currentTime.subtract(Duration(days: 1));
    final DateTime thirtyHoursAgo = currentTime.subtract(Duration(hours: 30));
    final DateTime thirtyFiveHours59Min59SecAgo =
        currentTime.subtract(Duration(hours: 35, minutes: 59, seconds: 59));
    final DateTime thirtySixHoursAgo =
        currentTime.subtract(Duration(hours: 36));
    final DateTime threeDaysAgo = currentTime.subtract(Duration(days: 3));
    final DateTime fiveDaysAgo = currentTime.subtract(Duration(days: 5));
    final DateTime sixDays23Hours59Min59SecAgo = currentTime
        .subtract(Duration(days: 6, hours: 23, minutes: 59, seconds: 59));
    final DateTime sevenDaysAgo = currentTime.subtract(Duration(days: 7));
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String expectedSevenDaysAgoString = formatter.format(sevenDaysAgo);

    expect(formatTime(null), null);
    expect(formatTime(currentTime), "now");
    expect(formatTime(someMsInThePast), "now");
    expect(formatTime(someMsInTheFuture), "now");
    expect(formatTime(future), expectedFormattedFuture);
    expect(formatTime(oneSecAgo), "1 second ago");
    expect(formatTime(twoSecAgo), "2 seconds ago");
    expect(formatTime(fiftyNineSecAgo), "59 seconds ago");
    expect(formatTime(oneMinAgo), "1 minute(s) ago");
    expect(formatTime(twoMin29SecAgo), "2 minute(s) ago");
    expect(formatTime(twoMin50SecAgo), "3 minute(s) ago");
    expect(formatTime(fiftyNineMinAgo), "59 minute(s) ago");
    expect(formatTime(fiftyNineMin59SecAgo), "1 hour(s) ago");
    expect(formatTime(oneHourAgo), "1 hour(s) ago");
    expect(formatTime(twoHoursAgo), "2 hour(s) ago");
    expect(formatTime(twelveHours20MinAgo), "12 hour(s) ago");
    expect(formatTime(twelveHours40MinAgo), "13 hour(s) ago");
    expect(formatTime(twentyThreeHoursAgo), "23 hour(s) ago");
    expect(formatTime(twentyThreeHours29Min29SecAgo), "23 hour(s) ago");
    expect(formatTime(twentyThreeHours59Min59Sec), "24 hour(s) ago");
    expect(formatTime(twentyFourHoursAgo), "one day ago");
    expect(formatTime(oneDayAgo), "one day ago");
    expect(formatTime(twentyFourHours29Min29SecAgo), "one day ago");
    expect(formatTime(thirtyHoursAgo), "one day ago");
    expect(formatTime(thirtyFiveHours59Min59SecAgo), "one day ago");
    expect(formatTime(thirtySixHoursAgo), "2 days ago");
    expect(formatTime(threeDaysAgo), "3 days ago");
    expect(formatTime(fiveDaysAgo), "5 days ago");
    expect(formatTime(sixDays23Hours59Min59SecAgo), "7 days ago");
    expect(formatTime(sevenDaysAgo), expectedSevenDaysAgoString);
    expect(formatTime(longTimeAgo), longTimeAgoString);
  });
}
