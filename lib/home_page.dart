import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:izisoft_flutter_test_lenguyenngocdong/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String api = ' https://6551f0255c69a77903294d34.mockapi.io/v1';
  User user = User(
      id: '',
      email: '',
      name: '',
      avatar: '',
      gender: '',
      describe: '',
      job: '',
      password: '');

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var request = http.MultipartRequest('GET', Uri.parse('$api/1'));
    var headers = {
      '"Content-type': 'application/json',
      'Accept': 'application/json',
    };
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        user = User.fromJson(response.headers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
        actions: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              foregroundImage: NetworkImage(user.avatar),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('User'),
            ),
            ListTile(
              title: title('My Profile', const Icon(Icons.person)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: title('Donation', const Icon(Icons.wallet)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: title('Address', const Icon(Icons.location_on)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: title('Email', const Icon(Icons.location_on)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            search(),
            tag(),
            const Text('Category'),
            Row(
              children: [
                TextButton(onPressed: () {}, child: const Text('Education')),
                TextButton(onPressed: () {}, child: const Text('Disaster')),
                TextButton(onPressed: () {}, child: const Text('Medical'))
              ],
            ),
            Row(
              children: [
                const Text('Training Campaign'),
                TextButton(onPressed: () {}, child: const Text('See more'))
              ],
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Stack(
                      children: [
                        Image.network(
                            'https://d1hjkbq40fs2x4.cloudfront.net/2017-08-21/files/landscape-photography_1645-t.jpg'),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 60,
                              height: 60,
                              margin: const EdgeInsets.only(top: 10, right: 10),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child:
                                  const Icon(Icons.local_attraction_outlined),
                            )),
                        Positioned(
                            child: Container(
                          width: 100,
                          height: 50,
                          margin: const EdgeInsets.only(bottom: 10, left: 10),
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Text('20 day left'),
                        ))
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Row title(String text, Icon icon) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [icon, Text(text)],
                ),
                const Icon(Icons.navigate_next)
              ],
            );
  }

  Container tag() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF039e75),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: const Icon(Icons.favorite, color: Colors.redAccent),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
            child: const Text('Make The World More Meaning full',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ))
        ],
      ),
    );
  }

  Container search() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              autocorrect: true,
              decoration: const InputDecoration.collapsed(
                hintText: 'search',
              ),
              onChanged: (value) {},
            )),
            const Icon(Icons.search)
          ],
        ));
  }
}
