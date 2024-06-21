import 'package:api_project_2/api_services.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  ApiService apiService = ApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: apiService.getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something error!'),
                );
              } else {
                return ListView.builder(
                    itemCount: apiService.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        tileColor: apiService.users[index].gender == 'male'
                            ? Colors.blue.shade100
                            : Colors.pink.shade100,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              apiService.users[index].profileImage.large),
                        ),
                        title: Text('${apiService.users[index].userName.first} ${apiService.users[index].userName.last}'),
                        subtitle: Text(apiService.users[index].email),
                        trailing: CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ))),
                      );
                    });
              }
            }
          }),
    );
  }
}
