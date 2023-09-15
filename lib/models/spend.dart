class Spend {
  final String id;
  final double amount;
  final String description;
  final String type;
  final String category;
  final String date;

  Spend({
    required this.id,
    required this.amount,
    required this.description,
    required this.type,
    required this.category,
    required this.date,
  });

  factory Spend.fromJson(Map<String, dynamic> json) {
    return Spend(
      id: json['id'],
      amount: json['amount'] != null ? double.parse(json['amount'].toString()) : 0.0,
      description: json['description'] ?? 'Sem Descriçao',
      type: json['type'],
      category: json['category'] ?? 'Categoria Não Definida',
      date: json['date'],
    );
  }
}
