class Percentage {
    String category;
    String percentage;

    Percentage({
        required this.category,
        required this.percentage,
    });

    factory Percentage.fromJson(Map<String, dynamic> json) => Percentage(
        category: json["category"],
        percentage: json["percentage"],
    );
}
