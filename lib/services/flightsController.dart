import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:craftrip_app/models/flightsData.dart';
import 'package:intl/intl.dart';
class FlightsManager{

  List<Itineraries> listOfItineraries = [];
  double minPrice;
  FlightsManager();

  Future<List<Itineraries>> makePostRequest(String depDate,String retDate, String cityID, String cabinClass) async {
    //apiJH3 = f764b2bc8emsh3a1870eeaf6e2d4p1dd9dfjsn121868431f45;
    //apikeyJH2 = f5c74cd123msh325fed2fdd11f0fp1078cejsnaca41ec8df9f;
    //apikeySY= f37b903126mshbb4e67664b3aa09p12bf56jsn0145a8f2442e
    // apikeyJH= cae0fb8699msh30d29bd9fce3d47p1af396jsn850972481e38
    // apikeyGMAIL= b697aafe3bmsh0c012968695d271p13e7cfjsnf99d32c5d040

    Map<String, dynamic> result;

    var url = Uri.parse(
        'https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0');
    var client = HttpClient();


    print("sending req");

    HttpClientRequest request = await client.postUrl(url);
    request.headers.set('x-rapidapi-host',
        'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com');
    request.headers.set(
        'x-rapidapi-key', 'cf452ada17msh4aee06f3dec72f7p1f1236jsn36b0ed643335');
    request.headers.set('content-type', "application/x-www-form-urlencoded");

    String payload = "inboundDate=$retDate&cabinClass=$cabinClass&children=0&infants=0&country=SG&currency=SGD&locale=en-SGD&originPlace=SIN-sky&destinationPlace=$cityID&outboundDate=$depDate&adults=1";

    print( depDate + ' //// '+ retDate );
    print("write");

    request.write(payload);

    HttpClientResponse response = await request.close();
    print("finish response");

    int statusCode = response.statusCode;
    print("STATUS CODE " + statusCode.toString());

    print(response.headers['location']);
    String location = response.headers['location'][0];
    var sessionKey = location
        .split('/')
        .last;
    print(sessionKey);


    var resStream = response.transform(Utf8Decoder());
    await for (var data in resStream) {
      print('Received Data: $data');
    }


   // String sessionKey = 'fde5cd6d-a038-4c4b-a704-9b900c982a6c';

    var headers = {
      'x-rapidapi-host': "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
      'x-rapidapi-key': "cf452ada17msh4aee06f3dec72f7p1f1236jsn36b0ed643335"};
    var url2 = "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/" +
        sessionKey +'?stops=0';

    final response2 = await http.get(url2, headers: headers);


    int statusCode2 = response2.statusCode;
    print("STATUS CODE2 " + statusCode2.toString());

    if (response2.statusCode == 200) {
      result = jsonDecode(response2.body.toString());
    }

    print(result);

    listOfItineraries = listConverter(result);
    return listOfItineraries; //list of quotes

  }


  List<Itineraries> listConverter(Map<String, dynamic> json) {
    List<Itineraries> listOfItineraries = [];

    for (int i = 0; i< json['Itineraries'].length ; i++) {
      Itineraries itinerary = new Itineraries.fromJson(json, i);
      print("Made an itinerary");
      itinerary.outbound =
          itinerary.findLegs(json, itinerary.outboundLegId, 'Outbound');
      print("outbound done");
      itinerary.outbound.reformatDates();
      itinerary.inbound =
          itinerary.findLegs(json, itinerary.inboundLegId, 'Inbound');
      itinerary.inbound.reformatDates();
      print("inbound  done");
      listOfItineraries.add(itinerary);
    }

    print("Finish making list");
    return listOfItineraries;
  }


  List<Itineraries> sort(String sortType){
    if(sortType == 'Price-Low To High'){
      Comparator<Itineraries> priceComparator = (a, b) => a.price.compareTo(b.price);
      listOfItineraries.sort(priceComparator);
      print("sort from low to high");
    }
    else if(sortType == 'Price- High To Low'){
      Comparator<Itineraries> priceComparator = (a, b) => b.price.compareTo(a.price);
      listOfItineraries.sort(priceComparator);
      print("sort from high to low");
    }

    return listOfItineraries;
  }

  Future<double> loadFlights(String cityID) async {

    DateTime currDate = new DateTime.now().add(new Duration(days: 1));

    String depDate = new DateFormat("yyyy-MM-dd").format(currDate);

    print(depDate);
    String url = 'https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsedates/v1.0/SG/SGD/en-SGD/$cityID/SIN-SKY/' + depDate;

    Map<String, String> headers = {
      "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
      "x-rapidapi-key": "cf452ada17msh4aee06f3dec72f7p1f1236jsn36b0ed643335"
    };
    print("Sending response");
    final response = await http.get(url, headers: headers);
    print("finish response");
    var quotes;

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body.toString());
      quotes = result["Quotes"];
      var places = result["Places"];
      var carriers = result["Carriers"];


      print(quotes);

      minPrice = quotes[0]['MinPrice'];
      return minPrice;


    }


  }


}