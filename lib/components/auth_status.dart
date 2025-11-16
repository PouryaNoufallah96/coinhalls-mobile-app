import 'package:coin_hall/core/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reown_appkit/modal/appkit_modal_impl.dart';
import 'package:reown_appkit/modal/i_appkit_modal_impl.dart';
import 'package:reown_appkit/modal/widgets/buttons/connect_button.dart';

class AppAuthStatus extends StatefulHookWidget {
  const AppAuthStatus({
    required this.appKit,
    this.builder,
    this.mainAxisAlignment = MainAxisAlignment.center,
    super.key,
  });

  final ReownAppKitModal appKit;
  // ignore: avoid_positional_boolean_parameters
  final Widget Function(BuildContext context, bool isConnected, Widget child)?
      builder;
  final MainAxisAlignment mainAxisAlignment;

  @override
  State<AppAuthStatus> createState() => _AppAuthStatusState();
}

class _AppAuthStatusState extends State<AppAuthStatus> {
  ConnectButtonState _state = ConnectButtonState.none;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _updateState();
    widget.appKit.addListener(_updateState);
  }

  @override
  void didUpdateWidget(covariant AppAuthStatus oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.appKit.removeListener(_updateState);
  }

  void _updateState() {
    setState(() {
      _isConnected = widget.appKit.isConnected;
    });

    if (_state == ConnectButtonState.none && !_isConnected) {
      return;
    }
    if (widget.appKit.status == ReownAppKitModalStatus.error) {
      return setState(() => _state = ConnectButtonState.error);
    } else if (widget.appKit.isConnected) {
      return setState(() => _state = ConnectButtonState.connected);
    } else if (!widget.appKit.hasNamespaces) {
      return setState(() => _state = ConnectButtonState.disabled);
    } else if (!widget.appKit.isOpen && !widget.appKit.isConnected) {
      return setState(() => _state = ConnectButtonState.idle);
    } else if (widget.appKit.isOpen && !widget.appKit.isConnected) {
      return setState(() => _state = ConnectButtonState.connecting);
    }
  }

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
        duration: const Duration(seconds: 1), lowerBound: .5);

    useEffect(() {
      animationController.repeat(reverse: true);
      return null;
    }, []);

    final color = switch (_state) {
      ConnectButtonState.connected => context.colorExtension.success,
      ConnectButtonState.connecting => context.colorScheme.error,
      _ => context.colorScheme.error,
    };

    final text = switch (_state) {
      ConnectButtonState.connected => 'Connected',
      ConnectButtonState.connecting => 'Connecting',
      _ => 'Disconnected',
    };

    final child = Row(
      spacing: 8,
      mainAxisAlignment: widget.mainAxisAlignment,
      children: [
        FadeTransition(
          opacity: animationController,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: const SizedBox.square(
              dimension: 8,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'CentraNo1-Book',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: context.colorExtension.neutral[400],
          ),
        )
      ],
    );

    if (widget.builder != null) {
      return widget.builder!.call(context, _isConnected, child);
    }

    return child;
  }
}
