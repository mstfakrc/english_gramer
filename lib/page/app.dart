import 'package:flutter/material.dart';
import 'package:learning_english/share_preferences/preferences.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../screen/screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final handlePageView = Provider.of<PageViewProvider>(context);
    return Scaffold(
      body: handlePageView.allPagesViewed
          ? const HomeScreen()
          : PageView(
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      color: Colors.blue.withOpacity(0.4),
                      child: Image.asset(
                        'assets/write.jpg',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        'Write to improve your English',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      color: Colors.blue.withOpacity(0.4),
                      child: Image.asset(
                        'assets/speack.jpg',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    const Positioned(
                      bottom: 20,
                      left: 15,
                      child: Text(
                        'Speak to perfect your pronunciation',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      color: Colors.blue.withOpacity(0.4),
                      child: Image.asset(
                        'assets/read.jpg',
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      child: Row(
                        children: [
                          const Text(
                            'Read to expand your vocabulary',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  handlePageView.setAllPagesViewed(true);
                                  Preferences.allPagesViewed = true;
                                },
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
