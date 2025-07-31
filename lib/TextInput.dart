import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final bool required;
  final String? placeholder;
  final Widget icon;
  final Unit? unit;
  final List<String>? suggestions;
  final bool enabled;
  final TextStyle? labelStyle;

  const TextInput({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.required = false,
    this.placeholder,
    required this.icon,
    this.unit,
    this.suggestions,
    this.enabled = true,
    this.labelStyle,
  }) : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class Unit {
  final String value;
  final UnitPosition position;
  final TextStyle? labelStyle;

  Unit({
    required this.value,
    required this.position,
    this.labelStyle,
  });
}

enum UnitPosition { start, end }

class _TextInputState extends State<TextInput> {
  late final TextEditingController _controller =
  TextEditingController(text: widget.value);

  @override
  void didUpdateWidget(covariant TextInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value &&
        _controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  Widget _buildLabel(BuildContext context) {
    if (widget.label.isEmpty) return const SizedBox.shrink();

    final labelColor = widget.labelStyle?.color ??
        Theme.of(context).inputDecorationTheme.labelStyle?.color ??
        Colors.black87;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Text(
        widget.required ? '${widget.label} *' : widget.label,
        style: widget.labelStyle ??
            Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: labelColor,
            ),
      ),
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    return InputDecoration(
      hintText: widget.placeholder,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: widget.icon,
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      filled: true,
      fillColor: widget.enabled ? Colors.white : Colors.grey.shade100,
      contentPadding:
      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      prefix: widget.unit?.position == UnitPosition.start
          ? Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          widget.unit!.value,
          style: widget.unit?.labelStyle,
        ),
      )
          : null,
      suffix: widget.unit?.position == UnitPosition.end
          ? Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          widget.unit!.value,
          style: widget.unit?.labelStyle,
        ),
      )
          : null,
    ).applyDefaults(Theme.of(context).inputDecorationTheme);
  }

  @override
  Widget build(BuildContext context) {
    final inputField = widget.suggestions != null
        ? Autocomplete<String>(
      optionsBuilder: (input) => input.text.isEmpty
          ? const Iterable<String>.empty()
          : widget.suggestions!.where((s) => s
          .toLowerCase()
          .contains(input.text.toLowerCase())),
      fieldViewBuilder:
          (context, controller, focusNode, onFieldSubmitted) {
        controller.value = _controller.value;
        return TextField(
          controller: _controller,
          focusNode: focusNode,
          enabled: widget.enabled,
          onChanged: (val) {
            widget.onChanged(val);
            _controller.text = val;
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          },
          decoration: _buildDecoration(context),
        );
      },
      onSelected: (val) {
        widget.onChanged(val);
        _controller.text = val;
      },
    )
        : TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      decoration: _buildDecoration(context),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(context),
        inputField,
      ],
    );
  }
}
