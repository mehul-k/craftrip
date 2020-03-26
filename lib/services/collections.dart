// Add or Delete from Favourites or Recommendations, Add to History 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/services/login.dart';

class Collections 
{
  final databaseReference = Firestore.instance;

  String userID = LoginModel.userID;
  
  addToFavourites(Destination d) async {

  await databaseReference.collection("users")
      .document(userID).collection("favourites").document(d.city)
      .setData({
        'city': d.city,
        'country': d.country,
        'temperature': d.temperature,
        'exchangeRate': d.exchangeRate,
        'currency': d.currency,
        'favourite': d.favourite,
        'imageURL': d.imageURL,
      }); 
  }



  deleteFromFavourites(Destination d) {

    try {
      databaseReference
          .collection("users")
          .document(userID).collection("favourites").document(d.city)
          .delete();
    } catch (e) {
      print(e.toString());
      }
    }

  Future<List<Destination>> getFavouritesData() async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("users").document(userID).collection("favourites")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

        snapshot.documents.forEach((d) => 

            travelDestinations.add(
            Destination(
              city: d['city'], 
              country: d['country'], 
              favourite: d['favourite'], 
              temperature: d['temperature'], 
              exchangeRate: d['exchangeRate'], 
              currency: d['currency'], 
              imageURL: d['imageURL'])
            )     
          ); 
      }); 
      return travelDestinations; 
  }

  addToHistory(Destination d) async {

    await databaseReference.collection("users")
        .document(userID).collection("history").document(d.city)
        .setData({
      'city': d.city,
      'country': d.country,
      'temperature': d.temperature,
      'exchangeRate': d.exchangeRate,
      'currency': d.currency,
      'favourite': d.favourite,
      'imageURL': d.imageURL,
    });
  }

  Future<List<Destination>> getHistoryData() async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("users").document(userID).collection("history")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

        snapshot.documents.forEach((d) => 

            travelDestinations.add(
            Destination(
              city: d['city'], 
              country: d['country'], 
              favourite: d['favourite'], 
              temperature: d['temperature'], 
              exchangeRate: d['exchangeRate'], 
              currency: d['currency'], 
              imageURL: d['imageURL'])
            )     
          ); 
      }); 
      return travelDestinations; 
  }

  Future<List<Destination>> getRecommendationData() async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("users").document(userID).collection("recommendation")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

        snapshot.documents.forEach((d) => 

            travelDestinations.add(
            Destination(
              city: d['city'], 
              country: d['country'], 
              favourite: d['favourite'], 
              temperature: d['temperature'], 
              exchangeRate: d['exchangeRate'], 
              currency: d['currency'], 
              imageURL: d['imageURL'])
            )     
          ); 
      }); 
      return travelDestinations; 
  }

  updateHistoryFavourite(Destination d, bool fav) async {

    await databaseReference.collection("users")
        .document(userID).collection("history").document(d.city)
        .updateData({
      'favourite': fav,
    });
  }

  updateRecommendationFavourite(Destination d, bool fav) async {

    await databaseReference.collection("users")
        .document(userID).collection("history").document(d.city)
        .updateData({
      'favourite': fav,
    });
  }

  Future<List<Destination>> getDestinations() async{

    List<Destination> travelDestinations = [];

    await databaseReference
        .collection("travel_destination")
        .getDocuments()
        .then((QuerySnapshot snapshot) {

      snapshot.documents.forEach((d) =>

          travelDestinations.add(
              Destination(
                  city: d['City'],
                  country: d['Country'],
                  currency: d['Currency'],
                  imageURL: d['image'])
          )
      );
    });
    return travelDestinations;
  }


}