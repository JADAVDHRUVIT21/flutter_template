import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInput extends StatefulWidget {
  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final String? placeholder;
  final Widget icon;
  final bool required;
  final int? maxLength;

  const NumberInput({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.placeholder,
    required this.icon,
    this.required = false,
    this.maxLength,
  }) : super(key: key);

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant NumberInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  Widget _buildLabel(BuildContext context) {
    if (widget.label.isEmpty) return const SizedBox.shrink();

    final labelColor = Theme.of(context)
        .inputDecorationTheme
        .labelStyle
        ?.color ??
        Colors.black87;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Text(
        widget.required ? '${widget.label} *' : widget.label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: labelColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(context),
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            if (widget.maxLength != null)
              LengthLimitingTextInputFormatter(widget.maxLength),
          ],
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: widget.icon,
            ),
            hintText: widget.placeholder,
            filled: true,
            fillColor: Colors.white,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
