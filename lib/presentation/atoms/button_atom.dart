import 'package:flutter/material.dart';
import 'package:infinite_horizons/presentation/atoms/atoms.dart';

class ButtonAtom extends StatelessWidget {
  const ButtonAtom({
    required this.variant,
    required this.onPressed,
    super.key,
    this.text,
    this.icon,
    this.disabled = false,
    this.disableActionType = false,
    this.translate = true,
  });

  final ButtonVariant variant;
  final VoidCallback onPressed;
  final String? text;
  final IconData? icon;
  double get width => 250;
  double get _height => 60;
  final bool disabled;
  final bool translate;
  final bool disableActionType;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    if (variant == ButtonVariant.primary) {
      return Container(
        constraints: const BoxConstraints(
          minWidth: 300,
        ),
        height: _height,
        child: FilledButton.icon(
          onPressed: onPressed,
          style: FilledButton.styleFrom().copyWith(
            alignment: Alignment.center,
            backgroundColor: disabled
                ? MaterialStateProperty.all(colorScheme.outline)
                : MaterialStateProperty.all(colorScheme.primaryContainer),
          ),
          icon: Icon(icon),
          label: TextAtom(
            text ?? '',
            translate: translate,
            maxLines: 1,
            style: textTheme.bodyLarge,
          ),
        ),
      );
    } else if (variant == ButtonVariant.secondary) {
      return Container(
        constraints: const BoxConstraints(
          minWidth: 300,
        ),
        height: _height,
        child: FilledButton.icon(
          onPressed: onPressed,
          style: FilledButton.styleFrom().copyWith(
            alignment: Alignment.center,
            backgroundColor: disabled
                ? MaterialStateProperty.all(colorScheme.outline)
                : MaterialStateProperty.all(colorScheme.secondaryContainer),
          ),
          icon: Icon(icon),
          label: TextAtom(
            text ?? '',
            translate: translate,
            maxLines: 1,
            style: textTheme.bodyLarge,
          ),
        ),
      );
    } else if (variant == ButtonVariant.tertiary) {
      return Container(
        constraints: const BoxConstraints(
          minWidth: 300,
        ),
        height: _height,
        child: FilledButton.icon(
          onPressed: onPressed,
          style: FilledButton.styleFrom().copyWith(
            alignment: Alignment.center,
            backgroundColor: disabled
                ? MaterialStateProperty.all(colorScheme.outline)
                : MaterialStateProperty.all(colorScheme.tertiaryContainer),
          ),
          icon: Icon(icon),
          label: TextAtom(
            text ?? '',
            translate: translate,
            maxLines: 1,
            style: textTheme.bodyLarge,
          ),
        ),
      );
    }
    return const Text('Type is not supported yet');
  }
}

enum ButtonVariant {
  primary,
  secondary,
  tertiary,
  action,
  actionToggled,
  back,
}