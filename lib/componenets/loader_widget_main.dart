import 'package:flutter/cupertino.dart';
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
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: clrAppLight5.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: Image.asset(
                      Imagename.appIcon,
                    ),
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
