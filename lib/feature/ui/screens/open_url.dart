import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/ui/widgets/floating_button.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenUrl extends StatefulWidget {
  final String title;
  final String url;

  const OpenUrl({super.key, required this.title, required this.url});

  @override
  State<OpenUrl> createState() => _OpenUrlState();
}

class _OpenUrlState extends State<OpenUrl> {
  late final WebViewController _controller;
  bool isScrolling = false;
  

  @override
  void initState() {
    super.initState();
    
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'Scroll',
        onMessageReceived: (msg) {
          final y = double.tryParse(msg.message) ?? 0;
          final next = y > 0.5;
          if (next != isScrolling) setState(() => isScrolling = next);
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) async {
            //
            await _controller.runJavaScript('''
              (function() {
                window.addEventListener('scroll', function() {
                  Scroll.postMessage(String(window.scrollY || 0));
                }, { passive: true });
                Scroll.postMessage(String(window.scrollY || 0));
              })();
            ''');
          },
        ),
      )
      ..setBackgroundColor(Colors.transparent)
      ..loadRequest(Uri.parse(widget.url));

      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          //appBar
          appBarWithTitle(
            title: widget.title,
            context: context,
            scrolled: isScrolling,
          ),
          //web
          SliverFillRemaining(
            hasScrollBody: true,
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
      //
      floatingActionButton: floatingButtonForURL(isScrolling, _controller),
    );
  }
}
