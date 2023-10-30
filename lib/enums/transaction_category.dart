import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TransactionCategory {
  @JsonValue("Casa")
  home,
  @JsonValue("Assinaturas e Serviços")
  subscriptionsAndServices,
  @JsonValue("Saúde")
  health,
  @JsonValue("Mercado")
  market,
  @JsonValue("Fast Food")
  fastFood,
  @JsonValue("Bares e Restaurantes")
  barsAndRestaurants,
  @JsonValue("Transporte")
  transport,
  @JsonValue("Empresa")
  company,
  @JsonValue("Outros")
  others,
  @JsonValue("Investimentos")
  investments,
  @JsonValue("Lazer")
  leisure;

  String getValue() {
    switch (this) {
      case TransactionCategory.home:
        return "Casa";
      case TransactionCategory.subscriptionsAndServices:
        return "Assinaturas e Serviços";
      case TransactionCategory.health:
        return "Saúde";
      case TransactionCategory.market:
        return "Mercado";
      case TransactionCategory.fastFood:
        return "Fast Food";
      case TransactionCategory.barsAndRestaurants:
        return "Bares e Restaurantes";
      case TransactionCategory.transport:
        return "Transporte";
      case TransactionCategory.company:
        return "Empresa";
      case TransactionCategory.others:
        return "Outros";
      case TransactionCategory.investments:
        return "Investimentos";
      case TransactionCategory.leisure:
        return "Lazer";
      default:
        return "Outros";
    }
  }
}
