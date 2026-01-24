import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class IOSLockScreenPreview extends StatefulWidget {
  final ImageProvider wallpaper;
  final bool showBottomButtons;

  const IOSLockScreenPreview({
    super.key,
    required this.wallpaper,
    this.showBottomButtons = true,
  });

  @override
  State<IOSLockScreenPreview> createState() => _IOSLockScreenPreviewState();
}

class _IOSLockScreenPreviewState extends State<IOSLockScreenPreview> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('HH:mm').format(_now);
    final date = DateFormat('EEEE, MMMM d').format(_now);

    return Scaffold(
      body: GestureDetector(
        onTap: () => context.pop(),
        child: Stack(
          children: [
            //wallpaper
            Positioned.fill(
              child: Image(
                image: widget.wallpaper,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.05),
              ),
            ),
            //gradient
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.30),
                      Colors.transparent,
                      Colors.black.withOpacity(0.25),
                    ],
                  ),
                ),
              ),
            ),
            //date + time
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //date
                      Text(
                        date,
                        style: const TextStyle(
                          fontFamily: 'SFPro',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.2,
                        ),
                      ),
                      //sizedBox
                      const SizedBox(height: 6),
                      //time
                      Text(
                        time,
                        style: const TextStyle(
                          fontFamily: 'SFPro',
                          color: Colors.white,
                          fontSize: 86,
                          fontWeight: FontWeight.w600,
                          height: 1,
                          letterSpacing: -2.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //buttons
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/flashlight_camera.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
