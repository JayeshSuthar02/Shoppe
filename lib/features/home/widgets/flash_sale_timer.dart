import 'dart:async';
import 'package:flutter/material.dart';

class FlashSaleManager {
  static const Duration initialDuration = Duration(hours: 0, minutes: 23, seconds: 58);
  static final ValueNotifier<Duration> remainingTime = ValueNotifier(initialDuration);
  static Timer? _timer;

  static void startTimer() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value.inSeconds <= 0) {
        _timer?.cancel();
      } else {
        remainingTime.value = Duration(seconds: remainingTime.value.inSeconds - 1);
      }
    });
  }
}

class FlashSaleTimer extends StatelessWidget {
  const FlashSaleTimer({super.key});

  Widget _buildTimeCard(String time) {
    return Container(
      height: 25,
      width: 28,
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          time,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FlashSaleManager.startTimer();

    return ValueListenableBuilder<Duration>(
      valueListenable: FlashSaleManager.remainingTime,
      builder: (context, duration, child) {
        String twoDigits(int n) => n.toString().padLeft(2, '0');
        final hours = twoDigits(duration.inHours);
        final minutes = twoDigits(duration.inMinutes.remainder(60));
        final seconds = twoDigits(duration.inSeconds.remainder(60));

        return Row(
          children: [
            _buildTimeCard(hours),
            const SizedBox(width: 3),
            _buildTimeCard(minutes),
            const SizedBox(width: 3),
            _buildTimeCard(seconds),
          ],
        );
      },
    );
  }
}
