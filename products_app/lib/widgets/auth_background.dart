import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _PurpleBox(),
          const _Headericon(),
          child,
        ],
      ),
    );
  }
}

class _Headericon extends StatelessWidget {
  const _Headericon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height * 0.4,
        decoration: _purpleDecoration(),
        child: Stack(
          children: const [
            _Bubble(top: 90, left: 30),
            _Bubble(top: -40, left: -30),
            _Bubble(top: -50, right: -20),
            _Bubble(bottom: -50, left: 10),
            _Bubble(bottom: 12, right: 20),
          ],
        ),
      ),
    );
  }

  BoxDecoration _purpleDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  const _Bubble({
    Key? key,
    this.top,
    this.left,
    this.right,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05),
        ),
      ),
    );
  }
}
