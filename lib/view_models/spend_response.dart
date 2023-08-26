class SpendResponse {
  final String id;
  final double amount;
  final String description;
  final String type;
  final String category;
  final String date;

  SpendResponse({
    required this.id,
    required this.amount,
    required this.description,
    required this.type,
    required this.category,
    required this.date,
  });

  factory SpendResponse.fromJson(Map<String, dynamic> json) {
    return SpendResponse(
      id: json['id'],
      amount: json['amount'],
      description: json['description'] ?? 'Sem Descriçao',
      type: json['type'],
      category: json['category'] ?? 'Categoria Não Definida',
      date: json['date'],
    );
  }
}
