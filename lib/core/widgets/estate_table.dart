import 'package:flutter/material.dart';

import '../models/estate_model.dart';
import 'estate_row.dart';

class EstateTable extends StatelessWidget {
  final List<EstateModel> estateList;
  final Function(int) onRemoveItem;
  final Function(int) onItemClick;

  const EstateTable({
    super.key,
    required this.estateList,
    required this.onRemoveItem,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: estateList.length,
      itemBuilder: (context, index) {
        final estate = estateList[index];
        return EstateRow(
          id: estate.id,
          title: estate.name,
          subtitle: estate.cost.toString(),
          onRemove: onRemoveItem,
        );
      },
    );
  }
}
