import 'package:flutter/material.dart';
import 'package:flutter_project_nutcm_1/controllers/data_controller.dart';
import 'package:get/get.dart';

class UserListScreen extends StatefulWidget {
  // final DataController controller = Get.put(DataController());

  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen>
    with SingleTickerProviderStateMixin {
  String imageLocation =
      '"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"';

  final List<Map<String, dynamic>> _allUsers = [
    {
      "places": "Amtali",
      "Gazipur_Sadar": "277",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "14762",
      "Cat_1_grade_2_3_bill": "14412",
      "Cat_1_grade_4_5_bill": "14062",
      "Cat_2_grade_6_7_bill": "11132",
      "Cat_2_grade_8_10_bill": "11082"
    },
    {
      "places": "Bamna",
      "Gazipur_Sadar": "281",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "14906",
      "Cat_1_grade_2_3_bill": "14556",
      "Cat_1_grade_4_5_bill": "14206",
      "Cat_2_grade_6_7_bill": "11228",
      "Cat_2_grade_8_10_bill": "11178"
    },
    {
      "places": "Barguna Sadar",
      "Gazipur_Sadar": "282",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "14942",
      "Cat_1_grade_2_3_bill": "14592",
      "Cat_1_grade_4_5_bill": "14242",
      "Cat_2_grade_6_7_bill": "11252",
      "Cat_2_grade_8_10_bill": "11202"
    },
    {
      "places": "Betagi",
      "Gazipur_Sadar": "254",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "13934",
      "Cat_1_grade_2_3_bill": "13584",
      "Cat_1_grade_4_5_bill": "13234",
      "Cat_2_grade_6_7_bill": "10580",
      "Cat_2_grade_8_10_bill": "10530"
    },
    {
      "places": "Patharghata",
      "Gazipur_Sadar": "307",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "15842",
      "Cat_1_grade_2_3_bill": "15492",
      "Cat_1_grade_4_5_bill": "15142",
      "Cat_2_grade_6_7_bill": "11852",
      "Cat_2_grade_8_10_bill": "11802"
    },
    {
      "places": "Taltali",
      "Gazipur_Sadar": "299",
      "District": "Barguna",
      "Cat_1_grade_1_bill": "15554",
      "Cat_1_grade_2_3_bill": "15204",
      "Cat_1_grade_4_5_bill": "14854",
      "Cat_2_grade_6_7_bill": "11660",
      "Cat_2_grade_8_10_bill": "11610"
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["places"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              user["District"]
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  late AnimationController _controller;

/*
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  */

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search Locations & Bills"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.1),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? SingleChildScrollView(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) => Card(
                              elevation: 1,
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Location : ' +
                                                _foundUsers[index]['places'] ??
                                            ''),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text('District Name: ' +
                                                    _foundUsers[index]
                                                        ['District'] ??
                                                ''),
                                            Text('Catagory_1_grade_1_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_1_grade_1_bill'] ??
                                                ''),
                                            Text('Catagory_1_grade_(2-3)_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_1_grade_(2-3)_bill'] ??
                                                ''),
                                            Text('Catagory_1_grade_(4-5)_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_1_grade_(4-5)_bill'] ??
                                                ''),
                                            Text('Catagory_2_grade_(6-7)_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_2_grade_(6-7)_bill'] ??
                                                ''),
                                            Text('Catagory_2_grade_(8-10)_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_2_grade_(8-10)_bill'] ??
                                                ''),
                                            /*   Text('Catagory_3_grade_(11-13)_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_3_grade_(11-13)_bill'] ??
                                                ''),
                                            Text('Catagory_3_grade_(14-16)_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_3_grade_(14-16)_bill'] ??
                                                ''),
                                            Text('Catagory_4_grade_(17-20)_bill: ' +
                                                    _foundUsers[index][
                                                        'Catagory_4_grade_(17-20)_bill'] ??
                                                ''), */
                                            SizedBox(
                                                height: 10), // add some spacing
                                            Text('Distance From Gazipur: ' +
                                                    _foundUsers[index]
                                                        ['Gazipur_Sadar'] ??
                                                ''),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Card(
                                  elevation: 1,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(
                                          /*_foundUsers[index]['image'] */
                                          (imageLocation)),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    title: Text(_foundUsers[index]['places']),
                                    subtitle: Text(
                                        '${_foundUsers[index]["District"]}'),
                                  ),
                                ),
                              ))))
                  : const Text(
                      'No results found Please try with diffrent search',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
