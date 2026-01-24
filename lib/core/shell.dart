import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/widgets/components/colors.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';

class Shell extends StatefulWidget {
  final Widget child;

  const Shell({super.key, required this.child});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _selectedIndex = 0;

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/live');
        break;
      case 2:
        context.go('/ai');
        break;
      case 3:
        context.go('/settings');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: widget.child,
      bottomNavigationBar: Container(
        height: 88,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 66, sigmaY: 66),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    const Color(0xFF0E0E0E).withOpacity(0.75),
                    const Color(0xFF0E0E0E).withOpacity(0.75),
                    const Color(0xFF0E0E0E).withOpacity(0.75),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    icon: IconlyBold.home,
                    label: 'Home',
                    index: 0,
                    context: context,
                  ),
                  _buildNavItem(
                    icon: IconlyBold.video,
                    label: 'Live',
                    index: 1,
                    context: context,
                  ),
                  _buildNavItem(
                    icon: Icons.auto_awesome,
                    label: 'AI',
                    index: 2,
                    context: context,
                  ),
                  _buildNavItem(
                    icon: IconlyBold.setting,
                    label: 'Settings',
                    index: 3,
                    context: context,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index, context),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? CustomColors.white
                  : CustomColors.white.withOpacity(0.5),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isSelected
                    ? CustomColors.white
                    : CustomColors.white.withOpacity(0.5),
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 40,
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

