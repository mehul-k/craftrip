import 'package:craftrip_app/models/destination.dart';

class Recommendation 
{
  Destination d; 
  int score; 

  Recommendation({
    this.d, 
    this.score
  });
}