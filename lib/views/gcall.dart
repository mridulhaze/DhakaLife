/* with call,sms,whatsapp,email button

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:url_launcher/url_launcher.dart'; // For launching actions
import 'package:whatsapp_unilink/whatsapp_unilink.dart'; // For creating WhatsApp links

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    this.tims = '',
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);
  List<FeedbackModel> filteredFeedbacks =
      List<FeedbackModel>.empty(growable: true); // Add filtered list
  TextEditingController searchController = TextEditingController();

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'] ?? '',
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
        filteredFeedbacks.add(feedbackModel); // Add to filtered list as well
      });
    });
  }

  // Add search functionality
  void filterFeedbacks(String query) {
    setState(() {
      filteredFeedbacks = feedbacks.where((feedback) {
        return feedback.tims.contains(query);
      }).toList();
    });
  }

  void showDetailsDialog(FeedbackModel feedback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${feedback.name}'),
                Text('Department Name: ${feedback.dept_name}'),
                Text('Designation: ${feedback.designation}'),
                Text('TIMS ID: ${feedback.tims}'),
                Text('ID: ${feedback.id}'),
                Text('Mobile No: ${feedback.mobile_no}'),
                Text('College Name: ${feedback.college_name}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () async {
                final phone = feedback.mobile_no;

                if (await canLaunch('tel:$phone')) {
                  await launch('tel:$phone');
                } else {
                  throw 'Could not launch phone call';
                }
              },
              child: Text('Call'),
            ),
            TextButton(
              onPressed: () async {
                final phone = feedback.mobile_no;

                if (await canLaunch('sms:$phone')) {
                  await launch('sms:$phone');
                } else {
                  throw 'Could not launch SMS';
                }
              },
              child: Text('SMS'),
            ),
            TextButton(
              onPressed: () async {
                final phone = feedback.mobile_no;
                final link = WhatsAppUnilink(
                  phoneNumber: phone,
                  text: 'Hello, ${feedback.name}!',
                );

                if (await canLaunch('$link')) {
                  await launch('$link');
                } else {
                  throw 'Could not launch WhatsApp';
                }
              },
              child: Text('WhatsApp'),
            ),
            TextButton(
              onPressed: () async {
                final Uri _emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: '', // Add recipient email address here
                  queryParameters: {'subject': 'Subject', 'body': 'Message'},
                );

                if (await canLaunch(_emailLaunchUri.toString())) {
                  await launch(_emailLaunchUri.toString());
                } else {
                  throw 'Could not launch email';
                }
              },
              child: Text('Email'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMS DATA"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterFeedbacks, // Call filter method on text change
              decoration: InputDecoration(
                labelText: 'Search by TIMS',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFeedbacks.length, // Use the filtered list here
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredFeedbacks[index].name),
                  subtitle: Text('TIMS ID: ${filteredFeedbacks[index].tims}'),
                  onTap: () {
                    showDetailsDialog(filteredFeedbacks[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

*/

////////////////////  added pull to refreh ////////////////////////

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    this.tims = '',
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);
  List<FeedbackModel> filteredFeedbacks =
      List<FeedbackModel>.empty(growable: true); // Add filtered list
  TextEditingController searchController = TextEditingController();
  bool isLoading = true; // Add loading indicator

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'] ?? '',
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
        filteredFeedbacks.add(feedbackModel); // Add to filtered list as well
      });
    });

    // Set isLoading to false when data is fetched
    setState(() {
      isLoading = false;
    });
  }

  // Add search functionality
  void filterFeedbacks(String query) {
    setState(() {
      filteredFeedbacks = feedbacks.where((feedback) {
        return feedback.tims.contains(query);
      }).toList();
    });
  }

  // Function to show details in a dialog
  void showDetailsDialog(FeedbackModel feedback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${feedback.name}'),
                Text('Department Name: ${feedback.dept_name}'),
                Text('Designation: ${feedback.designation}'),
                Text('TIMS ID: ${feedback.tims}'),
                Text('ID: ${feedback.id}'),
                Text('Mobile No: ${feedback.mobile_no}'),
                Text('College Name: ${feedback.college_name}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      feedbacks.clear();
      filteredFeedbacks.clear();
      isLoading = true;
    });

    await getFeedbackFromSheet();
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMS DATA"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterFeedbacks, // Call filter method on text change
              decoration: InputDecoration(
                labelText: 'Search by TIMS',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: isLoading
                  ? Center(
                      child:
                          CircularProgressIndicator(), // Show loading indicator
                    )
                  : ListView.builder(
                      itemCount: filteredFeedbacks
                          .length, // Use the filtered list here
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => showDetailsDialog(filteredFeedbacks[
                              index]), // Show details in dialog on tap
                          child: FeedbackTile(
                            image: filteredFeedbacks[index].image,
                            name: filteredFeedbacks[index].name,
                            tims: filteredFeedbacks[index].tims,
                            designation: filteredFeedbacks[index].designation,
                            dept_name: filteredFeedbacks[index].dept_name,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String image, name, tims, designation, dept_name;
  FeedbackTile({
    required this.image,
    required this.name,
    required this.tims,
    required this.designation,
    required this.dept_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(image),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    'Department Name : $dept_name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text('Designation: $designation'),
                  Text('TIMS ID: $tims'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}



///////////////////////////////    with loading icon /////////////////////////////
/*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    this.tims = '',
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);
  List<FeedbackModel> filteredFeedbacks =
      List<FeedbackModel>.empty(growable: true); // Add filtered list
  TextEditingController searchController = TextEditingController();
  bool isLoading = true; // Add loading indicator

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'] ?? '',
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
        filteredFeedbacks.add(feedbackModel); // Add to filtered list as well
      });
    });

    // Set isLoading to false when data is fetched
    setState(() {
      isLoading = false;
    });
  }

  // Add search functionality
  void filterFeedbacks(String query) {
    setState(() {
      filteredFeedbacks = feedbacks.where((feedback) {
        return feedback.tims.contains(query);
      }).toList();
    });
  }

  // Function to show details in a dialog
  void showDetailsDialog(FeedbackModel feedback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${feedback.name}'),
                Text('Department Name: ${feedback.dept_name}'),
                Text('Designation: ${feedback.designation}'),
                Text('TIMS ID: ${feedback.tims}'),
                Text('ID: ${feedback.id}'),
                Text('Mobile No: ${feedback.mobile_no}'),
                Text('College Name: ${feedback.college_name}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMS DATA"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterFeedbacks, // Call filter method on text change
              decoration: InputDecoration(
                labelText: 'Search by TIMS',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(
                    child:
                        CircularProgressIndicator(), // Show loading indicator
                  )
                : ListView.builder(
                    itemCount:
                        filteredFeedbacks.length, // Use the filtered list here
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => showDetailsDialog(filteredFeedbacks[
                            index]), // Show details in dialog on tap
                        child: FeedbackTile(
                          image: filteredFeedbacks[index].image,
                          name: filteredFeedbacks[index].name,
                          tims: filteredFeedbacks[index].tims,
                          designation: filteredFeedbacks[index].designation,
                          dept_name: filteredFeedbacks[index].dept_name,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String image, name, tims, designation, dept_name;
  FeedbackTile({
    required this.image,
    required this.name,
    required this.tims,
    required this.designation,
    required this.dept_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(image),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    'Department Name : $dept_name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text('Designation: $designation'),
                  Text('TIMS ID: $tims'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

*/



/////////////////////////   2  final 1           ///////////////////////////

/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    this.tims = '',
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);
  List<FeedbackModel> filteredFeedbacks =
      List<FeedbackModel>.empty(growable: true); // Add filtered list
  TextEditingController searchController = TextEditingController();

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'] ?? '',
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
        filteredFeedbacks.add(feedbackModel); // Add to filtered list as well
      });
    });
  }

  // Add search functionality
  void filterFeedbacks(String query) {
    setState(() {
      filteredFeedbacks = feedbacks.where((feedback) {
        return feedback.tims.contains(query);
      }).toList();
    });
  }

  // Function to show details in a dialog
  void showDetailsDialog(FeedbackModel feedback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Details'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${feedback.name}'),
                Text('Department Name: ${feedback.dept_name}'),
                Text('Designation: ${feedback.designation}'),
                Text('TIMS ID: ${feedback.tims}'),
                Text('ID: ${feedback.id}'),
                Text('Mobile No: ${feedback.mobile_no}'),
                Text('College Name: ${feedback.college_name}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMS DATA"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterFeedbacks, // Call filter method on text change
              decoration: InputDecoration(
                labelText: 'Search by TIMS',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFeedbacks.length, // Use the filtered list here
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => showDetailsDialog(filteredFeedbacks[
                      index]), // Show details in dialog on tap
                  child: FeedbackTile(
                    image: filteredFeedbacks[index].image,
                    name: filteredFeedbacks[index].name,
                    tims: filteredFeedbacks[index].tims,
                    designation: filteredFeedbacks[index].designation,
                    dept_name: filteredFeedbacks[index].dept_name,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String image, name, tims, designation, dept_name;
  FeedbackTile({
    required this.image,
    required this.name,
    required this.tims,
    required this.designation,
    required this.dept_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(image),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    'Department Name : $dept_name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text('Designation: $designation'),
                  Text('TIMS ID: $tims'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}



*/









/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    this.tims = '',
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);
  List<FeedbackModel> filteredFeedbacks =
      List<FeedbackModel>.empty(growable: true); // Add filtered list
  TextEditingController searchController = TextEditingController();

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'] ?? '',
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
        filteredFeedbacks.add(feedbackModel); // Add to filtered list as well
      });
    });
  }

  // Add search functionality
  void filterFeedbacks(String query) {
    setState(() {
      filteredFeedbacks = feedbacks.where((feedback) {
        return feedback.tims.contains(query);
      }).toList();
    });
  }

  // Function to navigate to a new screen and show details
  void showDetails(FeedbackModel feedback) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(feedback: feedback),
      ),
    );
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMS DATA"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterFeedbacks, // Call filter method on text change
              decoration: InputDecoration(
                labelText: 'Search by TIMS',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFeedbacks.length, // Use the filtered list here
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => showDetails(
                      filteredFeedbacks[index]), // Show details on tap
                  child: FeedbackTile(
                    image: filteredFeedbacks[index].image,
                    name: filteredFeedbacks[index].name,
                    tims: filteredFeedbacks[index].tims,
                    designation: filteredFeedbacks[index].designation,
                    dept_name: filteredFeedbacks[index].dept_name,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String image, name, tims, designation, dept_name;
  FeedbackTile({
    required this.image,
    required this.name,
    required this.tims,
    required this.designation,
    required this.dept_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(image),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    'Department Name : $dept_name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text('Designation: $designation'),
                  Text('TIMS ID: $tims'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final FeedbackModel feedback;

  DetailsScreen({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${feedback.name}'),
            Text('Department Name: ${feedback.dept_name}'),
            Text('Designation: ${feedback.designation}'),
            Text('TIMS ID: ${feedback.tims}'),
            Text('ID: ${feedback.id}'),
            Text('Mobile No: ${feedback.mobile_no}'),
            Text('College Name: ${feedback.college_name}'),
          ],
        ),
      ),
    );
  }
}
*/












/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    this.tims = '',
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);
  List<FeedbackModel> filteredFeedbacks =
      List<FeedbackModel>.empty(growable: true); // Add filtered list
  TextEditingController searchController = TextEditingController();

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'] ?? '',
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
        filteredFeedbacks.add(feedbackModel); // Add to filtered list as well
      });
    });
  }

  // Add search functionality
  void filterFeedbacks(String query) {
    setState(() {
      filteredFeedbacks = feedbacks.where((feedback) {
        return feedback.tims.contains(query);
      }).toList();
    });
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMS DATA"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterFeedbacks, // Call filter method on text change
              decoration: InputDecoration(
                labelText: 'Search by TIMS',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFeedbacks.length, // Use the filtered list here
              itemBuilder: (context, index) {
                return FeedbackTile(
                  image: filteredFeedbacks[index].image,
                  name: filteredFeedbacks[index].name,
                  tims: filteredFeedbacks[index].tims,
                  designation: filteredFeedbacks[index].designation,
                  dept_name: filteredFeedbacks[index].dept_name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String image, name, tims, designation, dept_name;
  FeedbackTile({
    required this.image,
    required this.name,
    required this.tims,
    required this.designation,
    required this.dept_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(image),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    'Department Name : $dept_name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text('Designation: $designation'),
                  Text('TIMS ID: $tims'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}



*/






/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    this.tims = '', // Provide a default value here
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'] ?? '', // Provide a default value here
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
      });
    });
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIMS DATA"),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: feedbacks.length,
          itemBuilder: (context, index) {
            return FeedbackTile(
              image: feedbacks[index].image,
              name: feedbacks[index].name,
              tims: feedbacks[index].tims,
              designation: feedbacks[index].designation,
              dept_name: feedbacks[index].dept_name,
            );
          },
        ),
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String image, name, tims, designation, dept_name;
  FeedbackTile({
    required this.image,
    required this.name,
    required this.tims,
    required this.designation,
    required this.dept_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(image),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    'Department Name : $dept_name',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text('designation:  $designation'),
                  Text('TIMS ID :$tims'),
                ],
              )
            ],
          ),
          /* SizedBox(height: 16),
          Text('designation:  $designation'),
          Text('TIMS ID :$tims'),  */ // Add tims to display it in the UI
        ],
      ),
    );
  }
}


*/




/*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FeedbackModel {
  late String tims;
  late String name;
  late String designation;
  late String dept_name;
  late String id;
  late String mobile_no;
  late String college_name;
  late String image;

  FeedbackModel({
    required this.tims,
    required this.name,
    required this.designation,
    required this.dept_name,
    required this.id,
    required this.mobile_no,
    required this.college_name,
    required this.image,
  });
}

class GSheet2Flutter extends StatefulWidget {
  @override
  _GSheet2FlutterState createState() => _GSheet2FlutterState();
}

class _GSheet2FlutterState extends State<GSheet2Flutter> {
  List<FeedbackModel> feedbacks = List<FeedbackModel>.empty(growable: true);

  getFeedbackFromSheet() async {
    var uri = Uri.parse(
        "https://script.google.com/macros/s/AKfycbzE4Ux_qVkv7ChlBrCpLhsaYPDYCAJkxwHBEq-6e0W7h5CixMElqhJxgy5Hc3sTNdJn/exec");
    var raw = await http.get(uri);

    var jsonFeedback = convert.jsonDecode(raw.body);
    print('This is JSON Feedback $jsonFeedback');

    jsonFeedback.forEach((element) {
      FeedbackModel feedbackModel = FeedbackModel(
        tims: element['tims'],
        name: element['name'],
        designation: element['designation'],
        dept_name: element['dept_name'],
        id: element['id'],
        mobile_no: element['mobile_no'],
        college_name: element['college_name'],
        image: element['image'],
      );

      setState(() {
        feedbacks.add(feedbackModel);
      });
    });
  }

  @override
  void initState() {
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: feedbacks.length,
          itemBuilder: (context, index) {
            return FeedbackTile(
              image: feedbacks[index].image,
              name: feedbacks[index].name,
              tims: feedbacks[index].tims,
              designation: feedbacks[index].designation,
              dept_name: feedbacks[index].dept_name,
            );
          },
        ),
      ),
    );
  }
}

class FeedbackTile extends StatelessWidget {
  final String image, name, tims, designation, dept_name;
  FeedbackTile({
    required this.image,
    required this.name,
    required this.tims,
    required this.designation,
    required this.dept_name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(image),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  Text(
                    'from $dept_name',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Text(designation),
        ],
      ),
    );
  }
}

*/