import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen>






   with SingleTickerProviderStateMixin {

    final List<Map<String, dynamic>> _allUsers = [
    {
  "id": "1",
  "name": "Barguna",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com\/media\/photo-o\/0c\/a0\/70\/5f\/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "2",
  "name": "Barishal",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "3",
  "name": "Bhola",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "4",
  "name": "Jhalokati",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "5",
  "name": "Patuakhali",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "6",
  "name": "Pirojpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "7",
  "name": "Bandarban",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "8",
  "name": "Brahmanbaria",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "9",
  "name": "Chandpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "10",
  "name": "Chattogram",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "11",
  "name": "Cumilla",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "12",
  "name": "Cox's Bazar",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "13",
  "name": "Feni",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "14",
  "name": "Khagrachhari",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "15",
  "name": "Lakshmipur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "16",
  "name": "Noakhali",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "17",
  "name": "Rangamati",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "18",
  "name": "Dhaka",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "19",
  "name": "Faridpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "20",
  "name": "Gazipur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "21",
  "name": "Gopalganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "22",
  "name": "Kishoreganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "23",
  "name": "Madaripur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "24",
  "name": "Manikganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "25",
  "name": "Munshiganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "26",
  "name": "Narayanganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "27",
  "name": "Narsingdi",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "28",
  "name": "Rajbari",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "29",
  "name": "Shariatpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "30",
  "name": "Tangail",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "31",
  "name": "Bagerhat",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "32",
  "name": "Chuadanga",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "33",
  "name": "Jashore",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "34",
  "name": "Jhenaidah",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "35",
  "name": "Khulna",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "36",
  "name": "Kushtia",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "37",
  "name": "Magura",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "38",
  "name": "Meherpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "39",
  "name": "Narail",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "40",
  "name": "Satkhira",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "41",
  "name": "Jamalpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "42",
  "name": "Mymensingh",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "43",
  "name": "Netrokona",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "44",
  "name": "Sherpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "45",
  "name": "Bogura",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "46",
  "name": "Joypurhat",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "47",
  "name": "Naogaon",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "48",
  "name": "Natore",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "49",
  "name": "Chapai Nawabganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "50",
  "name": "Pabna",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "51",
  "name": "Rajshahi",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "52",
  "name": "Sirajganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "53",
  "name": "Dinajpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "54",
  "name": "Gaibandha",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "55",
  "name": "Kurigram",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "56",
  "name": "Lalmonirhat",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "57",
  "name": "Nilphamari",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "58",
  "name": "Panchagarh",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "59",
  "name": "Rangpur",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "60",
  "name": "Thakurgaon",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "61",
  "name": "Habiganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "62",
  "name": "Moulvibazar",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "63",
  "name": "Sunamganj",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
 },
 {
  "id": "64",
  "name": "Sylhet",
  "des": "Tour Bill - 7000",
  "image": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1"
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
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
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
    return Scaffold(appBar:AppBar
    
    ( centerTitle: true,
      title: const Text("Search Locations & Bills"),
    ), 
    
    
    body: Padding(
      padding: const EdgeInsets.all(10.1),
    child:Column(children: [

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
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                NetworkImage(_foundUsers[index]['image']),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(_foundUsers[index]['name']),
                          subtitle: Text('${_foundUsers[index]["des"]}'),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found Please try with diffrent search',
                      style: TextStyle(fontSize: 24),
                    ),
            ),


          ],),
    ),
      );
  }
    }