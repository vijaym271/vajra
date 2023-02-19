import 'package:flutter/material.dart';
import 'package:vajra/utils/color_utils.dart';
import 'package:vajra/widgets/hotel_card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({super.key, required this.hotel});
  final Map<String, dynamic> hotel;

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  HotelCard hotelCard = const HotelCard();
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 130) {
        setState(() {
          _showTitle = true;
        });
      } else {
        setState(() {
          _showTitle = false;
        });
      }
    });
  }

  Widget _renderContactDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              Icons.access_time_filled,
              color: ColorUtils.grey,
              size: 15.0,
            ),
            SizedBox(width: 5.0),
            Text.rich(TextSpan(text: 'Closed at: ', children: [
              TextSpan(
                  text: '22:30', style: TextStyle(fontWeight: FontWeight.bold))
            ]))
          ],
        ),
        Row(
          children: const [
            Icon(
              Icons.call,
              color: ColorUtils.grey,
              size: 15.0,
            ),
            SizedBox(width: 5.0),
            Text('02084222555')
          ],
        )
      ],
    );
  }

  Widget _renderOrderOnline() {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 215, 198),
          borderRadius: BorderRadius.circular(
            10.0,
          )),
      child: Row(
        children: [
          SizedBox(
              height: 100.0,
              width: 50.0,
              child: Image.asset('assets/images/hotel_img.png')),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Food your food cravings here!!',
                style: TextStyle(color: ColorUtils.white),
              ),
              Text(
                'Order Online',
                style: TextStyle(fontSize: 18.0, color: ColorUtils.white),
              )
            ],
          ),
          Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {}, child: const Icon(Icons.arrow_forward_ios))),
          )
        ],
      ),
    );
  }

  Widget _renderCard({String title = "", String desc = ''}) {
    return Container(
      height: 130.0,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorUtils.white,
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Text(
          desc,
          style:
              TextStyle(fontSize: 12, color: ColorUtils.grey.withOpacity(0.9)),
        )
      ]),
    );
  }

  Widget _renderHotelOptions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: _renderCard(
                    title: 'Table Ordering', desc: 'Contacties Ordering')),
            const SizedBox(width: 10.0),
            Expanded(
                child: _renderCard(title: 'Menu', desc: 'Contactless Menu')),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: _renderCard(
                    title: 'Offer', desc: 'See our exclusive offers')),
            const SizedBox(width: 10.0),
            Expanded(
                child: _renderCard(title: 'Timings', desc: 'View out timings')),
          ],
        ),
      ],
    );
  }

  Widget _renderOfferCard(
      {required String imageUrl, required String title, String desc = ''}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: ColorUtils.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(desc)
        ],
      ),
    );
  }

  Widget _renderOffersList() {
    return _renderOfferCard(
        imageUrl: 'assets/images/dish_img.png',
        title: '10% Offer',
        desc: 'Enjoy this offer on every on Tue & Wed');
  }

  Widget _renderAppBarWidget() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Image.asset(
                width: double.infinity,
                height: 160,
                'assets/images/dish_img_2.png',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 8.0),
            _renderDetails(),
            const SizedBox(height: 8.0),
          ],
        ),
        Positioned(
            bottom: 40.0,
            left: 16.0,
            child: Container(
              color: ColorUtils.white,
              padding: const EdgeInsets.all(4.0),
              height: 80.0,
              width: 80.0,
              child: Image.asset(widget.hotel['profileImg']),
            ))
      ],
    );
  }

  Widget _renderDetails() {
    String hotelName = widget.hotel['name'];
    String location = widget.hotel['location'];
    String recipe = widget.hotel['recipeStyle'];
    return Padding(
      padding:
          EdgeInsets.only(left: MediaQuery.of(context).size.width / 4 + 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotelName,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.locationDot,
                size: 12.0,
                color: ColorUtils.grey,
              ),
              const SizedBox(width: 5.0),
              Text(
                location,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.utensils,
                size: 12.0,
                color: ColorUtils.grey,
              ),
              const SizedBox(width: 5.0),
              Text(
                recipe,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: _showTitle ? ColorUtils.red : ColorUtils.white,
            title: Visibility(
                visible: _showTitle, child: Text(widget.hotel['name'])),
            pinned: true,
            expandedHeight: 280.0,
            flexibleSpace: FlexibleSpaceBar(background: _renderAppBarWidget()),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    _renderContactDetails(),
                    const SizedBox(height: 10.0),
                    _renderOrderOnline(),
                    const SizedBox(height: 10.0),
                    _renderHotelOptions(),
                    const SizedBox(height: 10.0),
                    _renderOffersList()
                  ])),
            ),
          ),
        ],
      )),
    );
  }
}
