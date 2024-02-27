import 'package:flutter/cupertino.dart';
import 'package:jain_app/componenets/loader_widget.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/image_constant.dart';


class LoaderWidgetMain extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  const LoaderWidgetMain({required this.child, required this.isLoading, super.key});

  @override
  State<LoaderWidgetMain> createState() => _LoaderWidgetMainState();
}

class _LoaderWidgetMainState extends State<LoaderWidgetMain>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.isLoading)
          LoaderWidget()
      ],
    );
  }
}
