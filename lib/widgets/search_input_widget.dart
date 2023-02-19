import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vajra/utils/color_utils.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    this.controller,
    this.hintText,
  });
  final TextEditingController? controller;
  final String? hintText;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  bool _showCloseIcon = false;

  @override
  void initState() {
    super.initState();
    widget.controller!.addListener(() {
      setState(() {
        _showCloseIcon = widget.controller!.text.isNotEmpty;
      });
    });
  }

  Widget _renderCloseBtn() {
    return Visibility(
      visible: _showCloseIcon,
      child: InkWell(
        onTap: () {
          widget.controller!.clear();
          setState(() {
            _showCloseIcon = false;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: ColorUtils.grey,
          ),
          child: const Icon(
            Icons.clear,
            color: ColorUtils.white,
            size: 15.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
                hintText: widget.hintText,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        bottomLeft: Radius.circular(6.0))),
                suffixIcon: _renderCloseBtn(),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0)),
            onChanged: (value) {
              setState(() {
                _showCloseIcon = value.isNotEmpty;
              });
            },
          ),
        ),
        Visibility(
          visible: true,
          child: InkWell(
            onTap: () {
              widget.controller!.clear();
              setState(() {
                _showCloseIcon = false;
              });
            },
            child: Container(
              height: 48.0,
              width: 45.0,
              decoration: const BoxDecoration(
                color: ColorUtils.red,
              ),
              child: const Icon(
                FontAwesomeIcons.filter,
                color: ColorUtils.white,
                size: 18.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
