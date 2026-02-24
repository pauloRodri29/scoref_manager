import 'dart:async';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class RealTimeClock extends StatefulWidget {
  const RealTimeClock({super.key});

  @override
  State<RealTimeClock> createState() => _RealTimeClockState();
}

class _RealTimeClockState extends State<RealTimeClock> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void didUpdateWidget(covariant RealTimeClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    _timer.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  String _format(int value) => value.toString().padLeft(2, '0');

  String _nowString() =>
      '${_format(_now.hour)}:${_format(_now.minute)}:${_format(_now.second)}';

  String _getPeriod() => _now.hour < 12 ? 'AM' : 'PM';

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRichText(
      "${_nowString()} ${_getPeriod()}",
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      defaultStyle: TextStyle(
        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        color: AppColors.backgroundLight,
        fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
      ),
      patternList: [
        EasyRichTextPattern(
          targetString: _getPeriod(),
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
            fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
          ),
        )
      ],
    );
    // return Text(
    //   "${_now.hour.toString().padLeft(2, '0')}:"
    //   "${_now.minute.toString().padLeft(2, '0')}:"
    //   "${_now.second.toString().padLeft(2, '0')} ${_getPeriod()}",
    //   style:
    //       TextStyle(fontSize: Theme.of(context).textTheme.titleLarge?.fontSize),
    // );
  }
}
