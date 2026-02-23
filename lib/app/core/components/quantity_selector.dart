import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class QuantitySelector extends StatefulWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const QuantitySelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.value;
  }

  void _increment() {
    setState(() {
      quantity++;
    });
    widget.onChanged(quantity);
  }

  void _decrement() {
    if (quantity <= 0) return;

    setState(() {
      quantity--;
    });
    widget.onChanged(quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).focusColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, color: AppColors.backgroundLight),
            onPressed: _decrement,
          ),
          Text(
            quantity.toString(),
            style: TextStyle(color: AppColors.textOnPrimaryLight),
          ),
          IconButton(
            icon: const Icon(
              Icons.add,
              color: AppColors.backgroundLight,
            ),
            onPressed: _increment,
          ),
        ],
      ),
    );
  }
}
