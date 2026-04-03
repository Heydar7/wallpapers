import 'package:flutter/material.dart';

abstract class BaseScrollScreen<T extends StatefulWidget> extends State<T> {
  late final ScrollController scrollController;
  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final s = scrollController.offset > 0;
    if (s != isScrolled) {
      setState(() => isScrolled = s);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
