import 'package:intl/intl.dart';

/// Formats a given timestamp as a human-readable string, based on the
/// timestamp value relative to current time
String? formatTime(DateTime? timestamp) {
  if (timestamp == null) {
    return null;
  }

  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(timestamp);

  if (difference.inSeconds == 0) {
    return "now";
  }

  if (timestamp.isBefore(now)) {
    if (difference.inSeconds >= 1 && difference.inSeconds <= 59) {
      return "${difference.inSeconds} second${difference.inSeconds == 1 ? '' : 's'} ago";
    }
    if (difference.inMinutes == 59 && difference.inSeconds % 60 > 30) {
      // Edge case where minutes == 59 and more than 30 seconds
      return "1 hour(s) ago";
    }
    if (difference.inMinutes >= 1 && difference.inMinutes <= 59) {
      return "${difference.inSeconds % 60 > 30 ? difference.inMinutes + 1 : difference.inMinutes} minute(s) ago";
    }
    if (difference.inHours >= 1 && difference.inHours < 24) {
      return "${difference.inMinutes % 60 > 30 ? difference.inHours + 1 : difference.inHours} hour(s) ago";
    }
    if (difference.inHours >= 24 && difference.inHours < 36) {
      return "one day ago";
    }
    if (difference.inHours >= 36 && difference.inHours < (24 * 7)) {
      return "${difference.inHours % 24 >= 12 ? difference.inDays + 1 : difference.inDays} days ago";
    }
    if (difference.inHours >= (24 * 7)) {
      return formatter.format(timestamp);
    }
  }

  if (timestamp.isAfter(now) && difference.inSeconds.abs() > 1) {
    return formatter.format(timestamp);
  }

  return null;
}
