import 'package:coin_hall/components/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NestedPage extends StatefulHookWidget {
  const NestedPage({
    required this.child,
    super.key,
  });

  final StatefulNavigationShell child;

  @override
  State<NestedPage> createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    useOnAppLifecycleStateChange((previous, current) {
      if (previous == AppLifecycleState.inactive &&
          current == AppLifecycleState.resumed &&
          context.mounted) {}
    });

    return AppScaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: widget.child,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _BottomNav(
                shell: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.shell,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4024d1).withValues(alpha: .16),
            blurRadius: 16,
            spreadRadius: -4,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        spacing: 32,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _NavItem(
            text: 'History',
            src: 'assets/icons/history.svg',
            withBackground: false,
            onTap: shell.goBranch,
            index: 0,
            groupIndex: shell.currentIndex,
          ),
          _NavItem(
            text: null,
            src: 'assets/icons/add_plus.svg',
            withBackground: true,
            onTap: shell.goBranch,
            index: 1,
            groupIndex: shell.currentIndex,
          ),
          _NavItem(
            text: 'Setting',
            src: 'assets/icons/settings.svg',
            withBackground: false,
            onTap: shell.goBranch,
            index: 2,
            groupIndex: shell.currentIndex,
          ),
        ],
      ),
    );

    return CustomPaint(
      painter: _BottomNavPainter(),
      size: const Size.fromHeight(116),
      child: SizedBox(
        height: 116,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => shell.goBranch(1),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  spacing: 12,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            const Color(0xff01FFF8).withValues(alpha: .15),
                            const Color(0xff01FFF8).withValues(alpha: .05),
                          ],
                        ),
                        shape: BoxShape.circle,
                        border: BoxBorder.all(
                          color: const Color(0xff01FFF8),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Color(0xff01FFF8),
                          size: 32,
                        ),
                      ),
                    ),
                    const Text(
                      'Start',
                      style: TextStyle(
                        color: Color(0xff34BEBA),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                spacing: 32,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _NavItem(
                    text: 'History',
                    src: 'assets/icons/history.svg',
                    withBackground: false,
                    onTap: shell.goBranch,
                    index: 0,
                    groupIndex: shell.currentIndex,
                  ),
                  const SizedBox.square(dimension: 46),
                  _NavItem(
                    text: 'Setting',
                    src: 'assets/icons/settings.svg',
                    withBackground: false,
                    onTap: shell.goBranch,
                    index: 2,
                    groupIndex: shell.currentIndex,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.text,
    required this.src,
    required this.withBackground,
    required this.onTap,
    required this.index,
    required this.groupIndex,
  });

  final String src;
  final String? text;
  final bool withBackground;
  final int index;
  final void Function(int index) onTap;
  final int groupIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => onTap(index),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (text == null)
                const CircleAvatar(
                  radius: 24,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                )
              else
                SvgPicture.asset(
                  src,
                  height: 24,
                  width: 24,
                  colorFilter: index == groupIndex && !withBackground
                      ? const ColorFilter.mode(
                          Color(0xffFFCD4E), BlendMode.srcIn)
                      : const ColorFilter.mode(
                          Color(0xffFFEEB9), BlendMode.srcIn),
                ),
              if (text != null)
                Text(
                  text!,
                  style: TextStyle(
                    fontFamily: 'CentraNo1-Medium',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: index == groupIndex
                        ? const Color(0xffFFCD4E)
                        : const Color(0xffFFEEB9),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * .3)
      ..lineTo(size.width * .33, size.height * .3)
      ..arcToPoint(Offset(size.width * .67, size.height * .3),
          radius: const Radius.circular(68))
      ..lineTo(size.width, size.height * .3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    final shadowPath = Path()
      ..moveTo(0, size.height * .3 - 6)
      ..lineTo(size.width * .33, size.height * .3 - 6)
      ..arcToPoint(Offset(size.width * .67, size.height * .3 - 6),
          radius: const Radius.circular(68))
      ..lineTo(size.width, size.height * .3 - 6)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas
      ..drawShadow(
          shadowPath, const Color(0xffFFC65E).withValues(alpha: .6), 4, true)
      ..drawPath(
        path,
        Paint()
          ..color = const Color(0xff201C17)
          ..style = PaintingStyle.fill,
      );
  }

  @override
  bool shouldRepaint(_BottomNavPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_BottomNavPainter oldDelegate) => false;
}
