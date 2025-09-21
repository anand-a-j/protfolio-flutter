import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/app_text_theme.dart';

class LiveClock extends StatefulWidget {
  const LiveClock({super.key});

  @override
  State<LiveClock> createState() => _LiveClockState();
}

class _LiveClockState extends State<LiveClock> {
  late String _timeString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());

    // update every second
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!mounted) return; // safety check
      setState(() {
        _timeString = _formatDateTime(DateTime.now());
      });
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
    // 👉 use "hh:mm:ss a" for 12-hour format with AM/PM
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "LOCAL/$_timeString",
      style: AppTextTheme.heroSubtitle
    );
  }
}
