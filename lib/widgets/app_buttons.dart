import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';

import '../constants/app_colors.dart';

class AppButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final ButtonPadding padding;
  final bool expand;

  const AppButton({
    super.key,
    required this.child,
    this.onTap,
    this.color = Colors.black,
    this.padding = ButtonPadding.normal,
    this.expand = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.95,
      upperBound: 1.0,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.reverse();
    HapticFeedback.lightImpact();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.forward();
    HapticFeedback.lightImpact();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: (widget.expand) ? double.infinity : null,
          padding: (switch (widget.padding) {
            (ButtonPadding.normal) =>
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            (ButtonPadding.small) =>
              const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            (ButtonPadding.xs) =>
              const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          }),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(8 * 2),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final ButtonVariant variant;
  final ButtonPadding padding;
  final bool expand;

  const AppTextButton(
      {required this.label,
      required this.onTap,
      this.variant = ButtonVariant.primary,
      this.padding = ButtonPadding.normal,
      this.expand = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      expand: expand,
      color: (switch (variant) {
        ButtonVariant.primary => Theme.of(context).textTheme.bodyMedium!.color!,
        ButtonVariant.secondary => AppColors.primary,
      }),
      padding: padding,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: (variant == ButtonVariant.primary)
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: 16,
        ),
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
  final HeroIcons? icon;
  final Widget? child;
  final VoidCallback? onTap;
  final ButtonVariant variant;
  final ButtonPadding padding;

  const AppIconButton(
      {this.icon,
      this.child,
      required this.onTap,
      this.variant = ButtonVariant.primary,
      this.padding = ButtonPadding.normal,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: onTap,
      color: (switch (variant) {
        ButtonVariant.primary => Theme.of(context).textTheme.bodyMedium!.color!,
        ButtonVariant.secondary => AppColors.primary,
      }),
      padding: padding,
      child: (child != null)
          ? child!
          : HeroIcon(
              icon!,
              color: (switch (variant) {
                ButtonVariant.primary =>
                  Theme.of(context).scaffoldBackgroundColor,
                ButtonVariant.secondary =>
                  Theme.of(context).textTheme.bodyMedium?.color,
              }),
            ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  final HeroIcons icon;
  const AppBackButton({
    this.icon = HeroIcons.arrowLeft,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: icon,
      padding: ButtonPadding.small,
      onTap: () => Navigator.of(context).pop(),
      variant: ButtonVariant.secondary,
    );
  }
}

class DottedButton extends StatelessWidget {
  final String label;
  final HeroIcons? icon;
  final VoidCallback? onTap;
  const DottedButton({
    required this.label,
    this.icon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: DottedDecoration(
            shape: Shape.box,
            color:
                Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(.4),
            borderRadius: BorderRadius.circular(8 * 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .color!
                    .withOpacity(.4),
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              HeroIcon(
                icon!,
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .color!
                    .withOpacity(.4),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

enum ButtonVariant { primary, secondary }

enum ButtonPadding { xs, small, normal }
