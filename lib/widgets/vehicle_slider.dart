import 'package:flutter/material.dart';

class VehicleSlider extends StatefulWidget {
  const VehicleSlider({super.key});

  @override
  State<VehicleSlider> createState() => _VehicleSliderState();
}

class _VehicleSliderState extends State<VehicleSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'assets/image/banner.png',
    'assets/image/banner.png',
    'assets/image/banner.png',
    'assets/image/banner.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? const Color(0xFFFFFFFF) : const Color(0x80D9D9D9),
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required VoidCallback onTap,
    required Color iconColor,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0x80FFFFFF),
        borderRadius: BorderRadius.circular(32),
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor, size: 20),
        onPressed: onTap,
        padding: EdgeInsets.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: _images
                .map((img) => Image.asset(img, fit: BoxFit.cover, width: double.infinity))
                .toList(),
          ),
          Positioned(
            top: 48,
            left: 16,
            child: _buildIcon(
              icon: Icons.arrow_back_ios_new,
              iconColor: Colors.black,
              onTap: () {},
            ),
          ),
          Positioned(
            top: 48,
            right: 16,
            child: _buildIcon(
              icon: Icons.favorite,
              iconColor: Color(0xFFDC4C44),
              onTap: () {},
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (index) => _buildIndicator(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
