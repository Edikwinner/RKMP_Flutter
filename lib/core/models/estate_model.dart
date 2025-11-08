class EstateModel {
  final int id;
  final String name;
  final int cost;
  final String tag;

  EstateModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.tag,
  });

  factory EstateModel.create(String name, int cost, String tag) {
    return EstateModel(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      cost: cost,
      tag: tag,
    );
  }
}
