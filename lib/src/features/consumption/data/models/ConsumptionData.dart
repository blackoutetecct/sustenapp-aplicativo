class ConsumptionData {
  final double consumption;
  final double estimatedprice;
  final double averageDailyConsumption;
  final double averageWeeklyConsumption;
  final String type;

  ConsumptionData({
    required this.consumption,
    required this.estimatedprice,
    required this.averageDailyConsumption,
    required this.averageWeeklyConsumption,
    required this.type
  });

  factory ConsumptionData.fromJson(Map<String, dynamic> json) {
    return ConsumptionData(
      consumption: json['consumo'],
      estimatedprice: json['valorEstimado'],
      averageDailyConsumption: json['mediaConsumoDiario'],
      averageWeeklyConsumption: json['mediaConsumoSemanal'],
      type: json['tipo'] == "ELETRICO" ? 'electric' : 'hidric'
    );
  }
}
