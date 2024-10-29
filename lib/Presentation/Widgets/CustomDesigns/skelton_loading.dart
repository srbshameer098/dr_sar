import 'package:flutter/material.dart';

class LoadAnimation extends StatefulWidget {
  final Widget? child;

  const LoadAnimation({@required this.child, Key? key}) : super(key: key);

  @override
  LoadAnimationState createState() => LoadAnimationState();
}

class LoadAnimationState extends State<LoadAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child!,
        Positioned.fill(
          child: ClipRect(
              child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return FractionallySizedBox(
                widthFactor: .2,
                alignment: AlignmentGeometryTween(
                  begin: const Alignment(-1.0 - .2 * .1, .0),
                  end: const Alignment(1.0 + .2 * 1, .0),
                )
                    .chain(CurveTween(curve: Curves.easeOut))
                    .evaluate(controller)!,
                child: child,
              );
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(0, 255, 255, 255),
                    Colors.white.withOpacity(.5)
                  ],
                ),
              ),
            ),
          )),
        ),
      ],
    );
  }
}
