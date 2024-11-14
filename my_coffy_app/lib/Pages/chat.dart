import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
                hintText: 'Buscar...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16)),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          _buildChat(context, '@User21324'),
          const SizedBox(
            height: 5,
          ),
          _buildChat(context, '@User655433'),
          const SizedBox(
            height: 5,
          ),
          _buildChat(context, '@User328948'),
          const SizedBox(
            height: 5,
          ),
          _buildChat(context, '@User983478'),
          const SizedBox(
            height: 5,
          ),
          _buildChat(context, '@User023412'),
        ],
      ),
    );
  }

  Widget _buildChat(BuildContext context, String user) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.grey[300],
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            const SizedBox(width: 20),
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg'),
            ),
            const SizedBox(width: 20),
            Text(
              user,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
