import 'package:flutter/material.dart';
import '../models/student.dart';

class DropdownInputField<T> extends StatelessWidget {
  const DropdownInputField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.labelText,
  });

  final T value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText),
        const SizedBox(height: 8.0),
        DropdownButton<T>(
          value: value,
          dropdownColor: Colors.brown,
          style: TextStyle(color: Colors.white),
          items: items.map((item) {
            final itemValue = item.toString().split('.').last;
            IconData? icon;
            if (item is Department) {
              icon = item.icon; 
            }
            return DropdownMenuItem(
              value: item,
              child: Row(
              children: [
                  Icon(icon, color: const Color.fromARGB(255, 201, 197, 197)), 
                  const SizedBox(width: 8),
                  Text(itemValue.toUpperCase(), style: TextStyle(color: const Color.fromARGB(255, 197, 197, 197))),
                ],
              )
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

