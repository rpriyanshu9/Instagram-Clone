import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/story_screen.dart';
import 'package:instagram_clone/utils/user_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: bodyWidget(),
      bottomNavigationBar: bottomNavBarWidget(),
    );
  }

  Widget bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return index != 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StoryScreen(index),
                                ),
                              ),
                              child: Hero(
                                tag: "heroTag$index",
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF9B2282),
                                        Color(0xFFEEA863),
                                      ]),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(
                                        userData[index].profilePicture,
                                      ),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              userData[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                      "https://cdn.britannica.com/54/188754-050-A3613741/Elon-Musk-2010.jpg",
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Icon(
                                      Icons.add_circle,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Your Story",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
          Column(
            children: List.generate(7, (index) => postWidget(index)),
          )
        ],
      ),
    );
  }

  Widget postWidget(int index) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            dense: true,
            leading: CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                "https://cdn.britannica.com/54/188754-050-A3613741/Elon-Musk-2010.jpg",
              ),
              backgroundColor: Colors.transparent,
            ),
            title: Text(
              "Elon Musk",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "Paid partnership with tesla",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Image.network(
              userData[index + 1].profilePicture,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.add_comment_outlined,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.send_outlined,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNavBarWidget() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.movie,
            color: Colors.white,
          ),
          Icon(
            Icons.add_photo_alternate,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.account_box,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
