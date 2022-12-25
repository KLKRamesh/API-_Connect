import 'package:flutter/material.dart';
import 'package:loginpage/rest_api_service.dart';
import 'package:loginpage/user_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = RestAPIService();

  @override
  void initState() {
    super.initState();
    apiService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: Column(children: [
          Expanded(
              child: FutureBuilder(
            future: apiService.getUsers(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserScreen(user: snapshot.data![index])));
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ]),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ListTile(
                            //name ??'' is if some data is null it will return the emty string value
                            title: Text(snapshot.data?[index].name ?? '',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.black)),
                            subtitle: Text(snapshot.data?[index].city ?? '',
                                style: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            leading: ClipOval(
                              child: Image.network(
                                snapshot.data?[index].image ?? '',
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ),
                        ));
                  },
                );
              } else {
                return Container(
                  child: const Center(
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }
            }),
          ))
        ]),
      ),
    );
  }
}
