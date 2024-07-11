import 'package:flutter/material.dart';
import 'package:kue/custom_scaffold.dart';
import 'package:kue/styling.dart';

class ExpandedUser extends StatefulWidget {
  const ExpandedUser({super.key});

  _ExpandedUserState createState() => _ExpandedUserState();
}

class _ExpandedUserState extends State<ExpandedUser> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track the index of the current card
  bool _liked = false;
  bool _disliked = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Image.asset('assets/logos/logo.png'),
        backgroundColor: primaryDarkColor,
        foregroundColor: primaryLightColor,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 500.0,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      Container(color: Colors.blue),
                      Container(color: Colors.green),
                      Container(color: Colors.orange),
                    ],
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == i
                                ? Colors.black
                                : Colors.black54,
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_left),
                    color: Colors.white,
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      if (_currentPage != 0) {
                        _currentPage -= 1;
                      }
                      setState(() {});
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_right),
                    color: Colors.white,
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      if (_currentPage != 2) {
                        _currentPage += 1;
                      }
                      setState(() {});
                    },
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: IconButton(
                          icon: Icon(Icons.favorite),
                          color: Colors.white,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(success)),
                          onPressed: () {
                            // Handle like tap
                            print("You liked the person");
                            setState(() {
                              _liked = true;
                            });
                          },
                        )),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.white,
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(error)),
                          onPressed: () {
                            // Handle dislike tap
                            print("You disliked the person");
                            setState(() {
                              _disliked = true;
                            });
                          },
                        ),
                ),
              ],
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(32),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: header3,
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final interests = [
                          'Interest 1',
                          'Interest 2',
                          'Interest 3'
                        ];
                        final interest = interests[index];
                        print('Index: $index, Interest: $interest');
                        return Container(
                          margin: EdgeInsets.only(right: 16),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(interest, style: paragraph_primary),
                          ),
                        );
                      },
                      itemCount: 3,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'User Bio that wraps to a max of 2 lines with ellipses cutting off anything past that.',
                    style: paragraph,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
