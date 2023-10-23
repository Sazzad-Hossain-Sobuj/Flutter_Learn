

import 'package:chat_ui_design/models/user_model.dart';

class Message {
  final User sender;
  final String
  time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/sazzad.jpg',
);

// USERS
final User shuvo = User(
  id: 1,
  name: 'Shuvo',
  imageUrl: 'assets/shuvo.jpg',
);
final User nadim = User(
  id: 2,
  name: 'Nadim',
  imageUrl: 'assets/nadim.jpg',
);
final User sadiqul = User(
  id: 3,
  name: 'Sadiqul',
  imageUrl: 'assets/sadiqul.jpg',
);
final User fahim = User(
  id: 4,
  name: 'Fahim',
  imageUrl: 'assets/fahim.jpg',
);
final User saiful = User(
  id: 5,
  name: 'Saiful',
  imageUrl: 'assets/saiful.jpg',
);
final User sakib = User(
  id: 6,
  name: 'Sakib',
  imageUrl: 'assets/sakib.jpg',
);
final User sazzad = User(
  id: 7,
  name: 'Sazzad',
  imageUrl: 'assets/sazzad.jpg',
);
final User tusar = User(
  id: 7,
  name: 'Tusar',
  imageUrl: 'assets/tusar.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [shuvo, nadim, sadiqul, fahim, saiful, sakib,tusar];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: saiful,
    time: '5:30 PM',
    text: "Hey! I'am saimone but my friend's call me ullo boy and i enojoy it",
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sadiqul,
    time: '4:30 PM',
    text: 'Hey! Gagu is here.',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: fahim,
    time: '3:30 PM',
    text: 'Hey! Momo I love you 🖤',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sakib,
    time: '2:30 PM',
    text: 'Hey! Now I am with sumaiya israt',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: shuvo,
    time: '1:30 PM',
    text: 'Hey! I am play boy',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sazzad,
    time: '12:30 PM',
    text: 'Hey! Always Innocent😊',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: nadim,
    time: '11:30 AM',
    text: 'Hey! I am married.',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: tusar,
    time: '1:30 AM',
    text: 'Hey! Flutter Developer',
    isLiked: false,
    unread: true,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: fahim,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sazzad,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: sakib,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nadim,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];