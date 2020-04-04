class TodayCurrency{

  double value;

  TodayCurrency({this.value});

  //contructing a list of PeriodicExchange object 
  factory TodayCurrency.fromJson(Map<String, dynamic>json, String targetCurrency)
  {
    double value; 
    value = double.parse(json["rates"][targetCurrency].toDouble().toStringAsFixed(2));

    return TodayCurrency(value: value);

  }
}