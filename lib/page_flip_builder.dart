import 'package:flutter/material.dart';
import 'package:page_flip/AnimatedPageFlipBuilder.dart';

class PageFlipBuilder extends StatefulWidget {
  final WidgetBuilder frontBuilder;
  final WidgetBuilder backBuilder;

  const PageFlipBuilder(
      {Key? key, required this.frontBuilder, required this.backBuilder})
      : super(key: key);

  @override
  PageFlipBuilderState createState() => PageFlipBuilderState();
}

class PageFlipBuilderState extends State<PageFlipBuilder>
    with SingleTickerProviderStateMixin {
  bool _showFrontSide = true;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.addStatusListener(_updateStatus);
    WidgetsBinding.instance!.addPostFrameCallback((_) => _updateStatus);

    super.initState();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed ||
        status == AnimationStatus.dismissed){
      setState(() =>
        _showFrontSide = !_showFrontSide);
    }
  }

  flip() {
    print("stuff");
    if(_showFrontSide){
      _controller.forward();
    }
    else _controller.reverse();
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPageFlipBuilder(
        animation: _controller,
        showFrontSide: _showFrontSide,
        frontBuilder: widget.frontBuilder,
        backBuilder: widget.backBuilder);
  }
}
