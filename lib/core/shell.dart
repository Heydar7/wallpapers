import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper/core/theme/app_assets.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'dart:ui';
import 'package:go_router/go_router.dart';

class Shell extends StatefulWidget {
  final Widget child;

  const Shell({super.key, required this.child});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  static const _navigationBarHeight = 88.0;
  static const _blurIntensity = 66.0;
  static const _iconSize = 24.0;
  static const _navItemWidth = 80.0;
  static const _iconTopPadding = 12.0;
  static const _iconLabelSpacing = 4.0;
  static const _labelFontSize = 12.0;
  static const _borderOpacity = 0.1;
  static const _inactiveOpacity = 0.5;

  static const _navBarGradientColors = [
    CustomColors.navBlack, // Black with 75% opacity
    CustomColors.blur, // #1E1E1E with 75% opacity
  ];

  int _selectedIndex = 0;

  static final _navigationItems = [
    const _NavItem(iconPath: AppAssets.homeIcon, label: 'Home', route: '/home'),
    const _NavItem(iconPath: AppAssets.liveIcon, label: 'Live', route: '/live'),
    const _NavItem(iconPath: AppAssets.aiIcon, label: 'AI', route: '/ai'),
    const _NavItem(
        iconPath: AppAssets.settingsIcon,
        label: 'Settings',
        route: '/settings'),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() => _selectedIndex = index);
    context.go(_navigationItems[index].route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: widget.child,
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  Widget _buildNavigationBar() {
    return Container(
      height: _navigationBarHeight,
      decoration: _buildNavigationBarDecoration(),
      child: ClipRect(
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: _blurIntensity, sigmaY: _blurIntensity),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: _navBarGradientColors,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                _navigationItems.length,
                (index) => _buildNavItem(
                  item: _navigationItems[index],
                  index: index,
                  isSelected: _selectedIndex == index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildNavigationBarDecoration() {
    return BoxDecoration(
      border: Border(
        top: BorderSide(
          color: CustomColors.white.withOpacity(_borderOpacity),
          width: 1,
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required _NavItem item,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: _navItemWidth,
        padding: const EdgeInsets.only(top: _iconTopPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(item.iconPath, isSelected),
            const SizedBox(height: _iconLabelSpacing),
            _buildLabel(item.label, isSelected),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String iconPath, bool isSelected) {
    return SvgPicture.asset(
      iconPath,
      width: _iconSize,
      height: _iconSize,
      matchTextDirection: false,
      colorFilter: ColorFilter.mode(
        isSelected
            ? CustomColors.white
            : CustomColors.white.withOpacity(_inactiveOpacity),
        BlendMode.srcIn,
      ),
    );
  }

  Widget _buildLabel(String label, bool isSelected) {
    return Text(
      label,
      style: TextStyle(
        fontSize: _labelFontSize,
        fontWeight: FontWeight.w400,
        color: isSelected
            ? CustomColors.white
            : CustomColors.white.withOpacity(_inactiveOpacity),
      ),
    );
  }
}

class _NavItem {
  final String iconPath;
  final String label;
  final String route;

  const _NavItem({
    required this.iconPath,
    required this.label,
    required this.route,
  });
}
