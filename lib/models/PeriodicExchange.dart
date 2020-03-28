// class to display currency exchange rate chart 

class PeriodicExchange{

  // eg. "USD"
  String currency;

  //eg. 64.02
  double value;
  
  DateTime date;
  PeriodicExchange({this.currency, this.date, this.value}); 

  factory PeriodicExchange.fromJson(Map<String, dynamic>json, String targetCurrency, String startDate){
    //contructing a list of PeriodicExchange object
      double value; 
      DateTime date; 
      
      value = double.parse(json["rates"][startDate][targetCurrency].toDouble().toStringAsFixed(4)); 
      date = DateTime.parse(startDate); 

      return PeriodicExchange(currency: targetCurrency, value: value, date: date);
      
    }
}

List<PeriodicExchange> listConverter(Map<String, dynamic>json, String targetCurrency)
{
  List<String> listOfDate = 
               ['2020-01-02', 
                '2020-01-08', 
                '2020-01-15',
                '2020-01-17',
                '2020-01-22',
                '2020-01-29',
                '2020-02-05',
                '2020-02-12',
                '2020-02-17',
                '2020-02-19',
                '2020-02-26',
                '2020-03-04',
                '2020-03-11',
                '2020-03-18',
                '2020-03-23',
                '2020-03-24',
                '2020-03-25'];

  List <PeriodicExchange> currencyData = []; 

  for (int i=0; i<listOfDate.length; i++)
      { 
        PeriodicExchange c = new PeriodicExchange.fromJson(json, targetCurrency, listOfDate[i]); 
        currencyData.add(c); 
      }
  //print(currencyData[3].value);
  return currencyData; 

      
}
