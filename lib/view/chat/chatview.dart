import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random/Services/chatroomServices.dart';
import 'package:random/Utils/Constants.dart';
import 'package:random/view/chat/Conversation.dart';
import 'package:random/widgets/Loader.dart';

/*
  Code For Message Page
*/
class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat", style: TextStyle(color: Colors.black)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Feather.search),
            onPressed: () {
              showSearch(context: context, delegate: UserSearchDirect());
            },
          )
        ],
      ),
      body: Scaffold(
        body: DirectChats(),
      ),
    );
  }
}

class DirectChats extends StatefulWidget {
  @override
  _DirectChatsState createState() => _DirectChatsState();
}

class _DirectChatsState extends State<DirectChats> {
  Stream userDirectChats;
  TextEditingController friendsSearch;
  String searchQuery = "";
  void initState() {
    getUserChats(); //Getting the chats of the particular user
    super.initState();
    friendsSearch = new TextEditingController();
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
    print("searched " + newQuery);
  }

  getUserChats() async {
    ChatroomService().getUsersDirectChats().then((snapshots) {
      setState(() {
        userDirectChats = snapshots;
        print("we got the data for user direct chats");
      });
    });
  }

  Widget getDirectChats() {
    return StreamBuilder(
      stream: userDirectChats,
      builder: (context, asyncSnapshot) {
        print("Working");
        if (asyncSnapshot.hasData) {
          if (asyncSnapshot.data.documents.length > 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: asyncSnapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  int indexOfOtherUser = 0;
                  if (Constants.prefs.getString('name') ==
                      asyncSnapshot.data.documents[index]
                          .get('usersNames')[0]) {
                    indexOfOtherUser = 1;
                  }
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      onTap: () {
                        //Sending the user to the chat room
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Conversation(
                                chatRoomId: asyncSnapshot.data.documents[index]
                                    .get('chatRoomId'),
                                usersNames: asyncSnapshot.data.documents[index]
                                    .get('usersNames'),
                                users: asyncSnapshot.data.documents[index]
                                    .get('users'),
                                usersPics: asyncSnapshot.data.documents[index]
                                    .get('usersPics')),
                          ),
                        );
                      },
                      title: Text(
                        asyncSnapshot.data.documents[index]
                            .get('usersNames')[indexOfOtherUser],
                        style: TextStyle(fontSize: 18),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 48,
                          height: 48,
                          image: NetworkImage(
                            asyncSnapshot.data.documents[index]
                                .get('usersPics')[indexOfOtherUser],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Image.asset("assets/chatting_illustration.png"),
              ),
            );
          }
        } else {
          return Loader();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[getDirectChats()],
            ),
          ),
        ],
      ),
    );
  }
}

class UserSearchDirect extends SearchDelegate<ListView> {
  getUser(String query) {
    print("getUser");
    return FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: query)
        .limit(1)
        .snapshots();
  }

  getUserFeed(String query) {
    print("getUserFeed");
    return FirebaseFirestore.instance
        .collection("users")
        .where("userSearchParam", arrayContains: query)
        .limit(5)
        .snapshots();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Feather.x),
        onPressed: () {
          query = '';
        },
      ),
    ];
    // throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
        stream: getUser(query),
        builder: (context, asyncSnapshot) {
          return asyncSnapshot.hasData
              ? ListView.builder(
                  itemCount: asyncSnapshot.data.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Card(
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                image: NetworkImage(
                                  asyncSnapshot.data.documents[index]
                                      .get('profileImage'),
                                ),
                              ),
                            ),
                            title: Text(
                              asyncSnapshot.data.documents[index].get('name'),
                            ),
                            subtitle: Text(
                              asyncSnapshot.data.documents[index].get('name'),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : Container(
                  child: Center(child: Text("Search")),
                );
        });
  }

  createChatRoom(
      String userId, BuildContext context, String name, String userProfile) {
    if (userId != Constants.prefs.getString('userId')) {
      List<String> users = [userId, Constants.prefs.getString('userId')];
      String chatRoomId =
          getUsersInvolved(userId, Constants.prefs.getString('userId'));
      List<String> usersNames = [name, Constants.prefs.getString('name')];
      List<String> usersPics = [
        userProfile,
        Constants.prefs.getString('profileImage')
      ];

      Map<String, dynamic> chatRoom = {
        "users": users,
        "chatRoomId": chatRoomId,
        "usersNames": usersNames,
        "usersPics": usersPics,
      };
      ChatroomService().addChatRoom(chatRoom, chatRoomId);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Conversation(
                    chatRoomId: chatRoomId,
                    usersNames: usersNames,
                    users: users,
                    usersPics: usersPics,
                  )));
    } else {
      print("Cannot do that");
    }
  }

  getUsersInvolved(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
        stream: getUserFeed(query),
        builder: (context, asyncSnapshot) {
          print("Working");
          return asyncSnapshot.hasData
              ? ListView.builder(
                  itemCount: asyncSnapshot.data.documents.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          print("creating a chat room");
                          //Creating a chatroom for the user he searched for
                          // Can get any information of that other user here.
                          createChatRoom(
                              asyncSnapshot.data.documents[index].get('userId'),
                              context,
                              asyncSnapshot.data.documents[index].get('name'),
                              asyncSnapshot.data.documents[index]
                                  .get('profileImage'));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  image: NetworkImage(asyncSnapshot
                                      .data.documents[index]
                                      .get('profileImage')
                                      .toString()),
                                ),
                              ),
                              title: Text(asyncSnapshot.data.documents[index]
                                  .get('name')),
                              subtitle: Text(
                                asyncSnapshot.data.documents[index].get('name'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : Container(
                  child: Center(
                    child: Text("Search"),
                  ),
                );
        });
    // throw UnimplementedError();
  }
}
