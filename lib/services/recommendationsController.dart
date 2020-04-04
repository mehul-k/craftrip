import 'package:craftrip_app/models/destination.dart';
import 'package:craftrip_app/models/recommendation.dart';
import 'weatherController.dart';
import 'moneyController.dart';

class Recommendations {

  // Calculating weights based on all bucket tag hits in user history 
  void calculateWeights( List<Destination> history, List<int> weights)
  {
    for(var i = 0; i < history.length; i++)
    {
      if(history[i].bucketAdventure == true)
        {weights[0]+=3;}
      
      if(history[i].bucketCalmAtmosphere == true)
        {weights[1]+=3;}

      if(history[i].bucketCoastalLandscape == true)
        {weights[2]+=3;}
      
      if(history[i].bucketEntertainment == true)
        {weights[3]+=3;}
      
      if(history[i].bucketHistoricalArchitecture == true)
        {weights[4]+=3;}
      
      if(history[i].bucketLandmark == true)
        {weights[5]+=3;}

      if(history[i].bucketMountainousLandscape == true)
       { weights[6]+=3; }
      
      if(history[i].bucketUrbanLandscape == true)
        {weights[7]+=3; }
      
      if(history[i].bucketVibrantAtmosphere == true)
        {weights[8]+=3;}
    }
  }

  // Calculate score for each destination using weights: Score = SUM(W[] * Bucket_Tags[])
  calculateScore(List<Destination> remainderDestinations, List<int> weights)
  { 
    List<Recommendation> recommendedDestinations = [];
    
    for(int i = 0; i < remainderDestinations.length; i++)
    {
      int score = 0;
      score = ((remainderDestinations[i].bucketAdventure? 1: 0) * weights[0]) +
              ((remainderDestinations[i].bucketCalmAtmosphere ? 1 : 0) * weights[1]) +
              ((remainderDestinations[i].bucketCoastalLandscape ? 1 : 0)* weights[2]) +
              ((remainderDestinations[i].bucketEntertainment ? 1 : 0) * weights[3]) +
              ((remainderDestinations[i].bucketHistoricalArchitecture ? 1 : 0) * weights[4]) +
              ((remainderDestinations[i].bucketLandmark ? 1 : 0 )* weights[5]) +
              ((remainderDestinations[i].bucketMountainousLandscape ? 1 : 0) * weights[6]) +
              ((remainderDestinations[i].bucketUrbanLandscape ? 1 : 0 )* weights[7]) +
              ((remainderDestinations[i].bucketVibrantAtmosphere ? 1 : 0 )* weights[8]);
      
      recommendedDestinations.add(Recommendation(d: remainderDestinations[i], score: score));  
    }

    return recommendedDestinations;
  }

  generateRecommendations(List<Destination> history, List<Destination> remainderDestinations) async
  {
    List<Recommendation> recommendedDestinations = [];
    List<int> weights =[0,0,0,0,0,0,0,0,0];

    calculateWeights(history, weights);
    recommendedDestinations = calculateScore(remainderDestinations, weights);

   // Sort in ascending order
    recommendedDestinations.sort((a, b) => (a.score.compareTo(b.score)));

    List<Destination> finalRecommendations = [];

    for(var i= (recommendedDestinations.length -1 ); i > recommendedDestinations.length -4; i--)
      {
        finalRecommendations.add(recommendedDestinations[i].d);
        await addInfoToDestination(recommendedDestinations[i].d);
      }

    // Top three destinations   
    return finalRecommendations;
  }

  addInfoToDestination(Destination d) async {
    d.exchangeRate = (await MoneyManager().loadCurrency(d.currency)).toDouble();
    d.temperature =  (await WeatherManager().loadCurrentTemp(d.city)).toDouble();
  }

}

