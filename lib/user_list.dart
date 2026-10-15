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
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": "1",
      "ds_name": "Panchagarh",
      "total_amount": "8125",
      "distancce": "489 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "26.3419,88.5542"
    },
    {
      "id": "2",
      "ds_name": "Cox's Bazar",
      "total_amount": "8125",
      "distancce": "391 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "21.4272,92.0058"
    },
    {
      "id": "3",
      "ds_name": "Thakurgaon",
      "total_amount": "7875",
      "distancce": "409 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "26.0339,88.4616"
    },
    {
      "id": "4",
      "ds_name": "Dinajpur",
      "total_amount": "7750",
      "distancce": "417 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.6252,88.6356"
    },
    {
      "id": "5",
      "ds_name": "Nilphamari",
      "total_amount": "7500",
      "distancce": "394 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.9314,88.8567"
    },
    {
      "id": "6",
      "ds_name": "Kurigram",
      "total_amount": "7500",
      "distancce": "327 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.8075,89.6366"
    },
    {
      "id": "7",
      "ds_name": "Lalmonirhat",
      "total_amount": "7500",
      "distancce": "332 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.9945,89.2842"
    },
    {
      "id": "8",
      "ds_name": "Khulna",
      "total_amount": "7137",
      "distancce": "266 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.8456,89.5403"
    },
    {
      "id": "9",
      "ds_name": "Rangpur",
      "total_amount": "7137",
      "distancce": "297 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.7439,89.2752"
    },
    {
      "id": "10",
      "ds_name": "Barguna",
      "total_amount": "7125",
      "distancce": "160 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.0953,90.1121"
    },
    {
      "id": "11",
      "ds_name": "Sunamganj",
      "total_amount": "7125",
      "distancce": "204 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.0667,91.3994"
    },
    {
      "id": "12",
      "ds_name": "Sylhet",
      "total_amount": "6887",
      "distancce": "239 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "24.8898,91.8698"
    },
    {
      "id": "13",
      "ds_name": "Bagerhat",
      "total_amount": "6875",
      "distancce": "190 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.6512,89.7852"
    },
    {
      "id": "14",
      "ds_name": "Satkhira",
      "total_amount": "6875",
      "distancce": "223 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.7185,89.0715"
    },
    {
      "id": "15",
      "ds_name": "Bandarban",
      "total_amount": "6875",
      "distancce": "292 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.1953,92.2188"
    },
    {
      "id": "16",
      "ds_name": "Rangamati",
      "total_amount": "6875",
      "distancce": "241 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.7324,92.2986"
    },
    {
      "id": "17",
      "ds_name": "Chittagong",
      "total_amount": "6637",
      "distancce": "242 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.3569,91.7832"
    },
    {
      "id": "18",
      "ds_name": "Barisal",
      "total_amount": "6512",
      "distancce": "140 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.701,90.3535"
    },
    {
      "id": "19",
      "ds_name": "Bhola",
      "total_amount": "6500",
      "distancce": "149 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.6859,90.6487"
    },
    {
      "id": "20",
      "ds_name": "Patuakhali",
      "total_amount": "6500",
      "distancce": "183 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "22.3596,90.3294"
    },
    {
      "id": "21",
      "ds_name": "Rajshahi",
      "total_amount": "6387",
      "distancce": "244 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "24.374,88.6011"
    },
    {
      "id": "22",
      "ds_name": "Nowabgonj",
      "total_amount": "6375",
      "distancce": "276 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "24.5965,88.2775"
    },
    {
      "id": "23",
      "ds_name": "Norail",
      "total_amount": "6375",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "24",
      "ds_name": "Perojpur",
      "total_amount": "6250",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "25",
      "ds_name": "Gaibandha",
      "total_amount": "6250",
      "distancce": "301 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.3283,89.5286"
    },
    {
      "id": "26",
      "ds_name": "Kahgrachori",
      "total_amount": "6250",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "27",
      "ds_name": "Jhalokathi",
      "total_amount": "6250",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "28",
      "ds_name": "Nogaon",
      "total_amount": "6250",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "29",
      "ds_name": "Joypurhat",
      "total_amount": "6250",
      "distancce": "276 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.1053,89.0203"
    },
    {
      "id": "30",
      "ds_name": "Kustia",
      "total_amount": "6125",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "31",
      "ds_name": "Jessore",
      "total_amount": "6125",
      "distancce": "172 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "23.1699,89.2137"
    },
    {
      "id": "32",
      "ds_name": "Meherpur",
      "total_amount": "6000",
      "distancce": "235 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "23.7622,88.6318"
    },
    {
      "id": "33",
      "ds_name": "Chuadanga",
      "total_amount": "5625",
      "distancce": "199 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "23.6409,88.8415"
    },
    {
      "id": "34",
      "ds_name": "Jhinaidah",
      "total_amount": "5500",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "35",
      "ds_name": "Moulavibazar",
      "total_amount": "5500",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "36",
      "ds_name": "Pabna",
      "total_amount": "5500",
      "distancce": "213 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "24.0104,89.2403"
    },
    {
      "id": "37",
      "ds_name": "Bogra",
      "total_amount": "5375",
      "distancce": "221 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "24.8465,89.3772"
    },
    {
      "id": "38",
      "ds_name": "Gopalgonj",
      "total_amount": "5375",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "39",
      "ds_name": "Shariatpur",
      "total_amount": "5375",
      "distancce": "33 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "23.2423,90.4347"
    },
    {
      "id": "40",
      "ds_name": "Madaripur",
      "total_amount": "5125",
      "distancce": "81 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "23.164,90.2067"
    },
    {
      "id": "41",
      "ds_name": "Natur",
      "total_amount": "5000",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "42",
      "ds_name": "Magura",
      "total_amount": "5000",
      "distancce": "157 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "23.4878,89.4196"
    },
    {
      "id": "43",
      "ds_name": "Sherpur",
      "total_amount": "5000",
      "distancce": "189 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "25.0193,90.0153"
    },
    {
      "id": "44",
      "ds_name": "Luxmipur",
      "total_amount": "5000",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "45",
      "ds_name": "Habigonj",
      "total_amount": "5000",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "46",
      "ds_name": "Noakhali",
      "total_amount": "4875",
      "distancce": "153 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "47",
      "ds_name": "Jamalpur",
      "total_amount": "4875",
      "distancce": "204 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "48",
      "ds_name": "Netrokona",
      "total_amount": "4625",
      "distancce": "203 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "49",
      "ds_name": "Chadpur",
      "total_amount": "4375",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "50",
      "ds_name": "Sirajgonj",
      "total_amount": "4375",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "51",
      "ds_name": "Feni",
      "total_amount": "4375",
      "distancce": "135 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "52",
      "ds_name": "Faridpur",
      "total_amount": "4250",
      "distancce": "102 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "53",
      "ds_name": "Kishorgonj",
      "total_amount": "4125",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "54",
      "ds_name": "Rajbari",
      "total_amount": "4000",
      "distancce": "94 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "55",
      "ds_name": "B-Baria",
      "total_amount": "3875",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "56",
      "ds_name": "Maymensingh",
      "total_amount": "3812",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "57",
      "ds_name": "Tangail",
      "total_amount": "3625",
      "distancce": "104 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "58",
      "ds_name": "Kumilla",
      "total_amount": "3625",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "59",
      "ds_name": "Manikgonj",
      "total_amount": "2875",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "60",
      "ds_name": "Narshingdi",
      "total_amount": "2875",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "61",
      "ds_name": "Munshigonj",
      "total_amount": "2875",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "62",
      "ds_name": "Narayangonj",
      "total_amount": "2875",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "63",
      "ds_name": "Gazipur",
      "total_amount": "2625",
      "distancce": "35 km",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
    },
    {
      "id": "64",
      "ds_name": "Dhaka",
      "total_amount": "2625",
      "distancce": "0",
      "image":
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/a0/70/5f/kantajew-temple-with.jpg?w=1000&h=-1&s=1",
      "locations": "0"
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
          .where((user) => user["ds_name"]
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
                                        title: Text('Districe Name: ' +
                                                _foundUsers[index]['ds_name'] ??
                                            ''),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text('Total Amount(TA+DA): ' +
                                                    _foundUsers[index]
                                                        ['total_amount'] ??
                                                ''),
                                            SizedBox(
                                                height: 10), // add some spacing
                                            Text('Distance From Dhaka: ' +
                                                    _foundUsers[index]
                                                        ['distancce'] ??
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
                                          _foundUsers[index]['image']),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    title: Text(_foundUsers[index]['ds_name']),
                                    subtitle: Text(
                                        '${_foundUsers[index]["total_amount"]}'),
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
