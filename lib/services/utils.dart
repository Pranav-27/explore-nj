// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data_models/location.dart';
import '../data_models/review.dart';


class Utils {
  static List<Location> getLocations() {
    return setLocationOrder([
      Location(
        name: "Atlantic City",
        description: "One of the most popular coastal resort towns on the northeastern coast of the United States, Atlantic City is best known for its famous Boardwalk. This four-mile-long promenade was constructed in 1870 and to this day remains the place where the majority of the city's sightseeing opportunities are found.",
        imageUrl:
            "https://images.pexels.com/photos/4785058/pexels-photo-4785058.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        likes: 132,
        address: "Atlantic City, NJ",
        reviews: [
          Review(
            body:
                '''We enjoyed the Stroll along Atlantic City's famous boardwalk''',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''The casino at Harrah's was amazing!''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''So many nice restaurants, definitely will come back!''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "Cape May",
        description: "The many attractions of Cape May, at the southernmost tip of New Jersey on Delaware Bay, were largely discovered by the wealthy during the 18th and 19th centuries when it enjoyed its heyday as a fashionable resort town. It was so popular that six US Presidents had summer homes here.",
        imageUrl:
            "https://media.gettyimages.com/photos/concession-stand-in-downtown-cape-may-new-jersey-usa-picture-id1012175950?k=20&m=1012175950&s=612x612&w=0&h=1pRyLwfx-CtKOdmdVQqIqp8PJxLMZFpe6aec01OfmAA=",
        likes: 67,
        address: "Cape May, NJ",
        reviews: [
          Review(
            body:
                'We immersed ourselves in the Old Victorian Cape May and visited the beautiful Cape May Point Lighthouse',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''Downtown was beautiful with so many shops!''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''The downtown restaurants were 10/10''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "Liberty State Park",
        description: "Overlooking the Upper New York Bay, Liberty Island, and Ellis Island (home to New York's Statue of Liberty), Liberty State Park encompasses 1,212 waterside acres. In addition to its wonderful views of the aforementioned attractions, the park contains many highlights of its own, including Communipaw Cove, a 36-acre tidal salt marsh that has been designated a nature preserve.",
        imageUrl:
            "https://media.istockphoto.com/photos/aerial-statue-of-liberty-picture-id825417726?k=20&m=825417726&s=612x612&w=0&h=JoHp_Ywu2nO4KHz6ZLYPB-HfLTlWwz07cxdwZAt1RFI=",
        likes: 13,
        address: "200 Morris Pesin Drive, Jersey City",
        reviews: [
          Review(
            body:
                'What a view of New York city from this place',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                ''' It’s a great experience. The ambiance is very welcoming and charming.''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''This place is great! Atmosphere is chill''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "Battleship New Jersey",
        description: "The US Navy's most decorated vessel, the mammoth USS New Jersey is now an excellent floating museum moored on the Delaware River. Highlights of a visit include guided tours through this historic Iowa-class battleship, launched in 1942 and one of the largest military vessels ever built",
        imageUrl:
            "https://c7.alamy.com/zooms/3/cf5d773373a3434e989217fbd7e1b18f/ktb3b6.jpg",
        likes: 12,
        address: "100 Clinton St, Camden",
        reviews: [
          Review(
            body:
                'I learnt a lot through the numerous exhibits and display of artifacts',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''Such a cool ship!''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''Perfect place to take your kids!''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "The Adventure Aquarium",
        description: "A popular family attraction in New Jersey is the Adventure Aquarium on the Delaware River in Camden. Considered one of the best aquatic educational facilities in the United States, this two-million-gallon aquarium is home to more than 8,500 marine animals, including a large collection of sharks, sea turtles, penguins, and stingrays.",
        imageUrl: "https://images.pexels.com/photos/792643/pexels-photo-792643.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        likes: 57,
        address: "1 Riverside Dr, Camden",
        reviews: [
          Review(
            body: "My kids loved the penguins and sea turtles",
            author: "John",
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0),
          ),

        ],
      ),
      Location(
        name: "Grounds for Sculpture",
        description: "Art lovers (and nature lovers) won't want to miss the incredible Grounds For Sculpture, a 42-acre museum and sculpture park in the town of Hamilton. Established in 1992 to facilitate the appreciation of contemporary sculpture, it has become one of the state's most popular art exhibits, boasting 270 large-scale works by Seward Johnson and other US artists.",
        imageUrl:
            "https://www.groundsforsculpture.org/wp-content/uploads/2019/07/2249-Summer-2018-dmhphotography_1920x800_acf_cropped.jpg",
        likes: 12,
        address: "80 Sculptors Way, Hamilton Township",
        reviews: [
          Review(
            body:
                'Really enjoyed my visit and all the art this place has to offer',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''Honestly some of the coolest sculptures I've ever seen!''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''The restaurant was perfect after touring the sculptures''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "Liberty Science Center",
        description: "A highlight for kids visiting Liberty State Park is the Liberty Science Center. Lying on the park's northwestern tip, this fun interactive science museum offers numerous fascinating hands-on exhibits and displays relating to science and technology. The recently updated planetarium conducts regular shows that explore the night sky and outer space, and is also host to films and amazing laser shows that envelop the audience.",
        imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Liberty_Science_Center_Jersey_City_October_2020_panorama_1.jpg/260px-Liberty_Science_Center_Jersey_City_October_2020_panorama_1.jpg",
        likes: 12,
        address: "222 Jersey City Blvd, Jersey City",
        reviews: [
          Review(
            body:
                '3D theater was the best part of my visit',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''Good restaurants in the area, so no need to pack food''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''My kids absolutely LOVED the robot exhibit''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "Delaware Water Gap",
        description: "Visitors will be hard-pressed to find a more beautiful natural environment than the Delaware Water Gap National Recreation Area. Within the 70,000-acre park, visitors are able to trek the Appalachian Trail 28 miles along Kittatinny Ridge, peer 1,000 feet into the depths of the Delaware Water Gap, and watch powerful waterfalls tumble over rocky cliffs.",
        imageUrl:
            "https://media.gettyimages.com/photos/delaware-water-gap-picture-id157607030?k=20&m=157607030&s=612x612&w=0&h=XMmFTvTb90E6X3xNiRdi78LeSlFL7SVcEcGHgeXqTDw=",
        likes: 23,
        address: "1978 River Rd, Bushkill",
        reviews: [
          Review(
            body:
                'Loved the nature and all the hikes',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''The waterfalls were so much fun, don't forget a change of clothes!''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''Awesome scenery''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "Six Flags Great Adventure",
        description: "Six Flags Great Adventure is an amusement park located in Jackson, New Jersey. Owned and operated by Six Flags, the park complex is situated between New York City and Philadelphia and includes a water park named Hurricane Harbor.",
        imageUrl:
            "https://media.istockphoto.com/photos/up-and-over-picture-id915082318?k=20&m=915082318&s=612x612&w=0&h=7PlEeYKWGNbROtGiGJw0fSIq4smC8fEtQ4LIDIffn0g=",
        likes: 67,
        address: "1 Six Flags Blvd, Jackson Township",
        reviews: [
          Review(
            body:
                'Enjoyed all the thrilling rides this part has to offer',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''Amazing restaurants and pizza all throughout the park!''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''The safari was so cool!''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      Location(
        name: "Bombay River",
        description: "Arguably the best Indian food in a town that knows its cuisine, Bombay River has everything from to-go express lunch bowls to a lunch buffet to fancy dinners. A versatile menu with curries, biryani, vegetarian dishes and succulent meats from the grill, with modern and classic takes on Indian food that will satisfy even the pickiest eaters.",
        imageUrl:
            "https://i0.wp.com/redbankpulse.com/wp-content/uploads/2018/11/bombay-river-indian-dining-16-of-24.jpg?resize=2000%2C1200&ssl=1",
        likes: 41,
        address: "90 Broad St, Red Bank",
        reviews: [
          Review(
            body:
                'Service and food were great, the space was very pretty as well.',
            author: 'John',
            profilePic: Icon(FontAwesomeIcons.userNinja, size: 35.0,),
          ),
          Review(
            body:
                '''Had lunch here today and it was absolutely fantastic.''',
            author: 'Julia',
            profilePic: Icon(FontAwesomeIcons.userNurse, size: 35.0,),
          ),
          Review(
            body:
                '''Everything on their menu is worth a try.''',
            author: 'Mike',
            profilePic: Icon(FontAwesomeIcons.userDoctor, size: 35.0,),
          ),
        ],
      ),
      
    ]);
  }

  static List<Location> setLocationOrder(List<Location> locations) {
    List<Location> result = locations;
    int n = result.length;
    for (int i = 0; i < n - 1; i++) {
      int maxIndex = i;
      for (int j = i + 1; j < n; j++) {
        if (result[j].likes > result[maxIndex].likes) {
          maxIndex = j;
        }
      }

      Location temp = result[maxIndex];
      result[maxIndex] = result[i];
      result[i] = temp;
    }

    return result;
  }
}
