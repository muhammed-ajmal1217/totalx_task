import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:totalx_machine_task/model/user_data_model.dart';
import 'package:totalx_machine_task/service/data_service.dart';
import 'package:totalx_machine_task/widgets/add_dialogue_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataService dataService = DataService();
  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Nilambur',
          style: GoogleFonts.montserrat(color: Colors.white),
        ),
        leading: Icon(
          Icons.location_on,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_sharp,
                  color: Colors.grey,
                ),
                hintText: 'Search by name',
                hintStyle: GoogleFonts.montserrat(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Users Lists',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.grey[500]),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder<List<UserDataModel>>(
                stream: dataService.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<UserDataModel> allUsers = snapshot.data ?? [];
                    List<UserDataModel> filteredUsers = allUsers.where((user) =>
                      user.name!.toLowerCase().contains(searchController.text.toLowerCase())
                    ).toList();

                    if (filteredUsers.isEmpty) {
                      return Center(child: Text('No users found.'));
                    }

                    return ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = filteredUsers[index];
                        return ListTile(
                          title: Text(user.name ?? ''),
                          subtitle: Text(user.phoneNumber ?? ''),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddDialogueBox(
                nameController: nameController,
                phoneController: phoneController,
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
      ),
    );
  }
}
