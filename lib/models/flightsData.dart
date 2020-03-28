
class Itineraries {
  //flights live data
  double price; //the price of the flight
  Leg outbound; // more details on the flight
  Leg inbound;

  var outboundLegId;
  var inboundLegId;


  Itineraries({this.price, this.outboundLegId, this.inboundLegId});

  factory Itineraries.fromJson(var json, int i) {
    //Factory used for deferring the instantiation to specific classes implementing this interface
    print("Create Itineraries");
    var itineraries = json['Itineraries'];
    return Itineraries(price: itineraries[i]['PricingOptions'][0]['Price'],
      outboundLegId: itineraries[i]['OutboundLegId'],
      inboundLegId: itineraries[i]['InboundLegId'] ,

    );
  }

  Leg findLegs(Map<String, dynamic> json,String legID, String directionality){
    print("Find Legs");

    var places = json["Places"];
    var carriers = json["Carriers"];
    var legs = json["Legs"];

    int index=0;
    for(int i = 0; i<legs.length; i++){
      if(legs[i]['Id'] == legID && legs[i]['Directionality'] == directionality){
        index = i;
        break;}
    }
    print(legs[index]);
    return Leg.fromJson(legs[index], carriers, places);

  }

}

class Leg {    //flights live data

  String id;

  String departTime;
  String arrivalTime;
  int duration;
  int carrier;
  String directionality;

  String flightAirlines;
  String originPlace;
  String destPlace;
  String arrivalDate;
  double price;

  int carrierId;
  int destId;
  int originId;


  Leg({this.id, this.originPlace, this.destPlace, this.departTime, this.arrivalTime , this.duration, this.flightAirlines, this.directionality });

  factory Leg.fromJson(var json,
      var carriers, var places) {
    //Factory used for deferring the instantiation to specific classes implementing this interface
    print("Create Leg");

    print("Find Carriers");
    int cIndex=0;
    for(int i = 0; i<carriers.length; i++){
      if(carriers[i]['Id']== json['Carriers'][0]){
        cIndex = i;
        break;}
    }

    print("Find Places");

    int oIndex=0;
    for(int i = 0; i<places.length; i++){
      if(places[i]['Id']== json['OriginStation']){
        oIndex = i;
        break;}
    }

    print("Find destination");

    int dIndex=0;
    for(int i = 0; i<places.length; i++){
      if(places[i]['Id']== json['DestinationStation']){
        dIndex = i;
        break;}
    }

    print("origin " +  places[oIndex]['Code'] + " dest " +  places[dIndex]['Code'] + " airline " + carriers[cIndex]['Name']  );


    return Leg(id: json['Id'],
        originPlace: places[oIndex]['Code'],
        destPlace: places[dIndex]['Code'],
        departTime: json['Departure'],
        arrivalTime: json['Arrival'],
        duration: json['Duration'],
        flightAirlines: carriers[cIndex]['Name'],
        directionality: json['Directionality'] );

  }



  void reformatDates() {
    var date = departTime.split('T');
    String mid = date[1];
    var arr2 = mid.split(':');
    String time = arr2[0].toString() + ':' + arr2[1].toString();

    departTime = time;

    var date2 = arrivalTime.split('T');
    String mid2 = date2[1];
    var arr3 = mid2.split(':');
    String time2 = arr3[0].toString() + ':' + arr3[1].toString();

    arrivalTime = time2;

  }



}


class Carrier{
  int carrierID;
  String name;

  Carrier({
    this.carrierID, this.name
  });

  factory Carrier.fromJson(dynamic json) {
    print("Create Carrier");
    return Carrier(
      carrierID: json['CarrierId'],
      name: json['Name'].toString(),
    );

  }
}

class Places{
  int placeID;
  String airportName;
  String cityName;
  String countryName;
  String skyScannerCode;

  Places({
    this.placeID, this.airportName, this.cityName, this.countryName, this.skyScannerCode
  });

  factory Places.fromJson(dynamic json) {
    print("Create places");
    return Places(
      placeID: json["PlaceId"],
      airportName: json['Name'].toString(),
      cityName: json['CityName'].toString(),
      countryName: json['CountryName'].toString(),
      skyScannerCode: json['SkyscannerCode'].toString(),

    );

  }
}



