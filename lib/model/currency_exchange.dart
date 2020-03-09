
class CurrencyExchange {

    final String sgd;
    final String destCurrency;
    String location;

    CurrencyExchange({this.sgd, this.destCurrency});

    factory CurrencyExchange.fromJson(Map<String, dynamic>json){
      return CurrencyExchange( //contructing a new currencyExchange object
        //sgd: json["Singapore Dollar"],
        destCurrency: json["Name"]
      );
    }
}