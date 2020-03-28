import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/models/recommendation.dart'; 

class Recommendations {
  List<Destination> history = [];
  List<Destination> remainderDestinations = [];
  List<Recommendation> recommendedDestinations = []; 

  List<int> weights =[0,0,0,0,0,0,0,0,0];


  void calculateWeights()
  {
    for(var i = 0; i < history.length; i++)
    {
      if(history[i].bucketAdventure == true)
        weights[0]+=3; 
      
      if(history[i].bucketCalmAtmosphere == true)
        weights[1]+=3; 

      if(history[i].bucketCoastalLandscape == true)
        weights[2]+=3; 
      
      if(history[i].bucketEntertainment == true)
        weights[3]+=3; 
      
      if(history[i].bucketHistoricalArchitecture == true)
        weights[4]+=3; 
      
      if(history[i].bucketLandmark == true)
        weights[5]+=3; 

      if(history[i].bucketMountainousLandscape == true)
        weights[6]+=3; 
      
      if(history[i].bucketUrbanLandscape == true)
        weights[7]+=3; 
      
      if(history[i].bucketVibrantAtmosphere == 1)
        weights[8]+=3; 
      
      // code adding 5 to the weight of user's preferred bucket tag 
    }
  }

  void calculateScore()
  { 
    int score = 0;

    for(var i = 0; i < remainderDestinations.length; i++)
    {    
      score = (remainderDestinations[i].bucketAdventure ? 1 : 0 * weights[0]) + 
              (remainderDestinations[i].bucketCalmAtmosphere ? 1 : 0 * weights[1]) + 
              (remainderDestinations[i].bucketCoastalLandscape ? 1 : 0 * weights[2]) + 
              (remainderDestinations[i].bucketEntertainment ? 1 : 0 * weights[3]) + 
              (remainderDestinations[i].bucketHistoricalArchitecture ? 1 : 0 * weights[4]) + 
              (remainderDestinations[i].bucketLandmark ? 1 : 0 * weights[5]) + 
              (remainderDestinations[i].bucketMountainousLandscape ? 1 : 0 * weights[6]) + 
              (remainderDestinations[i].bucketUrbanLandscape ? 1 : 0 * weights[7]) + 
              (remainderDestinations[i].bucketVibrantAtmosphere ? 1 : 0 * weights[8]); 
      
      recommendedDestinations.add(Recommendation(d: remainderDestinations[i], score: score));  
    }
    
  }

  List<Recommendation> generateRecommendations()
  {
    
    calculateWeights();
    calculateScore(); 

    //someObjects.sort((a, b) => a.someProperty.compareTo(b.someProperty));

    recommendedDestinations.sort((a, b) => (a.score.compareTo(b.score)));

    return recommendedDestinations.getRange(0, 4); 
  }

}

