import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  List<String> deneme = ["aaaaa", "aaaaa", "asasfasfasf", "asfasfasfasfasf"];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: controller,
          onPageChanged: (index) => setState(() {
            isLastPage = index == 2;
          }),
          children: [
            Container(
              color: Colors.red,
              child: Center(
                child: Text('Deneme'),
              ),
            ),
            Container(
              color: Colors.green,
              child: Center(
                child: Text('Deneme2'),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Center(
                child: Text('Deneme3'),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              color: Colors.teal,
              height: 60,
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          : Container(
              color: Colors.transparent,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 15),
                      )),
                  Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: WormEffect(
                          spacing: 10,
                          dotColor: Colors.blue,
                          activeDotColor: Colors.red,
                        ),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInCubic)),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInCubic,
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
            ),
    );
  }
}

class _OnBoardingContainer extends StatelessWidget {
  const _OnBoardingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
