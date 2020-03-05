import 'dart:math' as math;

class Flux{
  String id;
  String source;
  String name;
  String url;

  Flux({this.source, this.name, this.url})
  {
    this.id=math.Random().nextDouble().toString();
  }

  String toString(){
    return ('name ${this.name}');
  }
}