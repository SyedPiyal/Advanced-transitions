import 'package:flutter/cupertino.dart';
import 'package:transitions/view/widgets/slidingCard.dart';

class SlidingCardView extends StatefulWidget {
  const SlidingCardView({super.key});

  @override
  State<SlidingCardView> createState() => _SlidingCardViewState();
}

class _SlidingCardViewState extends State<SlidingCardView> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(
      () {
        setState(() => pageOffset = pageController.page ?? 0.0);
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: [
          SlidingCard(
            name: 'Shenzhen GLOBAL DESIGN AWARD 2018',
            date: '4.20-30',
            assetName: 'steve-johnson.jpeg',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Dawan District, Guangdong Hong Kong and Macao',
            date: '4.28-31',
            assetName: 'rodion-kutsaev.jpeg',
            offset: pageOffset - 1,
          ),
        ],
      ),
    );
  }
}
