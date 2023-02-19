import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vajra/utils/color_utils.dart';

class HotelCard extends StatelessWidget {
  const HotelCard(
      {super.key,
      this.imageUrl = 'assets/images/hotel_placeholder.png',
      this.bgColor = ColorUtils.white,
      this.hotelName = '',
      this.location = '',
      this.recipe = ''});
  final String? imageUrl;
  final Color bgColor;
  final String? hotelName;
  final String? location;
  final String? recipe;

  Widget _renderImage() {
    return Container(
      height: 85.0,
      width: 85.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:
              DecorationImage(image: AssetImage(imageUrl!), fit: BoxFit.cover)),
    );
  }

  Widget _renderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotelName!,
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
              location!,
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
              recipe!,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: bgColor),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _renderImage(),
        const SizedBox(
          width: 12.0,
        ),
        _renderDetails()
      ]),
    );
  }
}
