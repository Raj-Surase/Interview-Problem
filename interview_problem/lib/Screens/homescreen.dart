import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:uni_links/uni_links.dart';
import 'package:share/share.dart';
import 'package:interview_problem/Components/tindercards.dart';
import 'package:interview_problem/constants.dart';

class HomeContentScreen extends StatefulWidget {
  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  final CardSwiperController controller = CardSwiperController();

  final List<Map<String, dynamic>> cardsData = [
    {
      'id': '1',
      'title': 'Confession',
      'content': 'GDSC Lead is looking so cute and handsome',
      'views': 1000,
      'gender': 'Male',
    },
    {
      'id': '2',
      'title': 'Announcement',
      'content': 'Hackathon coming up next month!',
      'views': 1500,
      'gender': 'Female',
    },
    {
      'id': '3',
      'title': 'Reminder',
      'content': 'Project submissions are due next week.',
      'views': 750,
      'gender': 'Non-binary',
    },
    {
      'id': '4',
      'title': 'Confession',
      'content': 'I love attending Flutter workshops!',
      'views': 500,
      'gender': 'Male',
    },
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _handleIncomingLinks();
  }

  void _handleIncomingLinks() async {
    getUriLinksStream().listen((Uri? uri) {
      if (uri != null) {
        _navigateToCard(uri);
      }
    }, onError: (err) {
      print('Failed to receive link: $err');
    });

    final initialUri = await getInitialUri();
    if (initialUri != null) {
      _navigateToCard(initialUri);
    }
  }

  void _navigateToCard(Uri uri) {
    final cardId = uri.queryParameters['id'];
    if (cardId != null) {
      final cardIndex = cardsData.indexWhere((card) => card['id'] == cardId);
      if (cardIndex != -1) {
        setState(() {
          currentIndex = cardIndex;
        });
        controller.moveTo(currentIndex);
      }
    }
  }

  void _shareCard() {
    final String id = cardsData[currentIndex]['id'];
    final String title = cardsData[currentIndex]['title'];
    final String link = 'https://confession-aae8e.web.app/card?id=$id';
    Share.share('Check out this $title: $link');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: cardsData.length,
              isLoop: true,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(-30, -30),
              padding: const EdgeInsets.all(24.0),
              allowedSwipeDirection:
                  AllowedSwipeDirection.only(left: true, right: true),
              cardBuilder: (context, index, horizontalThresholdPercentage,
                  verticalThresholdPercentage) {
                return ReusableCard(
                  id: cardsData[index]['id'],
                  title: cardsData[index]['title'],
                  content: cardsData[index]['content'],
                  views: cardsData[index]['views'],
                  gender: cardsData[index]['gender'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.left),
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
                FloatingActionButton(
                  onPressed: controller.undo,
                  child: const Icon(Icons.rotate_left),
                ),
                FloatingActionButton(
                  onPressed: () => controller.swipe(CardSwiperDirection.right),
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("Comment on this post."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Okay"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  'Comment',
                  style: buttonText(color: darkGrey),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(lightGrey),
                ),
              ),
              SizedBox(width: 24),
              ElevatedButton(
                onPressed: _shareCard,
                child: Text(
                  'Share',
                  style: buttonText(color: darkGrey),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(lightGrey),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt),
              SizedBox(width: 8),
              Text('Follow us on Instagram'),
            ],
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    setState(() {
      this.currentIndex = currentIndex ?? 0;
    });
    debugPrint(
        'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top');
    return true;
  }

  bool _onUndo(
      int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    setState(() {
      this.currentIndex = currentIndex;
    });
    debugPrint('The card $currentIndex was undone from the ${direction.name}');
    return true;
  }
}
