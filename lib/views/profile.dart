import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Signed in as',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 6.0,),
            Text(
              user.email!,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            ElevatedButton.icon(
              
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shadowColor: Colors.purple,
              ),
              icon: const Icon(Icons.arrow_back, size: 32,),
              label: const Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              onPressed: () {
                signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}