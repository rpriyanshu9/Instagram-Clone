import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/user_data.dart';

class StoryScreen extends StatefulWidget {
  final int idx;
  StoryScreen(this.idx);
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  int indx;

  @override
  void initState() {
    super.initState();
    indx = widget.idx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTapDown: (details) => handleTap(details),
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: "heroTag$indx",
                        child: Image.network(
                          userData[indx].storyUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Send Message",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    30.0,
                                  ),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    30.0,
                                  ),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        userData[indx].profilePicture,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      userData[indx].name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  handleTap(TapDownDetails details) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tappedPosition = details.globalPosition.dx;
    if (tappedPosition >= screenWidth / 2) {
      if (indx != userData.length - 1) {
        setState(() {
          indx++;
        });
      }
    } else {
      if (indx != 1) {
        setState(() {
          indx--;
        });
      }
    }
  }
}
