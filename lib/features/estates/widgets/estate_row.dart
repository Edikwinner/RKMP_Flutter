import 'package:flutter/material.dart';

class EstateRow extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;
  final IconData? removeIcon;
  final ValueChanged<int> onRemove;

  const EstateRow({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
    this.removeIcon,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title),
        subtitle: Text("Стоимость: $subtitle ₽"),
        trailing: IconButton(
          icon: Icon(removeIcon ?? Icons.delete_forever),
          onPressed: () => onRemove(id),
        ),
      ),
    );
  }
}
