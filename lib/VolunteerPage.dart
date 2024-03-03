import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('volunteers').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              var volunteer = snapshot.data?.docs[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(volunteer?['profilePicture']),
                ),
                title: Text(volunteer?['name']),
                subtitle: Row(
                  children: [
                    Icon(volunteer?['providesMoney'] ? Icons.monetization_on : Icons.money_off, color: volunteer?['providesMoney'] ? Colors.green : Colors.red),
                    Icon(volunteer?['providesTime'] ? Icons.schedule : Icons.schedule_outlined, color: volunteer?['providesTime'] ? Colors.green : Colors.red),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VolunteerProfilePage(volunteerId: volunteer!.id)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class VolunteerProfilePage extends StatelessWidget {
  final String volunteerId;

  VolunteerProfilePage({required this.volunteerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volunteer Profile'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('volunteers').doc(volunteerId).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          var volunteer = snapshot.data!;
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(volunteer['profilePicture']),
                ),
                title: Text(volunteer['name']),
              ),
              ListTile(
                title: Text('Contact: ${volunteer['email']}'),
                onTap: () {
                  // Implement email sending functionality
                },
              ),
              ListTile(
                title: Text('Phone: ${volunteer['phone']}'),
                onTap: () {
                  // Implement phone calling functionality
                },
              ),
              // Add more details about the volunteer here
            ],
          );
        },
      ),
    );
  }
}