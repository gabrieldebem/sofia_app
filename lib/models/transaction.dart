class Transaction {
  final String id;
  final double amount;
  final String description;
  final String category;
  final String date;

  Transaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.category,
    required this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: json['amount'] != null ? double.parse(json['amount'].toString()) : 0.0,
      description: json['description'] ?? 'Sem Descriçao',
      category: json['category'] ?? 'Categoria Não Definida',
      date: json['date'],
    );
  }
}
