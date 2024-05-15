class TravelModel {
  String name;
  String location;
  String image;
  String distance;
  String temp;
  String rating;
  String discription;
  String price;

  TravelModel({
    required this.name,
    required this.location,
    required this.image,
    required this.distance,
    required this.temp,
    required this.rating,
    required this.discription,
    required this.price,
  });
}

List<TravelModel> travelList = [
  TravelModel(
    name: 'New York',
    location: 'US - New York',
    image: 'assets/images/newyork.jpg',
    distance: '7',
    temp: '30',
    rating: '5',
    discription:
        'test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-',
    price: '3000',
  ),
  TravelModel(
    name: 'Tehran',
    location: 'IR - Tehran',
    image: 'assets/images/tehran.jpg',
    distance: '6',
    temp: '35',
    rating: '4',
    discription:
        'test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-',
    price: '1500',
  ),
  TravelModel(
    name: 'Paris',
    location: 'FR - Paris',
    image: 'assets/images/paris.jpg',
    distance: '10',
    temp: '28',
    rating: '4.8',
    discription:
        'test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-',
    price: '4500',
  ),
  TravelModel(
    name: 'Rome',
    location: 'IT - Rome',
    image: 'assets/images/rome.jpg',
    distance: '4',
    temp: '32',
    rating: '3.8',
    discription:
        'test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-test-',
    price: '1800',
  ),
];
