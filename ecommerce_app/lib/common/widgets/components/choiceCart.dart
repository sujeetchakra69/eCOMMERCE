// choice_chip_page.dart
import 'package:flutter/material.dart';

class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({super.key});

  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  String _selectedColor = '';  // To track selected color
  String _selectedSize = '';   // To track selected size

  // Color ChoiceChip builder
  Widget _buildColorChoiceChip(String label, Color color) {
    return ChoiceChip(
      selected: _selectedColor == label,
      label: const Text(''),
      onSelected: (bool selected) {
        setState(() {
          _selectedColor = selected ? label : '';
        });
      },
      labelPadding: const EdgeInsets.all(0),
      shape:const  CircleBorder(),
      selectedColor: color.withOpacity(1),
      backgroundColor: color.withOpacity(1), // Default background color
    );
  }

  // Size ChoiceChip builder
  Widget _buildSizeChoiceChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: _selectedSize == label,
      onSelected: (bool selected) {
        setState(() {
          _selectedSize = selected ? label : '';
        });
      },
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey.shade200, // Default background color
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Color:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildColorChoiceChip('green', Colors.green),
            _buildColorChoiceChip('blue', Colors.blue),
            _buildColorChoiceChip('red', Colors.red),
            _buildColorChoiceChip('black', Colors.black),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Choose Size:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSizeChoiceChip('sm'),
            _buildSizeChoiceChip('md'),
            _buildSizeChoiceChip('lg'),
            _buildSizeChoiceChip('xl'),
          ],
        ),
      ],
    );
  }
}
