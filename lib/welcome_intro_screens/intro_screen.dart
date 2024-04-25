import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../common_data/linear_background.dart';
import '../common_data/rounded_button.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;
  final List<IntroScreen> introScreens = [
    IntroScreen(
      title: "Find Best Delivery Services All Around Your City",
      description: "Affordable delivery options available for you.",
      image: 'assets/image.png',
    ),
    IntroScreen(
      title: "Delivering\nlip-smacking food\nis our passion.",
      description: "Time is precious, and we know that.",
      image: 'assets/image.png',
    ),
    IntroScreen(
      title: "Your Favorite\nFood delivery\nPartner",
      description: "The best service to fulfill your expectations.",
      image: 'assets/image.png',
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _onNextButtonTap() {
    if (_currentPageIndex < introScreens.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
     // Get.toNamed(Routes.ClmRow());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: introScreens.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return IntroScreenWidget(
                introScreen: introScreens[index],
              );
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 80,
            child: Center(
              child: RoundedButton(
                padding:
                _currentPageIndex == introScreens.length - 1 ? 3 : null,
                width: MediaQuery.of(context).size.width / 1.2,
                name: 'Next',
                onPressed: _onNextButtonTap,
                child: _currentPageIndex == introScreens.length - 1
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(Icons.chevron_right),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Get Startedsssss",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 58,
                    )
                  ],
                )
                    : null,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Center(
              child: DotsIndicator(
                dotsCount: introScreens.length,
                position: _currentPageIndex,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(30.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  activeColor: const Color(0xFFFF6724),
                  spacing: const EdgeInsets.symmetric(horizontal: 4),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IntroScreen {
  final String title;
  final String description;
  final String image;

  IntroScreen({
    required this.title,
    required this.description,
    required this.image,
  });
}

class IntroScreenWidget extends StatelessWidget {
  final IntroScreen introScreen;

  const IntroScreenWidget({required this.introScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearBackground(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                introScreen.title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 40),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                introScreen.description,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                  height: introScreen.image.contains('delivery_vehicle.png')
                      ? 1
                      : 1),
              SizedBox(
                height: MediaQuery.of(context).size.height/1.9,
                width: double.infinity,
                child: introScreen.image.contains('delivery_vehicle.png')
                    ? Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                          height: 360,
                          child: Image.asset(introScreen.image)),
                    ),
                    Positioned(
                      top: 0,
                      right: 150,
                      child: SizedBox(
                        height: 70,
                        child: Image.asset('assets/images/burger.png'),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 10,
                      child: SizedBox(
                        height: 70,
                        child:
                        Image.asset('assets/images/french_fries.png'),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 0,
                      child: SizedBox(
                        height: 70,
                        child: Image.asset('assets/images/taco.png'),
                      ),
                    ),
                  ],
                )
                    : Image.asset(introScreen.image),
              ),
              SizedBox(
                height: introScreen.image.contains('delivery_vehicle.png')?10:40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
