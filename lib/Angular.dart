// Angular.dart

import 'package:flutter/material.dart';

class AngularPanel extends StatefulWidget {
  final String title;
  final Widget content;

  const AngularPanel({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<AngularPanel> createState() => _AngularPanelState();
}

class _AngularPanelState extends State<AngularPanel> {
  bool _isOpen = false;

  void _togglePanel() {
    setState(() => _isOpen = !_isOpen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title),
            trailing: Icon(_isOpen ? Icons.expand_less : Icons.expand_more),
            onTap: _togglePanel,
          ),
          if (_isOpen)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: widget.content,
            ),
        ],
      ),
    );
  }
}