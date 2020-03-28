class TodayCurrency{

  double value;

  TodayCurrency({this.value});

  factory TodayCurrency.fromJson(Map<String, dynamic>json, String targetCurrency){

    //contructing a list of PeriodicExchange object
      
      double value; 
     
      value = double.parse(json["rates"][targetCurrency].toDouble().toStringAsFixed(2));

      return TodayCurrency(value: value);
      
    }

}