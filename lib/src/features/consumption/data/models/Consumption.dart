class Consumption {
  double consumo;
  String unidade;

  Consumption({required this.consumo, required this.unidade});

  factory Consumption.fromJson(Map<String, dynamic> json){
    return Consumption(consumo: json['consumo'] ?? 0, unidade: json['unidade']);
  }

}

