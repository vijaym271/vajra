import 'package:flutter/material.dart';
import 'package:vajra/pages/hotel_details_page.dart';
import 'package:vajra/widgets/hotel_card_widget.dart';
import 'package:vajra/widgets/search_input_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> hotelList = [
    {
      'profileImg': 'assets/images/hotel_img.png',
      'name': 'Rising Sun Hotel & Restaurant',
      'location': 'Harrow, HA1 3QL',
      'recipeStyle': 'Chinese, Asian'
    },
    {
      'profileImg': 'assets/images/hotel_placeholder.png',
      'name': 'Abi Fast Food',
      'location': 'Middleeast, HA2 8EB',
      'recipeStyle': 'Indian'
    },
    {
      'profileImg': 'assets/images/hotel_img_2.png',
      'name': 'Dhillon\'s Fish & Chips',
      'location': 'Grays, RM17 6LU',
      'recipeStyle': 'Indian'
    },
    {
      'profileImg': 'assets/images/hotel_img_3.png',
      'name': 'Chinnamon Lounge',
      'location': 'Hounslow Borough, TW7 ^AB',
      'recipeStyle': 'Indian'
    },
    {
      'profileImg': 'assets/images/hotel_img_4.png',
      'name': 'Paradise Biryani Pointe',
      'location': 'East Ham, E12 6SL',
      'recipeStyle': 'Indian'
    },
    {
      'profileImg': 'assets/images/hotel_img.png',
      'name': 'Rising Sun Hotel & Restaurant',
      'location': 'Harrow, HA1 3QL',
      'recipeStyle': 'Chinese, Asian'
    },
    {
      'profileImg': 'assets/images/hotel_placeholder.png',
      'name': 'Abi Fast Food',
      'location': 'Middleeast, HA2 8EB',
      'recipeStyle': 'Indian'
    },
    {
      'profileImg': 'assets/images/hotel_img_2.png',
      'name': 'Dhillon\'s Fish & Chips',
      'location': 'Grays, RM17 6LU',
      'recipeStyle': 'Indian'
    },
    {
      'profileImg': 'assets/images/hotel_img_3.png',
      'name': 'Chinnamon Lounge',
      'location': 'Hounslow Borough, TW7 ^AB',
      'recipeStyle': 'Indian'
    },
    {
      'profileImg': 'assets/images/hotel_img_4.png',
      'name': 'Paradise Biryani Pointe',
      'location': 'East Ham, E12 6SL',
      'recipeStyle': 'Indian'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          child: Column(
            children: [
              SearchInput(
                controller: searchController,
                hintText: 'Search',
              ),
              const SizedBox(height: 10.0),
              Expanded(
                  child: ListView.separated(
                      itemCount: hotelList.length,
                      separatorBuilder: (context, index) => const Divider(
                            height: 2.0,
                          ),
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = hotelList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HotelDetailsPage(hotel: data)));
                          },
                          child: HotelCard(
                            imageUrl: data['profileImg'],
                            hotelName: data['name'],
                            location: data['location'],
                            recipe: data['recipeStyle'],
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
