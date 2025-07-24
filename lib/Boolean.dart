import 'package:flutter/material.dart';

class BooleanInput extends StatelessWidget {
  final bool value;
  final String selectType; // 'checkbox', 'toggleButton', 'onOffButton'
  final Function(bool) onChanged;
  final String activeText;
  final String inactiveText;

  const BooleanInput({
    super.key,
    required this.value,
    required this.selectType,
    required this.onChanged,
    required this.activeText,
    required this.inactiveText,
  });

  @override
  Widget build(BuildContext context) {
    Widget inputWidget;

    switch (selectType) {
      case 'checkbox':
        inputWidget = Row(
          children: [
            Checkbox(
              value: value,
              onChanged: (val) => onChanged(val ?? false),
            ),
            Text(value ? activeText : inactiveText),
          ],
        );
        break;

      case 'toggleButton':
        inputWidget = GestureDetector(
          onTap: () => onChanged(!value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value ? activeText : inactiveText),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: value ? Colors.green : Colors.grey.shade400,
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: value
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      curve: Curves.easeInOut,
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
        break;

      case 'onOffButton':
        inputWidget = GestureDetector(
          onTap: () => onChanged(!value),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: value ? Colors.black : Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value ? activeText : inactiveText,
              style: TextStyle(
                color: value ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        break;

      default:
        inputWidget = Text('Unknown selectType: $selectType');
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: inputWidget,
    );
  }
}

