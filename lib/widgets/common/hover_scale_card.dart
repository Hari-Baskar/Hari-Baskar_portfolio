import 'package:flutter/material.dart';

class HoverScaleCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const HoverScaleCard({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  State<HoverScaleCard> createState() => _HoverScaleCardState();
}

class _HoverScaleCardState extends State<HoverScaleCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), // Matches AppSize.cardRadius typically
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
