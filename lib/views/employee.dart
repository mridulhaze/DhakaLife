import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:io';

class employeeList extends StatefulWidget {
  const employeeList({super.key});

  @override
  State<employeeList> createState() => _employeeListState();
}

class _employeeListState extends State<employeeList>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "PF": "2416",
      "ENAME": "Md. Abdur Rahim",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2411",
      "Mobile_no": "+8801820048016",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2423",
      "ENAME": "Ayesha Siddika Ima",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2402",
      "Mobile_no": "+8801745528986",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2428",
      "ENAME": "Miskat Fouzia Afrin",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2425",
      "Mobile_no": "+8801714581096",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2431",
      "ENAME": "Kazi Fadia Iqbal",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "0",
      "Mobile_no": "+8801676051053",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2433",
      "ENAME": "Sitesh Kumar Saha",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2436",
      "Mobile_no": "+8801676233246",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "2435",
      "ENAME": "Md. Nazmul Kownine",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2414",
      "Mobile_no": "+8801743606707",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2440",
      "ENAME": "Sheikh Jadida Mehedin",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "0",
      "Mobile_no": "+8801913518827",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2445",
      "ENAME": "Mitara Zaman",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2426",
      "Mobile_no": "+8801725985149",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2450",
      "ENAME": "Muzammel Houqe",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "0",
      "Mobile_no": "+8801928292030",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2452",
      "ENAME": "Md Wahidujjaman",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2398",
      "Mobile_no": "+88 01734016973",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2455",
      "ENAME": "Fahmida Sultana",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2405",
      "Mobile_no": "+8801736590560",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2456",
      "ENAME": " Sinthia Afrin",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2407",
      "Mobile_no": "+8801677189423",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2458",
      "ENAME": "Miss. Parula Khatun",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2399",
      "Mobile_no": "+8801737950470",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2459",
      "ENAME": "Keya Pervin",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2396",
      "Mobile_no": "+8801309352399",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2467",
      "ENAME": " Shanta Akther Sheema",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "2434",
      "Mobile_no": "+8801796625945",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2478",
      "ENAME": "Md. Harun-Ar-Rashid",
      "Designation": "Section Officer",
      "DEPT_NAME": "NOT YET",
      "ID": "0",
      "Mobile_no": "+8801826008088",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2375",
      "ENAME": "Professor Dr. Md.  Mashiur Rahman",
      "Designation": "Vice Chancellor",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+8801741 288844",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "424",
      "ENAME": "Ali Ahmed Biswas",
      "Designation": "Section Officer",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0339",
      "Mobile_no": "+8801783259771",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "306",
      "ENAME": "Shahanur Begum",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "637",
      "ENAME": "Md. Shazahan Ali-4250",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2142",
      "ENAME": "Prodip Chandra Malaker",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "2107",
      "Mobile_no": "+8801913521306",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2229",
      "ENAME": "Md. Hasanuzzaman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2258",
      "ENAME": "Md. Bahalul",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "2242",
      "Mobile_no": "+8801923510537",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "15",
      "ENAME": "Md. Nazmul Haque",
      "Designation": "Guard",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "464",
      "ENAME": "Md. Abdul Hakim",
      "Designation": "Guard",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "353",
      "ENAME": "Md. Abdus Sattar",
      "Designation": "Deputy Registrar & Secretary",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+8801777789050 01922039",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "357",
      "ENAME": "Md. Mostafizur Rahman",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+8801706 543702",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "557",
      "ENAME": "Muhammad Amirul Islam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0218",
      "Mobile_no": "+8801940603885",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1971",
      "ENAME": "Noor-E-Alam Apu",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2391",
      "ENAME": "A.T.M. KHAIRUL HUDA",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "2370",
      "Mobile_no": "+8801715028811",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "639",
      "ENAME": "Tofazzal Hossin Sworkar",
      "Designation": "Cleaner",
      "DEPT_NAME": "Vice Chancellor Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2503",
      "ENAME": "Professor Abdus Salam Howlader",
      "Designation": "Treasurer",
      "DEPT_NAME": "Treasurer Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2048",
      "ENAME": "Md. Nazmul Haque",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Treasurer Office",
      "ID": "2006",
      "Mobile_no": "+8801762123425",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "116",
      "ENAME": "Sushil Kumar Biswas",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Treasurer Office",
      "ID": "214",
      "Mobile_no": "+8801712 944 775",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2196",
      "ENAME": "Md. Abu Taher",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Treasurer Office",
      "ID": "2118",
      "Mobile_no": "+8801742 030583",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "419",
      "ENAME": "Md. Abdullahel Bakhi Khan",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Treasurer Office",
      "ID": "0390",
      "Mobile_no": "+8801712 122989",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2454",
      "ENAME": "S K Nazmin Ara",
      "Designation": "Section Officer",
      "DEPT_NAME": "Transport",
      "ID": "2416",
      "Mobile_no": "+8801715130310",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2483",
      "ENAME": "Faria Tabassum",
      "Designation": "Section Officer",
      "DEPT_NAME": "Transport",
      "ID": "2444",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2399",
      "ENAME": "Md. Roman Sarder",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "2380",
      "Mobile_no": "+8801676767931",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2400",
      "ENAME": "Md. Hemayet Hossen",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2401",
      "ENAME": "Md. Khairul",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2402",
      "ENAME": "Md. Wahed Ali",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2403",
      "ENAME": "Md. Masud Mia",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2405",
      "ENAME": "Md. Sahjahan",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2406",
      "ENAME": "Shridhar Roy",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2407",
      "ENAME": "Md. Anwarul Islam Ani",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2408",
      "ENAME": "Md. Kamruzzaman Merdha",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "2379",
      "Mobile_no": "+8801712553073",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2409",
      "ENAME": "Md. Mainuddin Patuwary",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2410",
      "ENAME": "Md. Arif Hossain Sumon",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "2375",
      "Mobile_no": "+8801719042241",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2412",
      "ENAME": "Md. Sumon",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2413",
      "ENAME": "Md. Razu Ahammed",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "2365",
      "Mobile_no": "+8801759156433",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2414",
      "ENAME": "Md. Rashed Islam",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2415",
      "ENAME": "Abu Hossain Ali",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "2377",
      "Mobile_no": "+8801736383461",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2526",
      "ENAME": "Md. Julhas",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2527",
      "ENAME": "Md. Faruk",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2528",
      "ENAME": "Abdur Rahim",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2529",
      "ENAME": "Shahin Alam",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2530",
      "ENAME": "Md. Razzak Hossain Raju",
      "Designation": "Driver",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "295",
      "ENAME": "Mesbah Uddin",
      "Designation": "Director",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+8801710 883878",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "118",
      "ENAME": " Alauddin Ahmed",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Transport",
      "ID": "292",
      "Mobile_no": "+8801534571000",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "227",
      "ENAME": "Md. Bazlur Rahman",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+8801716942405",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "232",
      "ENAME": "Abu Saleh M.A. Gafur",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+8801735999599",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "404",
      "ENAME": "Md. Abdur Rauf Talukder",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+8801720381606",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "679",
      "ENAME": "Md. Abul Kalam Azad",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+8801613484072",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1835",
      "ENAME": "Khondakar Md. Abdur Rahman",
      "Designation": "Asst. Engineer",
      "DEPT_NAME": "Transport",
      "ID": "1851",
      "Mobile_no": "+8801511703722",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "444",
      "ENAME": "Md. Abdur Rahim",
      "Designation": "Assistant Registrar (Computer)",
      "DEPT_NAME": "Transport",
      "ID": "0447",
      "Mobile_no": "+8801625626726",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "21",
      "ENAME": "Md. Akhtar Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Transport",
      "ID": "0245",
      "Mobile_no": "+8801716521104",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "114",
      "ENAME": "Md. Rafiqul Islam(1)",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+8801724474000",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "214",
      "ENAME": "Md. Mosfiqur Rahman",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Transport",
      "ID": "0",
      "Mobile_no": "+8801716579070",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2472",
      "ENAME": "AKHLIMA BEGUM",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Training",
      "ID": "2433",
      "Mobile_no": "+8801768761058",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2420",
      "ENAME": "Amina Nasrin",
      "Designation": "Section Officer",
      "DEPT_NAME": "Training",
      "ID": "2437",
      "Mobile_no": "+8801778266500",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2441",
      "ENAME": "Md. Ashaduzzaman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Training",
      "ID": "0",
      "Mobile_no": "+8801724329451",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "364",
      "ENAME": "Mst. Salma Parvin",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Training",
      "ID": "0",
      "Mobile_no": "+8801711987255",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "410",
      "ENAME": "Md. Matiur Rahman Mollha",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Training",
      "ID": "0",
      "Mobile_no": "+8801717403345",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "555",
      "ENAME": "Khandoker Mamun Afser",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Training",
      "ID": "0392",
      "Mobile_no": "+8801531321624",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "208",
      "ENAME": "Mohammad Ariful Azim",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Training",
      "ID": "086",
      "Mobile_no": "+8801732875672",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "498",
      "ENAME": "S.M. Sarwar Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Training",
      "ID": "0256",
      "Mobile_no": "+8801711581453",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "504",
      "ENAME": "Md. Asadul Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Training",
      "ID": "0555",
      "Mobile_no": "+8801712028474",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "660",
      "ENAME": "A.T.M. Zillur Rahman Talukder",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Training",
      "ID": "0367",
      "Mobile_no": "+8801711-070149",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "307",
      "ENAME": "Md. Helal Uddin",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Sylhet Regional Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2271",
      "ENAME": "Md. Touhid Bin Usuf",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Sylhet Regional Office",
      "ID": "2228",
      "Mobile_no": "+8801718541253",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1994",
      "ENAME": "Dr. Md. Golam Rabbani",
      "Designation": "Director",
      "DEPT_NAME": "Sylhet Regional Office",
      "ID": "1978",
      "Mobile_no": "+8801732804595",
      "Blood_Group": "A-",
      "image": "www.google.com"
    },
    {
      "PF": "60",
      "ENAME": "Md. Ashrafuzzaman",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Sylhet Regional Office",
      "ID": "268",
      "Mobile_no": "+8801711951245",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2022",
      "ENAME": "Md. Abdul Khalique",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Sylhet Regional Office",
      "ID": "2162",
      "Mobile_no": "+8801712129622",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1754",
      "ENAME": "Md. Ibrahim Khalil",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Sylhet Regional Office",
      "ID": "1743",
      "Mobile_no": "+8801712810670",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1854",
      "ENAME": "Salauddin Mohammad Forhad",
      "Designation": "Lecturer",
      "DEPT_NAME": "Social Science Group",
      "ID": "1848",
      "Mobile_no": "+8801914420634",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1983",
      "ENAME": "Umme Gouse Kaniz Laila",
      "Designation": "Lecturer",
      "DEPT_NAME": "Social Science Group",
      "ID": "1960",
      "Mobile_no": "+8801748936145",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1985",
      "ENAME": "Hamida Begum",
      "Designation": "Lecturer",
      "DEPT_NAME": "Social Science Group",
      "ID": "1961",
      "Mobile_no": "+8801715727531",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2275",
      "ENAME": "Sabrina Aktar",
      "Designation": "Lecturer",
      "DEPT_NAME": "Social Science Group",
      "ID": "2214",
      "Mobile_no": "+8801712626584",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2276",
      "ENAME": "A. K. M Shadika Jahan Shathi",
      "Designation": "Lecturer",
      "DEPT_NAME": "Social Science Group",
      "ID": "2213",
      "Mobile_no": "+8801761491036",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2290",
      "ENAME": "Anita Helen",
      "Designation": "Lecturer",
      "DEPT_NAME": "Social Science Group",
      "ID": "2238",
      "Mobile_no": "+8801717646009",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2533",
      "ENAME": "Md. Khalid Hasan",
      "Designation": "Lecturer",
      "DEPT_NAME": "Social Science Group",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1794",
      "ENAME": "Dr. Md. Aoulad Hosen",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Social Science Group",
      "ID": "1800",
      "Mobile_no": "+8801752565354",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1812",
      "ENAME": "Kazi Aysha Siddiqua",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Social Science Group",
      "ID": "0",
      "Mobile_no": "+8801716773812",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1821",
      "ENAME": "Dr. Nurun Nahar Dilruba",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Social Science Group",
      "ID": "1818",
      "Mobile_no": "+8801726311031",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1829",
      "ENAME": "Dr. Shahida Taher",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Social Science Group",
      "ID": "1815",
      "Mobile_no": "+8801927-415437",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1547",
      "ENAME": "Dr. Md. Nurul Momen Bhuiyan",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Social Science Group",
      "ID": "1836",
      "Mobile_no": "+8801727283325",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1781",
      "ENAME": "Dr. Md. Abdur Rashid Siddiquee",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Social Science Group",
      "ID": "1788",
      "Mobile_no": "+8801718751629",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1810",
      "ENAME": "Murshid Al Hasan",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Social Science Group",
      "ID": "1830",
      "Mobile_no": "+8801714209354",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "191",
      "ENAME": "Md. Tariqul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "380",
      "Mobile_no": "+8801976985016",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "430",
      "ENAME": "Md. Shohidul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0244",
      "Mobile_no": "+8801711187435",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "440",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0394",
      "Mobile_no": "+8801740170096",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "636",
      "ENAME": "Md. Abdul Hakim",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "690",
      "ENAME": "Habibur Rahman",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "095",
      "Mobile_no": "+8801745345313",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2055",
      "ENAME": "Mahamuda Khanam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2055",
      "Mobile_no": "+8801916603851",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2060",
      "ENAME": "Afroza Akter",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2061",
      "ENAME": "Md. Lutful Kabir Khan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2065",
      "ENAME": "Hanufa Begum Keka",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2070",
      "ENAME": "Jahirul Islam Khan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2063",
      "Mobile_no": "+8801911897955",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2074",
      "ENAME": "Md. Rakibe Hasan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2078",
      "ENAME": "Imran Mahmood",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2041",
      "Mobile_no": "+8801715155235",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2079",
      "ENAME": "Afroza Khandoker",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2084",
      "ENAME": "Samim Ahamed",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2093",
      "ENAME": "MST. Dulaly Khatun",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2096",
      "ENAME": "Popi Rani Mondol",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2032",
      "Mobile_no": "+8801722278492",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2102",
      "ENAME": "Md. Amirul Islam Sarkar",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2111",
      "ENAME": "Md. Jasim Uddin",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2070",
      "Mobile_no": "+8801626565697",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2112",
      "ENAME": "Md. Afsar Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2080",
      "Mobile_no": "+8801712681040",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2114",
      "ENAME": "Mst. Amina Khatun",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2058",
      "Mobile_no": "+88???????????",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2294",
      "ENAME": "Md. Mahmudul Hasan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2332",
      "Mobile_no": "+8801949239316",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2296",
      "ENAME": "Mst. Aysha Siddika",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2297",
      "ENAME": "Sima Akter",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2259",
      "Mobile_no": "+8801725449344",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2298",
      "ENAME": "Shima Rani Bormon",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2255",
      "Mobile_no": "+8801670786428",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2299",
      "ENAME": "Md. Asadullah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2300",
      "ENAME": "Md. Kamal Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2303",
      "ENAME": "Md. Moslem Uddin",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2312",
      "Mobile_no": "+8801782439100",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2304",
      "ENAME": "Mohammad Akramul Hoque",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2269",
      "Mobile_no": "+8801642458081",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2306",
      "ENAME": "Jharna Rani Bala",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2301",
      "Mobile_no": "+8801756778385",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2307",
      "ENAME": "Md. Ahedujjaman Muzumder",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2258",
      "Mobile_no": "+8801749083535",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2308",
      "ENAME": "Md. Azmat Ali",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2310",
      "ENAME": "Miss. Rima Khatun",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2312",
      "ENAME": "Md. Jamal Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2260",
      "Mobile_no": "+8801725759403",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2313",
      "ENAME": "Md. Mominul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2295",
      "Mobile_no": "+8801923562223",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2314",
      "ENAME": "Tanni Sultana",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2254",
      "Mobile_no": "+8801914441997",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2315",
      "ENAME": "Roni Mridha",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2325",
      "Mobile_no": "+8801743518015",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2316",
      "ENAME": "Md. Biplob",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2300",
      "Mobile_no": "+8801723044239",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2317",
      "ENAME": "Salina Akter",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2281",
      "Mobile_no": "+8801552332020",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2318",
      "ENAME": "Subrata Dewan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2319",
      "ENAME": "Md. Humayun Kabir Sarkar",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2273",
      "Mobile_no": "+8801915357503",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2320",
      "ENAME": "Md. Juel Akanda",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2257",
      "Mobile_no": "+8801712936751",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2323",
      "ENAME": "Md. Nasim Haidar",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2328",
      "ENAME": "Jubaraj Chandra Bhowmik",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2284",
      "Mobile_no": "+8801731321776",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2329",
      "ENAME": "Nikar Chandra Gain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2299",
      "Mobile_no": "+8801755954666",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2330",
      "ENAME": "Shahin Miah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2280",
      "Mobile_no": "+8801710235168",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2331",
      "ENAME": "Swapan Chakma",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2330",
      "Mobile_no": "+8801849899341",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2332",
      "ENAME": "Md. Sharif Miah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2333",
      "ENAME": "Md. Siddique Miah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2270",
      "Mobile_no": "+8801630279846",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2334",
      "ENAME": "Nadira Sultana",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2305",
      "Mobile_no": "+8801766523518",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2335",
      "ENAME": "Morshid Alam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2337",
      "ENAME": "A. M. Monwar Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2292",
      "Mobile_no": "+8801742122557",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2339",
      "ENAME": "Fazlul Haque",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2310",
      "Mobile_no": "+8801723430932",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2340",
      "ENAME": "Md. Shekh Kamal",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2341",
      "ENAME": "S. K. V. Joydev",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2324",
      "Mobile_no": "+8801731541566",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2344",
      "ENAME": "Mohammad Zakir Hossen",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2263",
      "Mobile_no": "+8801926108663",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2345",
      "ENAME": "Md. Jasim Uddin",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2313",
      "Mobile_no": "+8801734627565",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2346",
      "ENAME": "Md. Shahdat Hossin",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2303",
      "Mobile_no": "+8801829602867",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2347",
      "ENAME": "Popy Rani Roy",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801627323666",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2348",
      "ENAME": "Md. Rasel Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2290",
      "Mobile_no": "+8801715354336",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2349",
      "ENAME": "Ali Riyad",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2333",
      "Mobile_no": "+8801719264196",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2350",
      "ENAME": "Most. Karima Khatun",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2264",
      "Mobile_no": "+8801981705669",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2355",
      "ENAME": "Mohuya Rani",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2356",
      "ENAME": "Md. Shohel Miah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2311",
      "Mobile_no": "+8801724833706",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2357",
      "ENAME": "Manik Chandra Roy",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2317",
      "Mobile_no": "+8801723889907",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2358",
      "ENAME": "Md. Feroj Miah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2359",
      "ENAME": "Dilruba Yesmin",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2302",
      "Mobile_no": "+8801712006196",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2360",
      "ENAME": "Sabiha Sultana",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2361",
      "ENAME": "Md. Azizul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2365",
      "ENAME": "M. A Rakib",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2343",
      "Mobile_no": "+8801716012276",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2366",
      "ENAME": "Mohammad Momen Miah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801838423411",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2367",
      "ENAME": "Kabel Sikder\r\n",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2389",
      "Mobile_no": "+8801774882152",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2368",
      "ENAME": "Sabiha Akter",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2390",
      "Mobile_no": "+8801619707071",
      "Blood_Group": "O-",
      "image": "www.google.com"
    },
    {
      "PF": "2371",
      "ENAME": "Md. Ahsan Habib\r\n",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2339",
      "Mobile_no": "+8801753525115",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2374",
      "ENAME": "Kamruzzaman \r\n",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2391",
      "Mobile_no": "+8801719029801",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2473",
      "ENAME": "MEHEDI HASAN",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "2422",
      "Mobile_no": "+8801725290527",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2502",
      "ENAME": "Faruk Patowary",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "646",
      "ENAME": "Asma Akhter",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801716394346",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1933",
      "ENAME": "Razia Sultana",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "1907",
      "Mobile_no": "+8801624432969",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1936",
      "ENAME": "Md. Shahnoor Alam",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "1911",
      "Mobile_no": "+8801930328565",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1937",
      "ENAME": "Kazi Kutub Uddin",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "1910",
      "Mobile_no": "+8801736588034",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1928",
      "ENAME": "Md. Afanur Rahman",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "1939",
      "Mobile_no": "+8801961070887",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2386",
      "ENAME": "Md. Delowar Hossain",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2347",
      "Mobile_no": "+8801787449469",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2464",
      "ENAME": "Prabir Kumar Mondal",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2420",
      "Mobile_no": "+8801745186096",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2523",
      "ENAME": "Monir Ahammad",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "342",
      "ENAME": "Mohammed Mojibur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0388",
      "Mobile_no": "+8801717714701",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "502",
      "ENAME": "Khondokar Md. Ruhul Amin",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801715577289",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "531",
      "ENAME": "Md. Shamcul Alam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0023",
      "Mobile_no": "+8801920201649",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "689",
      "ENAME": "Md. Abdus Salam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0024",
      "Mobile_no": "+8801716602809",
      "Blood_Group": "O-",
      "image": "www.google.com"
    },
    {
      "PF": "1870",
      "ENAME": "Md. Hafizur Rahman Mollah",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "1867",
      "Mobile_no": "+8801718-136404",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2066",
      "ENAME": "Rehena Hassan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2018",
      "Mobile_no": "+8801711123547",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2068",
      "ENAME": "Kamruzzaman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2071",
      "ENAME": "Md. Arshad Mia",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2014",
      "Mobile_no": "+8801743549355",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2075",
      "ENAME": "Jatish Chandra Das",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2025",
      "Mobile_no": "+8801718664719",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2081",
      "ENAME": "Md. Altab Hossain",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2054",
      "Mobile_no": "+8801724902335",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2092",
      "ENAME": "Zemini Siddique",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2222",
      "Mobile_no": "+8801918153871",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2095",
      "ENAME": "Abu Naphy Md. Arshad Ali",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2020",
      "Mobile_no": "+8801920084810",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2098",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2045",
      "Mobile_no": "+8801871340014",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2101",
      "ENAME": "Khalid Hasan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2016",
      "Mobile_no": "+8801685173913",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2107",
      "ENAME": "Md. Mukhlesur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2033",
      "Mobile_no": "+8801911582366",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2108",
      "ENAME": "Mohammad Tufazzal Hossan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2019",
      "Mobile_no": "+8801718598892",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2115",
      "ENAME": "Md. Meherajul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2052",
      "Mobile_no": "+8801617150100",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2118",
      "ENAME": "Md.Ahsan Habib",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2069",
      "Mobile_no": "+8801628110000",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2119",
      "ENAME": "Md. Humayun Kabir",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2059",
      "Mobile_no": "+8801644916608",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2122",
      "ENAME": "Abul Kashem",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2055",
      "Mobile_no": "+8801739765629",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2129",
      "ENAME": "Arjina Sultana",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801711310497",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2422",
      "ENAME": "Sawkat Ara Pinki",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801778398668",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2424",
      "ENAME": "Al Mamun Ahmed",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2404",
      "Mobile_no": "+88017111115234",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2439",
      "ENAME": "Md. Jahangir Alam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2424",
      "Mobile_no": "+8801737307409",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2447",
      "ENAME": "Shafayet Ahmmad",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801766307442",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2468",
      "ENAME": "Sunzida Sultana",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2442",
      "Mobile_no": "+8801673037400",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2482",
      "ENAME": "Nuzhat najua",
      "Designation": "Section Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2440",
      "Mobile_no": "+8801791663339",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "303",
      "ENAME": "Molla Mahfuz Al-Hossain",
      "Designation": "Register ",
      "DEPT_NAME": "Registrar Office",
      "ID": "0293",
      "Mobile_no": "+8801711889969",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2231",
      "ENAME": "Sumun Hossen",
      "Designation": "Plambar",
      "DEPT_NAME": "Registrar Office",
      "ID": "2150",
      "Mobile_no": "+8801716706188",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2136",
      "ENAME": "Md. Shahidul Islam",
      "Designation": "Photocopy Operator",
      "DEPT_NAME": "Registrar Office",
      "ID": "2181",
      "Mobile_no": "+8801730655221",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "239",
      "ENAME": "Md. Alomgir Hossain (2)",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "686",
      "ENAME": "Ruhul Amin",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Registrar Office",
      "ID": "131",
      "Mobile_no": "+8801721655675",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2327",
      "ENAME": "Al-amin",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2336",
      "ENAME": "Muslima Akter",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Registrar Office",
      "ID": "2267",
      "Mobile_no": "+88",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2352",
      "ENAME": "Animesh Biswas",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Registrar Office",
      "ID": "2282",
      "Mobile_no": "+8801714816663",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2372",
      "ENAME": "Md. Jahangir Alam",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Registrar Office",
      "ID": "2341",
      "Mobile_no": "+8801916994137",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2279",
      "ENAME": "Md. Sohel",
      "Designation": "Mali",
      "DEPT_NAME": "Registrar Office",
      "ID": "2208",
      "Mobile_no": "+8801850117543",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2280",
      "ENAME": "Md. Najmul Sakib",
      "Designation": "Mali",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2281",
      "ENAME": "Md. Khokon Shikder",
      "Designation": "Mali",
      "DEPT_NAME": "Registrar Office",
      "ID": "2215",
      "Mobile_no": "+8801745477713",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "185",
      "ENAME": "Md. Anowar Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "429",
      "ENAME": "Md. Mojaffor Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "507",
      "ENAME": "Md. Jashim Uddin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "509",
      "ENAME": "Md. Maksud Mia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "513",
      "ENAME": "Md. Abul Hasam Sepiy",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "516",
      "ENAME": "Md. Jahangir Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "533",
      "ENAME": "Md. Mostafa Kamal",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "582",
      "Mobile_no": "+8801630475322",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "687",
      "ENAME": "Md. Zahangir Gazi",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "485",
      "Mobile_no": "+8801766507744",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2140",
      "ENAME": "Md. Alamgir Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2141",
      "ENAME": "Md. Munhid",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2116",
      "Mobile_no": "+8801715462554",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2144",
      "ENAME": "Md. Bablu Mia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2125",
      "Mobile_no": "+8801918950233",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2145",
      "ENAME": "Shamim Bhuain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2146",
      "ENAME": "Md. Nurul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2100",
      "Mobile_no": "+8801785585590",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "2147",
      "ENAME": "Md. Alamgir Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2127",
      "Mobile_no": "+8801911586136",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2148",
      "ENAME": "Md. Amirul Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2149",
      "ENAME": "Md. Hasan",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2189",
      "Mobile_no": "+8801848076130",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2150",
      "ENAME": "Nazrul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2151",
      "ENAME": "Md. Amdad Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2152",
      "ENAME": "Md. Owas Kuruni",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2153",
      "ENAME": "Md. Mamunur Rashid",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2156",
      "ENAME": "Md. Shahidul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2187",
      "Mobile_no": "+8801677933188",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2157",
      "ENAME": "Md. Monirul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2193",
      "Mobile_no": "+8801855645641",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2158",
      "ENAME": "Md. Juwel Sikder",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2159",
      "ENAME": "Md. Rais Fakir",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2319",
      "Mobile_no": "+8801714715061",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2160",
      "ENAME": "Md. Delwar Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2160",
      "Mobile_no": "+8801745843981",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2161",
      "ENAME": "Md. Jonal Abedin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2099",
      "Mobile_no": "+8801778689854",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2163",
      "ENAME": "Md. Johirul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88???????????",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2164",
      "ENAME": "Anamul Haque",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2165",
      "ENAME": "Most. Marufa Akter",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2149",
      "Mobile_no": "+8801724371970",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2166",
      "ENAME": "Md. Mojahedul Islam Dlowar",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2168",
      "ENAME": "Md. Ali Newaz (Raju)",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2106",
      "Mobile_no": "+8801760284604",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2169",
      "ENAME": "Md. Akramul Hoque",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2170",
      "ENAME": "Md. Jonab Alli",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2164",
      "Mobile_no": "+8801726586130",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2171",
      "ENAME": "Mosst. Nulufa Begum",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2172",
      "ENAME": "Md. Rabiul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2119",
      "Mobile_no": "+8801716985016",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2173",
      "ENAME": "Robel Hossen",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2174",
      "ENAME": "Md.Sha-alam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2205",
      "Mobile_no": "+8801994049803",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2175",
      "ENAME": "Md. Forhad Molla",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2184",
      "Mobile_no": "+8801923496243",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2176",
      "ENAME": "Md. Norul Karim (Masud)",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2172",
      "Mobile_no": "+8801856305304",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2177",
      "ENAME": "Md. Forhad Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2155",
      "Mobile_no": "+8801621695054",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2178",
      "ENAME": "Mohammad Hadiul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2221",
      "Mobile_no": "+8801705022425",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2180",
      "ENAME": "Md. Akterruzzaman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2223",
      "Mobile_no": "+8801738225367",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2183",
      "ENAME": "Md.Billal Hosin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2199",
      "Mobile_no": "+8801718952030",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2186",
      "ENAME": "Zakaria Sarker",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2187",
      "ENAME": "Md. Sekender Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2175",
      "Mobile_no": "+8801716577376",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2188",
      "ENAME": "Mst. Jasmin Nahar",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2189",
      "ENAME": "Nasrin Akter",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2183",
      "Mobile_no": "+8801608322300",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2190",
      "ENAME": "Md. Salah Uddin Miah",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2277",
      "Mobile_no": "+8801710499053",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2191",
      "ENAME": "Md. Abdul Motin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2225",
      "Mobile_no": "+8801671063954",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2192",
      "ENAME": "Md. Nurul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2131",
      "Mobile_no": "+8801734517420",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2193",
      "ENAME": "Putul Rani Das",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2195",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2232",
      "Mobile_no": "+8801710883828",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2198",
      "ENAME": "Kamrul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2095",
      "Mobile_no": "+8801743 644071",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2199",
      "ENAME": "Md. Emam Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2129",
      "Mobile_no": "+8801714676847",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2200",
      "ENAME": "Hasan Ali Shorif",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2157",
      "Mobile_no": "+8801724835992",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2201",
      "ENAME": "Md. Shofikul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2203",
      "ENAME": "Md. Murad Hossen",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2194",
      "Mobile_no": "+8801718194316",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2204",
      "ENAME": "Md. Pasha Mia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2205",
      "ENAME": "Md. Zakaria Sheikh",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2206",
      "ENAME": "Md. Aftab Uddin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2207",
      "ENAME": "Md. Hasan Mia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2113",
      "Mobile_no": "+8801617269586",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2208",
      "ENAME": "Anjali Rani Shil",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2209",
      "ENAME": "Md.Jasim Uddin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2210",
      "ENAME": "Jahanara Begum",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2213",
      "ENAME": "Sufal Sarker",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801922778513",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2214",
      "ENAME": "Md. Mojibur Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2173",
      "Mobile_no": "+8801715473137",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2215",
      "ENAME": "Sumi Debi Cetry",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2217",
      "ENAME": "Md. Abdus Salam Chowdhury",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2128",
      "Mobile_no": "+8801815036629",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2218",
      "ENAME": "Nur Mohammad",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2220",
      "ENAME": "Shah Jahan Miah",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2222",
      "ENAME": "Salam Khan",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2223",
      "ENAME": "Md. Ruhul Amin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2133",
      "Mobile_no": "+8801858142078",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2224",
      "ENAME": "Md. Ripon Miah",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2228",
      "ENAME": "Md. Abdur Rouf",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2147",
      "Mobile_no": "+8801913421254",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2230",
      "ENAME": "Ariful Islam didar",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2141",
      "Mobile_no": "+8801720208598",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2232",
      "ENAME": "Rezaul Karim",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2233",
      "ENAME": "Amirul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2176",
      "Mobile_no": "+8801713518018",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2235",
      "ENAME": "Md. Alauddin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2178",
      "Mobile_no": "+8801920274496",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2236",
      "ENAME": "Md. Rasel Mia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2296",
      "Mobile_no": "+8801322278420",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2238",
      "ENAME": "Ujjal Mollah",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2192",
      "Mobile_no": "+8801400933856",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2239",
      "ENAME": "Sheikh Akram",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2138",
      "Mobile_no": "+8801914937568",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2241",
      "ENAME": "Md.Kabir Hossen",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2242",
      "ENAME": "Md. Saiful Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2245",
      "ENAME": "Umme Salma",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2139",
      "Mobile_no": "+8801628047948",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2248",
      "ENAME": "Md. Monirul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2109",
      "Mobile_no": "+8801919871060",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2250",
      "ENAME": "Md. Mostofa Jaman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2142",
      "Mobile_no": "+8801733012529",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2251",
      "ENAME": "Md. Mostakim Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2253",
      "ENAME": "Md. Papon Mia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2153",
      "Mobile_no": "+8801799148377",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2254",
      "ENAME": "Md. Nurul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2185",
      "Mobile_no": "+8801623330225",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2255",
      "ENAME": "Md. Shohidul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2167",
      "Mobile_no": "+8801754594487",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2257",
      "ENAME": "Md. Shahin Alam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2259",
      "ENAME": "Md. Shaokot Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2209",
      "Mobile_no": "+8801780-801788",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2260",
      "ENAME": "Md. Waziullah",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2114",
      "Mobile_no": "+8801771309428",
      "Blood_Group": "AB-",
      "image": "www.google.com"
    },
    {
      "PF": "2261",
      "ENAME": "Md. Mahedi Hasan",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2262",
      "ENAME": "Md. Shahid Ullah",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2263",
      "ENAME": "Jahanara Akter",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2264",
      "ENAME": "Padma Pall",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2266",
      "ENAME": "Litan Dhali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801752641778",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2269",
      "ENAME": "Mohammad Motiur Rahman Moti",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2270",
      "ENAME": "Md. Habibur Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2272",
      "ENAME": "Syed Mohammad Millad Bin Yusuf",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Registrar Office",
      "ID": "2275",
      "Mobile_no": "+8801734205586",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2462",
      "ENAME": "Fatema Afroze Piya",
      "Designation": "Lecturer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2428",
      "Mobile_no": "+8801871199606",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2465",
      "ENAME": "Abu Bokkar Siddik",
      "Designation": "Khadem",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801765044488",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2268",
      "ENAME": "Shahin Dewan",
      "Designation": "Electrician",
      "DEPT_NAME": "Registrar Office",
      "ID": "2211",
      "Mobile_no": "+8801880221813",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "42",
      "ENAME": "Md. Waliullah",
      "Designation": "Dispatch Rider",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "70",
      "ENAME": "Md. Shahin Akter",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801716450202",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "422",
      "ENAME": "Nadira Begum",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0171",
      "Mobile_no": "+8801625330056",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "549",
      "ENAME": "Hashmin Aktar",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0606",
      "Mobile_no": "+8801912359921",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "550",
      "ENAME": "Milon Kumar Karmokar",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "523",
      "Mobile_no": "+8801711978767",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2000",
      "ENAME": "Md. Showkat Alam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "2268",
      "Mobile_no": "+8801929311382",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "327",
      "ENAME": "Mohammad Ali Asgar Khan Saberi",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801711235317",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "439",
      "ENAME": "Md. Anwar Hossain",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Registrar Office",
      "ID": "189",
      "Mobile_no": "+8801710694396",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "591",
      "ENAME": "Mohammad Iqbal Hossain",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Registrar Office",
      "ID": "0036",
      "Mobile_no": "+8801719553624",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "597",
      "ENAME": "Ratan Kumar Saha",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Registrar Office",
      "ID": "213",
      "Mobile_no": "+8801711939173",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "676",
      "ENAME": "Salim Hossain Molla",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Registrar Office",
      "ID": "0521",
      "Mobile_no": "+8801712224597",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "203",
      "ENAME": "Md. Khorshed Alam",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "354",
      "Mobile_no": "+8801776496802",
      "Blood_Group": "A-",
      "image": "www.google.com"
    },
    {
      "PF": "269",
      "ENAME": "Babul Hossain-Eb",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "647",
      "Mobile_no": "+8801774718419",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "532",
      "ENAME": "Md. Habib Eb",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "672",
      "Mobile_no": "+8801961811599",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "536",
      "ENAME": "Md. Shahazalal Eb",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0325",
      "Mobile_no": "+8801787029260",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "537",
      "ENAME": "Saheda Begum",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0288",
      "Mobile_no": "+8801625013274",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "538",
      "ENAME": "Md. Amzad Hossain",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0184",
      "Mobile_no": "+8801954618677",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "539",
      "ENAME": "Md. Mofiz Uddin",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0191",
      "Mobile_no": "+8801726708272",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "540",
      "ENAME": "Md. Mojibur Rahman",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "196",
      "Mobile_no": "+8801918056100",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "541",
      "ENAME": "Md. Abdul Khalek Khan",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0237",
      "Mobile_no": "+8801920781177",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "638",
      "ENAME": "Zhantu Dhalee",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "116",
      "Mobile_no": "+8801989686313",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "693",
      "ENAME": "Md. Nur Alam",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0597",
      "Mobile_no": "+8801716333064",
      "Blood_Group": "A-",
      "image": "www.google.com"
    },
    {
      "PF": "2504",
      "ENAME": "Md. Sohel Rana",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2505",
      "ENAME": "Shree Deepok",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2506",
      "ENAME": "Subrata Chandra Das",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2507",
      "ENAME": "Md. Abdul Mumin Chowdhury",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2508",
      "ENAME": "Md Kamal Hossain",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2509",
      "ENAME": "Souvo Basfore",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2510",
      "ENAME": "Md. Lutfor Rahman Babul",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2511",
      "ENAME": "Omar Babu Das",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2512",
      "ENAME": "Dipu",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2513",
      "ENAME": "Omor Babu",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2514",
      "ENAME": "Modhu Lal",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2515",
      "ENAME": "Muhibbullah",
      "Designation": "Cleaner",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2469",
      "ENAME": "Mrs. Hasina Parvin",
      "Designation": "BookShater",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2470",
      "ENAME": "MD. AZIZUL ISLAM",
      "Designation": "BookShater",
      "DEPT_NAME": "Registrar Office",
      "ID": "2450",
      "Mobile_no": "+8801679328854",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2474",
      "ENAME": "MD. ASLAM HOSSEN",
      "Designation": "BookShater",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "106",
      "ENAME": "Md. Sheikh Majibar Rahman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "298",
      "Mobile_no": "+8801737346260",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "143",
      "ENAME": "Md. Zulfiqure Islam",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0488",
      "Mobile_no": "+8801712762807",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "178",
      "ENAME": "Mohammad Rafiqul Islam (2)",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801718 821432",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "328",
      "ENAME": "Md. Shahadat Hossain",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0572",
      "Mobile_no": "+8801724535003",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "356",
      "ENAME": "Mohammad Ali",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "395",
      "ENAME": "Md. Nazrul Islam",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "421",
      "Mobile_no": "+8801710883828",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "490",
      "ENAME": "Md. Abdun Nur",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0061",
      "Mobile_no": "+8801825029511",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "607",
      "ENAME": "Molla Tazmilur Rahman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0146",
      "Mobile_no": "+8801673283023",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "613",
      "ENAME": "Norun Nahar",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801712443814",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "623",
      "ENAME": "Md. Shahidul Islam",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "664",
      "ENAME": "Mohammed  Foyzur Rahman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "0507",
      "Mobile_no": "+8801552441330",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2489",
      "ENAME": "MD AKLASUR RAHMAN",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "2446",
      "Mobile_no": "+8801711979307",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2493",
      "ENAME": "MD ANWAR HOSSAIN",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Registrar Office",
      "ID": "2447",
      "Mobile_no": "+8801729823532",
      "Blood_Group": "O-",
      "image": "www.google.com"
    },
    {
      "PF": "2016",
      "ENAME": "Jannatul Ferdows",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "Registrar Office",
      "ID": "1988",
      "Mobile_no": "+8801813179034",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2531",
      "ENAME": "Md. Zohurul Islam",
      "Designation": "Asst. Electrician",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2532",
      "ENAME": "Suvha Tanchangya",
      "Designation": "Asst. Electrician",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "260",
      "ENAME": "Ahammed Ali",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801712851177",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "399",
      "ENAME": "Salma Akhter",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801552339566",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2494",
      "ENAME": "Md. Ismail Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+8801717827741",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2054",
      "ENAME": "Asiv Mohammad",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2187",
      "Mobile_no": "+8801760761656",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2058",
      "ENAME": "Shampa Akter",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2053",
      "Mobile_no": "+8801686930017",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2059",
      "ENAME": "Salma Akter",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2083",
      "Mobile_no": "+8801760158370",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2063",
      "ENAME": "Shabbir Ahmed Molla",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2021",
      "Mobile_no": "+8801717230786",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2064",
      "ENAME": "Sanzida Akter",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2067",
      "ENAME": "Hena Kabir",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2077",
      "ENAME": "Fatema Yesmin",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2040",
      "Mobile_no": "+8801711069200",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2083",
      "ENAME": "Subrata Sarkar",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2086",
      "ENAME": "Mohammad Faruk Ahammed Bhuiyan",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2087",
      "ENAME": "Md. Amir Hossain",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2091",
      "ENAME": "Mukta Adhikari",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2097",
      "ENAME": "Kaiyum Miah",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2082",
      "Mobile_no": "+8801733579840",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2103",
      "ENAME": "Burhan Uddin",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2109",
      "ENAME": "Md. Khalilur Rahman",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2121",
      "ENAME": "Rowshan Jahan",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2051",
      "Mobile_no": "+8801911636616",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2125",
      "ENAME": "Habibur Rahman",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2046",
      "Mobile_no": "+8801914120688",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2285",
      "ENAME": "Sonia Khan",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Registrar Office",
      "ID": "2297",
      "Mobile_no": "+8801878701519",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "242",
      "ENAME": "Md. Nurul Islam",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Regional Center Management Department",
      "ID": "401",
      "Mobile_no": "+8801312157997",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "514",
      "ENAME": "Md. Abdul Mazid Sheikh",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Regional Center Management Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "680",
      "ENAME": "Mrs. Taslima Begum",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Regional Center Management Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2244",
      "ENAME": "Shonkor Chandra Das",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Regional Center Management Department",
      "ID": "2143",
      "Mobile_no": "+8801631542477",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "354",
      "ENAME": "Hosney Ara Begum",
      "Designation": "Director",
      "DEPT_NAME": "Regional Center Management Department",
      "ID": "0",
      "Mobile_no": "+8801712 132067",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2015",
      "ENAME": "Md. Anwar Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Regional Center Management Department",
      "ID": "1970",
      "Mobile_no": "+8801711909880",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "610",
      "ENAME": "Md. Jahanggir Alam Patoari",
      "Designation": "Section Officer",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "084",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "180",
      "ENAME": "Md. Sabbir Husain",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "0",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "152",
      "ENAME": "Md. Alamgir Hossaion",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "287",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2194",
      "ENAME": "Md. Abdur Razzak",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "2230",
      "Mobile_no": "+8801737920029",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2234",
      "ENAME": "Protul Chandra Sarkar",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "2229",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1995",
      "ENAME": "Md. Robiul Hoque",
      "Designation": "Director",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "2103",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "31",
      "ENAME": "Quazi Md. Hasanuzzaman",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "267",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "71",
      "ENAME": "Md. Rafiz Ali Khan",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "0150",
      "Mobile_no": "+8801729998918",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2024",
      "ENAME": "Asim Kumar Debnath",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "2022",
      "Mobile_no": "+8801764240229",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "618",
      "ENAME": "Md. Mosharraf Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Rangpur Regional Office",
      "ID": "418",
      "Mobile_no": "+8801553354620",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "266",
      "ENAME": "Md. Masudur Rahman",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "694",
      "ENAME": "Md. Azaharul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0262",
      "Mobile_no": "+8801726740049",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "77",
      "ENAME": "Md. Akhtarul Alam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0235",
      "Mobile_no": "+8801716071192",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "110",
      "ENAME": "Md. Shamsul Alam",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "469",
      "Mobile_no": "+8801718465676",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2501",
      "ENAME": "Most. Jannatul Ferdaus",
      "Designation": "Office Assistant Cum Computer Typist G-1",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0",
      "Mobile_no": "+8801320878004",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2252",
      "ENAME": "Md. Kamrul Hasan",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "27",
      "ENAME": "Md. Faizul Karim",
      "Designation": "Director",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0426",
      "Mobile_no": "+8801712766860",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "281",
      "ENAME": "A.K.M. Firoz",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0637",
      "Mobile_no": "+8801711182533",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "4",
      "ENAME": "Md. Rezaul Karim",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Rajshahi Regional Office",
      "ID": "0571",
      "Mobile_no": "+8801714533258",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1934",
      "ENAME": "Md. Mizanur Rahman",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "1924",
      "Mobile_no": "+8801721440152",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "87",
      "ENAME": "Syed Md. Sekander Hossain",
      "Designation": "Section Officer",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "0232",
      "Mobile_no": "+8801795364600",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "283",
      "ENAME": "Abdul Malek Sarker",
      "Designation": "Director",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "570",
      "Mobile_no": "+8801715297004",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "476",
      "ENAME": "Dilruba Begum",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "0158",
      "Mobile_no": "+8801552478746",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "668",
      "ENAME": "Shila Biswas",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "361",
      "Mobile_no": "+8801721 617456",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "593",
      "ENAME": "Md. Goljar Hossain Dorzi",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "0526",
      "Mobile_no": "+8801711524270",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2487",
      "ENAME": "MD SERAJUL ISLAM",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "2439",
      "Mobile_no": "+8801742815566",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2495",
      "ENAME": "Md. Belayet Hossain Sikder",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "2445",
      "Mobile_no": "+8801717874511",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "485",
      "ENAME": "Monzur Iftekhar",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Publication & Marketing Dept.",
      "ID": "0",
      "Mobile_no": "+8801670195824",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "164",
      "ENAME": "Md. Enamul Kabir",
      "Designation": "Section Officer",
      "DEPT_NAME": "Public Relations, Information & Counselling",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "253",
      "ENAME": "Mohamad Mahbubur Rahman",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Public Relations Departments",
      "ID": "0047",
      "Mobile_no": "+8801715506599",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2522",
      "ENAME": "Mohammad Shorful Islam",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Public Relations Departments",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2432",
      "ENAME": "Md. Mohiuddin",
      "Designation": "Section Officer",
      "DEPT_NAME": "Public Relations Departments",
      "ID": "2395",
      "Mobile_no": "+8801777410903",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1",
      "ENAME": "Md:Mohor Ali",
      "Designation": "Driver",
      "DEPT_NAME": "Public Relations Departments",
      "ID": "0",
      "Mobile_no": "+88236789",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "300",
      "ENAME": "Md. Ataur Rahman",
      "Designation": "Director",
      "DEPT_NAME": "Public Relations Departments",
      "ID": "406",
      "Mobile_no": "+8801715049074",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1960",
      "ENAME": "Hafizur Rahman",
      "Designation": "Cameraman",
      "DEPT_NAME": "Public Relations Departments",
      "ID": "1947",
      "Mobile_no": "+8801682827676",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "254",
      "ENAME": "Md. Enayetur Rahman",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "0382",
      "Mobile_no": "+8801406993177",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "431",
      "ENAME": "Md. Rajdulal Rafi -",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "302",
      "ENAME": "Md. Abu Hanif",
      "Designation": "Director",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "0482",
      "Mobile_no": "+8801711363498",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "405",
      "ENAME": "Azom Shaikh",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "520",
      "Mobile_no": "+8801711020762",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "58",
      "ENAME": "Md. Nazrul Islam Talukder",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "0593",
      "Mobile_no": "+8801716211843",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "172",
      "ENAME": "Muhammad Ashraful Alam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "0312",
      "Mobile_no": "+8801712728662",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "175",
      "ENAME": "Md. Raihanul Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "206",
      "Mobile_no": "+8801684292828",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "671",
      "ENAME": "Goutom Kumar Boumik",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Procurement & Store Department",
      "ID": "0524",
      "Mobile_no": "+8801717218605",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2273",
      "ENAME": "Md. Bipul Mia",
      "Designation": "Photocopier Operator",
      "DEPT_NAME": "Pro Vice Chancellor (Academic)",
      "ID": "2312",
      "Mobile_no": "+8801912487155",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2525",
      "ENAME": "D. Nizamuddin Ahmed",
      "Designation": "Pro Vice Chancellor",
      "DEPT_NAME": "Pro Vice Chancellor",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2017",
      "ENAME": "Md. Wahidul Bashar",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Pro Vice Chancellor",
      "ID": "1984",
      "Mobile_no": "+8801712907971",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2018",
      "ENAME": "Md. Saiful Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Pro Vice Chancellor",
      "ID": "1985",
      "Mobile_no": "+8801716086307",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "548",
      "ENAME": "Mahenoor Afroz",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Planning & Development",
      "ID": "0211",
      "Mobile_no": "+8801712838247",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "160",
      "ENAME": "Md. Zahangir Alam",
      "Designation": "Sub Asst. Engineer",
      "DEPT_NAME": "Planning & Development",
      "ID": "0136",
      "Mobile_no": "+8801716104530",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1846",
      "ENAME": "Md.Mafizul Huq",
      "Designation": "Senior Asst. Director",
      "DEPT_NAME": "Planning & Development",
      "ID": "0",
      "Mobile_no": "+8801711038247",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2427",
      "ENAME": "Subra Dewan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Planning & Development",
      "ID": "2418",
      "Mobile_no": "+8801963633479",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2429",
      "ENAME": "Sudipto Kumar Roy",
      "Designation": "Section Officer",
      "DEPT_NAME": "Planning & Development",
      "ID": "2393",
      "Mobile_no": "+8801515214738",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "526",
      "ENAME": "Md. Salim Mia",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Planning & Development",
      "ID": "0223",
      "Mobile_no": "+8801712962275",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "644",
      "ENAME": "Suman Chackrabartty",
      "Designation": "Director (Planning & Development )",
      "DEPT_NAME": "Planning & Development",
      "ID": "208",
      "Mobile_no": "+8801788424200",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "248",
      "ENAME": "S. M. Taherul Islam",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Planning & Development",
      "ID": "0301",
      "Mobile_no": "+8801715024391",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "385",
      "ENAME": "Md. Nahiduzzaman",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Planning & Development",
      "ID": "0088",
      "Mobile_no": "+8801718364572",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1841",
      "ENAME": "Md Nur Hossian Chowdhury",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Planning & Development",
      "ID": "1862",
      "Mobile_no": "+8801972320131",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2034",
      "ENAME": "Noor Muhammad",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Planning & Development",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "37",
      "ENAME": "Md. Ashraf Ali",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Planning & Development",
      "ID": "0595",
      "Mobile_no": "+8801778899028",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "390",
      "ENAME": "Md. Sohel Rana",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Planning & Development",
      "ID": "340",
      "Mobile_no": "+8801924588958",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "659",
      "ENAME": "Md. Maniruzzaman Manir",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Planning & Development",
      "ID": "0407",
      "Mobile_no": "+8801726701873",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "486",
      "ENAME": "Md. Sadiqur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Physical Education",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "8",
      "ENAME": "Md. Mojibur Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Physical Education",
      "ID": "464",
      "Mobile_no": "+8801715222081",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "626",
      "ENAME": "Md. Jamal Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Physical Education",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2154",
      "ENAME": "Md.  Suhanur Rahman Shohan",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Physical Education",
      "ID": "2387",
      "Mobile_no": "+8801732772901",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "365",
      "ENAME": "H.M. Tayehid Jamal",
      "Designation": "Director",
      "DEPT_NAME": "Physical Education",
      "ID": "0547",
      "Mobile_no": "+8801743783440",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "402",
      "ENAME": "Md. Shamim Alam Mridha",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "Physical Education",
      "ID": "0326",
      "Mobile_no": "+8801710883820",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "140",
      "ENAME": "Md. Parvez Sazzad",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Physical Education",
      "ID": "0",
      "Mobile_no": "+8801712813959",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "206",
      "ENAME": "Mohammad Mohibul Hasan",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Physical Education",
      "ID": "0494",
      "Mobile_no": "+8801552428927",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "98",
      "ENAME": "Abu Saleh Md. Sharif",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Physical Education",
      "ID": "0648",
      "Mobile_no": "+8801711132254",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "101",
      "ENAME": "Muhammad Raihanur Rahman",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Physical Education",
      "ID": "0297",
      "Mobile_no": "+8801773979206",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "231",
      "ENAME": "Md. Abdul Mozid",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Physical Education",
      "ID": "0",
      "Mobile_no": "+8801712 873127",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1757",
      "ENAME": "Muhammad Kamal Hassan",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Physical Education",
      "ID": "0",
      "Mobile_no": "+8801712975754",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "433",
      "ENAME": "M. Zahaggir Kobir",
      "Designation": "Section Officer",
      "DEPT_NAME": "Office of the Information & Services",
      "ID": "0284",
      "Mobile_no": "+8801712292655",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "122",
      "ENAME": "Md. Eman Uddin Sarker",
      "Designation": "Director",
      "DEPT_NAME": "Office of the Information & Services",
      "ID": "0368",
      "Mobile_no": "+8801946142564",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "34",
      "ENAME": "Md. Shameem Ahamed",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Office of the Information & Services",
      "ID": "0277",
      "Mobile_no": "+8801727617028",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "96",
      "ENAME": "A.K.M. SALIM REZA",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Office of the Information & Services",
      "ID": "222",
      "Mobile_no": "+8801557792767",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "398",
      "ENAME": "Md. Ishaque Mahmud",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Office of the Information & Services",
      "ID": "480",
      "Mobile_no": "+8801885092868",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "261",
      "ENAME": "K. M. Zahurul Islam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Office of the Information & Services",
      "ID": "0",
      "Mobile_no": "+8801670031598",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "582",
      "ENAME": "Jayanta Bhattacharjee",
      "Designation": "Director",
      "DEPT_NAME": "Office of the Human Resource Development & Intigri",
      "ID": "0351",
      "Mobile_no": "+8801911297193",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1943",
      "ENAME": "Md. Ashraful Bari",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Office of the College Monitoring & Evaluation",
      "ID": "1909",
      "Mobile_no": "+8801963951478",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1949",
      "ENAME": "Md. Shakhawat Hossain",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Office of the College Monitoring & Evaluation",
      "ID": "1923",
      "Mobile_no": "+8801670632518",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "474",
      "ENAME": "A. S.M. Rofiqul Akbar",
      "Designation": "Director",
      "DEPT_NAME": "Office of the College Monitoring & Evaluation",
      "ID": "0403",
      "Mobile_no": "+8801552314279",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "105",
      "ENAME": "Md. Mizanur Rahman",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Office of the College Monitoring & Evaluation",
      "ID": "264",
      "Mobile_no": "+8801886730226",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "257",
      "ENAME": "Md. Mashiur Rahman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Office of the College Monitoring & Evaluation",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "475",
      "ENAME": "Md. Siddikur Rahman",
      "Designation": "Director",
      "DEPT_NAME": "Office of Legal Affairs",
      "ID": "311",
      "Mobile_no": "+8801716193079",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1836",
      "ENAME": "Dr. Fakir Rafiqul Alam",
      "Designation": "Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "1846",
      "Mobile_no": "+8801620282410",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "459",
      "ENAME": "Dr. Ali Zafor Chowdhury",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "0619",
      "Mobile_no": "+8801815001246",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1784",
      "ENAME": "Dr. A.H.M. Ruhul Quddus",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "1785",
      "Mobile_no": "+8801643479222",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1795",
      "ENAME": "Dr. Md. Abud Darda",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "1806",
      "Mobile_no": "+8801749469703",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1743",
      "ENAME": "Dr. Mohammed Abdur Rahman",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "1746",
      "Mobile_no": "+8801816572895",
      "Blood_Group": "AB-",
      "image": "www.google.com"
    },
    {
      "PF": "1788",
      "ENAME": "Dr. A.F.G. Masud Reza",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "1781",
      "Mobile_no": "+8801752931672",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1797",
      "ENAME": "A. K.M. Zahirul Haq",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "1801",
      "Mobile_no": "+8801614020084",
      "Blood_Group": "O-",
      "image": "www.google.com"
    },
    {
      "PF": "1986",
      "ENAME": "Husne Ara Rubaiyeat",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "0",
      "Mobile_no": "+8801757741117",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2282",
      "ENAME": "Dr. Nazma Tara",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Natural Science Group",
      "ID": "2239",
      "Mobile_no": "+8801715475824",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "435",
      "ENAME": "Kulsum Aktar",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "162",
      "Mobile_no": "+8801716570971",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "16",
      "ENAME": "Md. Abu Hasnain Tarique",
      "Designation": "Section Officer",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "1845",
      "Mobile_no": "+8801795913410",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "416",
      "ENAME": "Md. Abul Kashem Khan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "316",
      "Mobile_no": "+8801712035737",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "189",
      "ENAME": "Md. Lutfor Rahman",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2500",
      "ENAME": "Md. Shamim Arefin",
      "Designation": "Medical Officer",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "2500",
      "Mobile_no": "+8801920530707",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2521",
      "ENAME": "Md. Abdul Awal Talukder",
      "Designation": "Medical Officer",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1868",
      "ENAME": "Monoara  Khatun",
      "Designation": "Medical Attendant",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "1845",
      "Mobile_no": "+8801795913410",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "197",
      "ENAME": "Md. Dulal Mia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "632",
      "ENAME": "Ms. Farida Yeasmin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "52",
      "ENAME": "Md. Edris Ali Sarker",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "605",
      "Mobile_no": "+8801718646081",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "598",
      "ENAME": "Mst. Shajada Khatun",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "738",
      "Mobile_no": "+8801717881400",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "339",
      "ENAME": "Dr. Selina Akhter",
      "Designation": "Chief Medical Officer",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "623",
      "Mobile_no": "+881712064586",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "123",
      "ENAME": "Md. Zakir Hossin Khan",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "0",
      "Mobile_no": "+88no",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "437",
      "ENAME": "Afroz Ahmed Barna",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Medical Services Unit",
      "ID": "0",
      "Mobile_no": "+88no",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "93",
      "ENAME": "Mohammad Belal Hossain",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "M. Phil and Ph.D Program Unit",
      "ID": "027",
      "Mobile_no": "+8801829995254",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1801",
      "ENAME": "Ferdous Ara",
      "Designation": "Lecturer",
      "DEPT_NAME": "Life and Earth Science",
      "ID": "1804",
      "Mobile_no": "+8801717205610",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "205",
      "ENAME": "Md. Mahbubur Rahman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Life and Earth Science",
      "ID": "0477",
      "Mobile_no": "+8801711302821",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1557",
      "ENAME": "Dr. Najmun Naher",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Life and Earth Science",
      "ID": "0919",
      "Mobile_no": "+8801767495022",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1558",
      "ENAME": "Dr. G.M. Saifur Rahman",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Life and Earth Science",
      "ID": "1708",
      "Mobile_no": "+881712526550",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "635",
      "ENAME": "Md. Shamim Mia",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Library",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1925",
      "ENAME": "Mahmuda Begum",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Library",
      "ID": "1922",
      "Mobile_no": "+88+8801770551372",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "126",
      "ENAME": "Md. Zakaria",
      "Designation": "Section Officer",
      "DEPT_NAME": "Library",
      "ID": "0",
      "Mobile_no": "+8801711133207",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "308",
      "ENAME": "Asma  Akther",
      "Designation": "Section Officer",
      "DEPT_NAME": "Library",
      "ID": "0",
      "Mobile_no": "+8801716161770",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1850",
      "ENAME": "Molla Mohd. Shafiqul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Library",
      "ID": "1857",
      "Mobile_no": "+8801718530854",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "120",
      "ENAME": "Md. Shaheed Hassan",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Library",
      "ID": "0279",
      "Mobile_no": "+8801819433048",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1871",
      "ENAME": "Md. Muraduzzaman",
      "Designation": "Cataloger",
      "DEPT_NAME": "Library",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "372",
      "ENAME": "Gita Rani Rana",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Library",
      "ID": "0",
      "Mobile_no": "+8801712006782",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "488",
      "ENAME": "Sharmin Akhter",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Library",
      "ID": "0",
      "Mobile_no": "+8801718 293222",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "578",
      "ENAME": "Mst. Jesmin Ara Khanam",
      "Designation": "Asst. Librarian",
      "DEPT_NAME": "Library",
      "ID": "0",
      "Mobile_no": "+8801700995250",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1853",
      "ENAME": "Md. Zohurul Haque",
      "Designation": "Asst. Librarian",
      "DEPT_NAME": "Library",
      "ID": "1854",
      "Mobile_no": "+8801718431511",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2287",
      "ENAME": "Miss Murshida Khanam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "2245",
      "Mobile_no": "+8801792555282",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "313",
      "ENAME": "Mosa. Sultana Razia",
      "Designation": "Section Officer",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "0045",
      "Mobile_no": "+8801917013242",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2419",
      "ENAME": "Proggaparamita Sur",
      "Designation": "Section Officer",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "2441",
      "Mobile_no": "+8801880233538",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2227",
      "ENAME": "Sikder Shariful Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "2224",
      "Mobile_no": "+8801915044130",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1993",
      "ENAME": "A S M Abdul Haque",
      "Designation": "Director",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "1993",
      "Mobile_no": "+8801711 363552",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "674",
      "ENAME": "Arun Kumer Bala",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "0363",
      "Mobile_no": "+8801711167930",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "600",
      "ENAME": "Md. Monirul Islam",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "0423",
      "Mobile_no": "+8801911194611",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "675",
      "ENAME": "Nipa Rani Kirttania",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Khulna Regional Office",
      "ID": "531",
      "Mobile_no": "+8801716828190",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "426",
      "ENAME": "Mohammed Abdul Kader Chowdhury",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Internal Audit",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1939",
      "ENAME": "Mohammad Jakir Mukswd",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Internal Audit",
      "ID": "1913",
      "Mobile_no": "+8801819127162",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "414",
      "ENAME": "Md. Shah Alam Miah",
      "Designation": "Section Officer",
      "DEPT_NAME": "Internal Audit",
      "ID": "0330",
      "Mobile_no": "+8801739117253",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "190",
      "ENAME": "Md. Saiful Islam",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Internal Audit",
      "ID": "433",
      "Mobile_no": "+8801871193094",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "298",
      "ENAME": "Md. Shafique Ullah",
      "Designation": "Director",
      "DEPT_NAME": "Internal Audit",
      "ID": "0318",
      "Mobile_no": "+8801714394669",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "347",
      "ENAME": "Prmananda Shil",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Internal Audit",
      "ID": "0573",
      "Mobile_no": "+8801725842270",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "363",
      "ENAME": "Raj-Bin-Kasem",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Internal Audit",
      "ID": "0096",
      "Mobile_no": "+8801715124420",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "585",
      "ENAME": "Jasmin Akhter",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Internal Audit",
      "ID": "0166",
      "Mobile_no": "+8801711050900",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "612",
      "ENAME": "Nargish Akter",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Internal Audit",
      "ID": "0345",
      "Mobile_no": "+8801716981659",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "673",
      "ENAME": "Md. Abdur Razzak",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Internal Audit",
      "ID": "509",
      "Mobile_no": "+8801634772940",
      "Blood_Group": "O-",
      "image": "www.google.com"
    },
    {
      "PF": "2010",
      "ENAME": "Sheikh Enaith Rasel",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Internal Audit",
      "ID": "1968",
      "Mobile_no": "+8801719072318",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "370",
      "ENAME": "Md. Saiful Islam",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Institutional Quality Assurance Cell(IQAC)",
      "ID": "0",
      "Mobile_no": "+8801705122008",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1998",
      "ENAME": "Md. Abdus Salam",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Institutional Quality Assurance Cell(IQAC)",
      "ID": "1972",
      "Mobile_no": "+8801716563037",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2476",
      "ENAME": "Mahbubur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Institute of Liberation, Bangabandhu and Banglades",
      "ID": "0",
      "Mobile_no": "+8801949450283",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2535",
      "ENAME": "Professor Dr. A K M Nurun  Nabi",
      "Designation": "Professor",
      "DEPT_NAME": "Institute of Liberation, Bangabandhu and Banglades",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2536",
      "ENAME": "Professor Dr. Akther Hussain",
      "Designation": "Professor",
      "DEPT_NAME": "Institute of Liberation, Bangabandhu and Banglades",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "26",
      "ENAME": "Md. Jibon Mia",
      "Designation": "Guard",
      "DEPT_NAME": "Institute of Liberation, Bangabandhu and Banglades",
      "ID": "0020",
      "Mobile_no": "+8801722423493",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1989",
      "ENAME": "Dr. Md. Maniruzzaman",
      "Designation": "Director",
      "DEPT_NAME": "Institute of Liberation, Bangabandhu and Banglades",
      "ID": "2010",
      "Mobile_no": "+8801718411109",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "448",
      "ENAME": "Bazlur Rashid",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Institute of Liberation, Bangabandhu and Banglades",
      "ID": "444",
      "Mobile_no": "+8801717901619",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "225",
      "ENAME": "Ashraf Ahmmed Rony",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Institute of Liberation, Bangabandhu and Banglades",
      "ID": "0",
      "Mobile_no": "+8801715459836",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2202",
      "ENAME": "Md. Jahangir Alam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Information & Counselling Cell",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "264",
      "ENAME": "Md. Mosharaf Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0322",
      "Mobile_no": "+8801777789043",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "627",
      "ENAME": "Md. Zane Alam Pk",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0014",
      "Mobile_no": "+8801711325397",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2053",
      "ENAME": "Md. Mehbub Haider",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2069",
      "ENAME": "Rukshana Begum",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2291",
      "ENAME": "Md. Jahidul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2292",
      "ENAME": "Md. Hasan Ali",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2286",
      "Mobile_no": "+8801716915616",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2301",
      "ENAME": "Most. Jannatul Naeema",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2307",
      "Mobile_no": "+8801754112895",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2302",
      "ENAME": "Mohammad Nazrul Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2305",
      "ENAME": "Md. Ali Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2315",
      "Mobile_no": "+8801843945522",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2309",
      "ENAME": "Saiful Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2294",
      "Mobile_no": "+8801611127983",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2321",
      "ENAME": "Mohammad Faizul Haque",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2252",
      "Mobile_no": "+8801794627617",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2324",
      "ENAME": "Mohammad Shohel Mian",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2251",
      "Mobile_no": "+8801628045163",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2325",
      "ENAME": "Nirmol Sutra Dhar",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2271",
      "Mobile_no": "+8801731140882",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2338",
      "ENAME": "Shahin Alam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2320",
      "Mobile_no": "+8801736569467",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2343",
      "ENAME": "Md. Delwar Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2309",
      "Mobile_no": "+8801712913224",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2353",
      "ENAME": "Md. Liton Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2370",
      "ENAME": "Shammi Akter",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2471",
      "ENAME": "MD. SAIFUL ISLAM",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2423",
      "Mobile_no": "+8801716312235",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1927",
      "ENAME": "Shuvra Rani",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1927",
      "Mobile_no": "+8801743323334",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1930",
      "ENAME": "Md. Iqbal Ali",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1926",
      "Mobile_no": "+8801956095914",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1942",
      "ENAME": "Ratan Biswas",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1925",
      "Mobile_no": "+8801915913511",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1956",
      "ENAME": "Md. Humayun Kabir",
      "Designation": "System Analyst",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1963",
      "Mobile_no": "+8801867065111",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "86",
      "ENAME": "Md. Mozammel Haque",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0298",
      "Mobile_no": "+8801988598308",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2382",
      "ENAME": "Md. Mostafijur Rahman",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1456",
      "Mobile_no": "+8801761239756",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1842",
      "ENAME": "Md. Azizur Rahman",
      "Designation": "Senior Asst. Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1864",
      "Mobile_no": "+8801743726594",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "33",
      "ENAME": "Md. Abdullah Al-Mamun Sarker",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801552672372",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "69",
      "ENAME": "Md. Abdul Barik Mollah",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "109",
      "ENAME": "Muhammad Abu Hossain",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0578",
      "Mobile_no": "+8801716409115",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "124",
      "ENAME": "Manik Chakraborty",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0362",
      "Mobile_no": "+8801742928507",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "186",
      "ENAME": "Md. Abdur Rahim",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "EX0630",
      "Mobile_no": "+8801712707775",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "211",
      "ENAME": "Md. Nurul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0565",
      "Mobile_no": "+8801720280346",
      "Blood_Group": "AB-",
      "image": "www.google.com"
    },
    {
      "PF": "244",
      "ENAME": "Md. Rezaul Karim",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "300",
      "Mobile_no": "+8801718774667",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "256",
      "ENAME": "Md. Mahfuzur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "035",
      "Mobile_no": "+8801715909211",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "265",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "413",
      "Mobile_no": "+8801969068473",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "330",
      "ENAME": "Arif Muhammad Shadrul Ula",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "440",
      "Mobile_no": "+8801312357993",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "369",
      "ENAME": "Molla Mahbubul Haque",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0017",
      "Mobile_no": "+8801552370647",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "409",
      "ENAME": "Md. Mizanur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0588",
      "Mobile_no": "+8801711384203",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "487",
      "ENAME": "Md. Golam Mostofa",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801712 236341",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "496",
      "ENAME": "Md. Rajaul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0504",
      "Mobile_no": "+8801733995340",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "499",
      "ENAME": "Md. Abdur Rashid",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0513",
      "Mobile_no": "+8801951619856",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "596",
      "ENAME": "Ahammadul Hoque",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0442",
      "Mobile_no": "+8801741499265",
      "Blood_Group": "AB-",
      "image": "www.google.com"
    },
    {
      "PF": "2057",
      "ENAME": "Mostafizur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2091",
      "Mobile_no": "+8801681839567",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2062",
      "ENAME": "MST. SabeKunnahar Akon",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2106",
      "ENAME": "Md. Kamruzzaman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2077",
      "Mobile_no": "+8801918907935",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2438",
      "ENAME": "Sharmin Akter",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2413",
      "Mobile_no": "+8801779056057",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2442",
      "ENAME": "Md. Abdullah Al Mamun",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2417",
      "Mobile_no": "+8801727936601",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2451",
      "ENAME": "Rezwan Siddique",
      "Designation": "Section Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2415",
      "Mobile_no": "+8801610094245",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "334",
      "ENAME": "Kazi Akhter Hossain-",
      "Designation": "Personel Assistant",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "520",
      "ENAME": "S M Towhedur Rahaman",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "356",
      "Mobile_no": "+8801726768698",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2326",
      "ENAME": "Nazmun Nahar",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "195",
      "ENAME": "Md. Moklesur Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "317",
      "ENAME": "Dulal Chandra Das",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0040",
      "Mobile_no": "+8801867784816",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "428",
      "ENAME": "Md. Ashaduzzaman Khandakar",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0058",
      "Mobile_no": "+8801712909807",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "510",
      "ENAME": "Mrs. Nazma Begum",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0057",
      "Mobile_no": "+8801798383795",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2139",
      "ENAME": "Md. Oli Ahmed",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2210",
      "Mobile_no": "+8801777789043",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2181",
      "ENAME": "Md. Arash Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2248",
      "Mobile_no": "+8801930067617",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2184",
      "ENAME": "Suma Khanam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2096",
      "Mobile_no": "+8801777789043",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2185",
      "ENAME": "Shanjoy Chandra Pal",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2212",
      "ENAME": "Titu Chowdhury",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2117",
      "Mobile_no": "+8801642742500",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2216",
      "ENAME": "Md. Sohel Rana",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2180",
      "Mobile_no": "+8801711587961",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2219",
      "ENAME": "Paris Mondol",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2112",
      "Mobile_no": "+8801924806435",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2225",
      "ENAME": "Shamim Al Mamun",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2246",
      "ENAME": "Most. Silpi Akter",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2123",
      "Mobile_no": "+8801950254142",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "2265",
      "ENAME": "Shuhel Rana",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2137",
      "Mobile_no": "+8801927137838",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2274",
      "ENAME": "Salma Akter",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "277",
      "ENAME": "Md. Sajedul Haque",
      "Designation": "Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "443",
      "Mobile_no": "+8801716644691",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "348",
      "ENAME": "Md. Abu Horayra",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801922616087",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "573",
      "ENAME": "Md. Ainul Islam Sarkar",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0635",
      "Mobile_no": "+8801711489631",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "17",
      "ENAME": "Abu Abdullah Muhammad",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801712889980",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "66",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88029291097",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "127",
      "ENAME": "Md. Abdur Rakib",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0118",
      "Mobile_no": "+8801731997754",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "128",
      "ENAME": "Md. Mozaharul Islam",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0335",
      "Mobile_no": "+8801730166851",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "129",
      "ENAME": "Md. Shiblur Rahman",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0122",
      "Mobile_no": "+8801718469224",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "171",
      "ENAME": "Md. Farid Hossain Khan",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "621",
      "Mobile_no": "+8801720097131",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "221",
      "ENAME": "Amar Kumar Paul",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0215",
      "Mobile_no": "+8801627258237",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "230",
      "ENAME": "Md. Niamul Hassan",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0414",
      "Mobile_no": "+8801921323113",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "350",
      "ENAME": "Md. Shouyeb Ahmed",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801711907425",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "373",
      "ENAME": "Md. Abdul Hamid Molla",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0412",
      "Mobile_no": "+8801556325169",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "383",
      "ENAME": "Md. Sultan Uddin",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "525",
      "Mobile_no": "+8801918154801",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "387",
      "ENAME": "Mohammad Shafiul Karim",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801715330165",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "503",
      "ENAME": "Sakil Ahmed",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "477",
      "Mobile_no": "+8801741695339",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "576",
      "ENAME": "Mohammad Sirajul Islam",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0199",
      "Mobile_no": "+8801711174258",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "579",
      "ENAME": "Subrata Saha",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0141",
      "Mobile_no": "+8801711361448",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "584",
      "ENAME": "Sheikh Muhammad Mufazzal Hussain",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "319",
      "Mobile_no": "+8801912906294",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1840",
      "ENAME": "Faiz Ahmed",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1863",
      "Mobile_no": "+8801714098785",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1996",
      "ENAME": "Md. Solaiman Akon",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1973",
      "Mobile_no": "+8801712198552",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1969",
      "ENAME": "Md. Sohel Rana",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "1953",
      "Mobile_no": "+8801711736062",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "551",
      "ENAME": "Debabrota Paul",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0559",
      "Mobile_no": "+8801720012622",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "553",
      "ENAME": "Mohammad Zakir Hossain",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0026",
      "Mobile_no": "+8801711019121",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "22",
      "ENAME": "Md. Abdus Samad",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "421",
      "Mobile_no": "+8801711229073",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "131",
      "ENAME": "Md. Zobaidul Haque",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801756992544",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "163",
      "ENAME": "Md. Tazul Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0320",
      "Mobile_no": "+8801319416314",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "173",
      "ENAME": "Md. Nazrul Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "495",
      "Mobile_no": "+8801720034689",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "210",
      "ENAME": "Md. Shamsul Haque",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801712123558",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "226",
      "ENAME": "Muhammad Atiqul Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "645",
      "Mobile_no": "+8801724681084",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "381",
      "ENAME": "Md. Jasim Uddin",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0018",
      "Mobile_no": "+8801716361608",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "403",
      "ENAME": "Md. Mujibur Rahman Khan",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0152",
      "Mobile_no": "+8801720381616",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "491",
      "ENAME": "Md. Ataur Rahaman",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801715342254",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "592",
      "ENAME": "Md. Motahar Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "391",
      "Mobile_no": "+8801716151579",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "645",
      "ENAME": "Shamima Akther Parvin",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0342",
      "Mobile_no": "+8801817588077",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "651",
      "ENAME": "Md. Rafiqul Islam Fakir",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801712212282",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "661",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0503",
      "Mobile_no": "+8801712635538",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "662",
      "ENAME": "Mohammad Abu Hanifa",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801716913111",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2488",
      "ENAME": "FIROZ RASHID",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+8801977704184",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2056",
      "ENAME": "Md. Madhu Mia",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2085",
      "ENAME": "Chaitali Bosu",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2024",
      "Mobile_no": "+8801714252455",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2088",
      "ENAME": "Md. Kabir Hossain",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2158",
      "Mobile_no": "+8801811789725",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2104",
      "ENAME": "Urmila Debi",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2023",
      "Mobile_no": "+8801715605713",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2123",
      "ENAME": "Hari Pada Das",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Finance & Accounts",
      "ID": "2064",
      "Mobile_no": "+8801722439933",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "72",
      "ENAME": "Md. Nayeb Ali Khan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Engineering",
      "ID": "290",
      "Mobile_no": "+8801753785599",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "572",
      "ENAME": "Mina Anastashia Godinu",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "434",
      "ENAME": "Mosammat Ismot Ara",
      "Designation": "Telephone Operator",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1924",
      "ENAME": "Auliullah",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Engineering",
      "ID": "1921",
      "Mobile_no": "+8801736555744",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1944",
      "ENAME": "Anisur Rahman",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Engineering",
      "ID": "1918",
      "Mobile_no": "+8801710008036",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "62",
      "ENAME": "Engr. Md. Helalluzzaman",
      "Designation": "Sub Asst. Engineer",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+8801719695626",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2388",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "Sub Asst. Engineer",
      "DEPT_NAME": "Engineering",
      "ID": "2345",
      "Mobile_no": "+8801712954231",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2390",
      "ENAME": "Tultul Ram Roy",
      "Designation": "Sub Asst. Engineer",
      "DEPT_NAME": "Engineering",
      "ID": "2362",
      "Mobile_no": "+8801755256669",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2491",
      "ENAME": "MD AMINUL ISLAM",
      "Designation": "Sub Asst. Engineer",
      "DEPT_NAME": "Engineering",
      "ID": "2490",
      "Mobile_no": "+8801937959405",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "309",
      "ENAME": "Mrs. Rowshan Ara Begum",
      "Designation": "Section Officer",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+8801732438890",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "681",
      "ENAME": "Md. Abul Kalam Azad",
      "Designation": "Section Officer",
      "DEPT_NAME": "Engineering",
      "ID": "629",
      "Mobile_no": "+8801711570579",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "41",
      "ENAME": "Md. Abdur Rashid",
      "Designation": "Plambar",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2135",
      "ENAME": "Ashish Samadder",
      "Designation": "Plambar",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "524",
      "ENAME": "Md. Tahajaddin",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "24",
      "ENAME": "Md. Sekender Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Engineering",
      "ID": "0462",
      "Mobile_no": "+8801727919041",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "78",
      "ENAME": "Md. Abdul Kader",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "188",
      "ENAME": "Md. jaker Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "543",
      "ENAME": "Md. Sadekul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "545",
      "ENAME": "Md. Din Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "682",
      "ENAME": "Uttam Chandra Debnath",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "683",
      "ENAME": "Md. Abdul Aziz Patoary",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "0366",
      "Mobile_no": "+8801712262642",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1866",
      "ENAME": "Khandaker Md. Arifur Rahman",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "1837",
      "Mobile_no": "+8801799266471",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1867",
      "ENAME": "Md. Ismail Hossain",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "1838",
      "Mobile_no": "+8801727764884",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1904",
      "ENAME": "Md. Nayan Hossain",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "1885",
      "Mobile_no": "+8801724974473",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1905",
      "ENAME": "Md. Mizanur Rahman",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1906",
      "ENAME": "Nazrul Howlader",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "1886",
      "Mobile_no": "+8801679891543",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1907",
      "ENAME": "Md. Belal Hossain",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "1887",
      "Mobile_no": "+8801861137823",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1908",
      "ENAME": "Md. Abdur Rahman Sumon",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "1883",
      "Mobile_no": "+8801739672930",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1909",
      "ENAME": "Md. Rajib Bhuyan",
      "Designation": "Lift Man",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1858",
      "ENAME": "Md. Mizanoor Rahman",
      "Designation": "Executive Engineer",
      "DEPT_NAME": "Engineering",
      "ID": "1853",
      "Mobile_no": "+8801714048724",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "40",
      "ENAME": "Abdul Motin Khan",
      "Designation": "Electrician",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2267",
      "ENAME": "Mizanur Rahaman",
      "Designation": "Electrician",
      "DEPT_NAME": "Engineering",
      "ID": "2165",
      "Mobile_no": "+8801778949399",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2221",
      "ENAME": "Md. Ainul Islam",
      "Designation": "Electric Sub-station caretaker",
      "DEPT_NAME": "Engineering",
      "ID": "2120",
      "Mobile_no": "+8801911598586",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "5",
      "ENAME": "Robiul Islam",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "14",
      "ENAME": "Md. Golam Mostafa -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "82",
      "ENAME": "Md. Abdur Rahman",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "055",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "91",
      "ENAME": "Md. Ratan Mia -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "137",
      "ENAME": "Md. Hurunur Rashid -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "287",
      "ENAME": "Sree Komal Moni Dash -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+8801611939023",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "288",
      "ENAME": "Md. Salah Uddin -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "289",
      "ENAME": "Md. Jaynal Abeden -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "319",
      "ENAME": "Md. Nazim Uddin-",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "324",
      "ENAME": "Md. Ismail Hossain",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "467",
      "ENAME": "Kazi Md. Ramzan Ali-",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "470",
      "ENAME": "Md. Rahmat Ali -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "471",
      "ENAME": "Md. Belayet Hossain",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "013",
      "Mobile_no": "+8801711165293",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "587",
      "ENAME": "Md. Rafiqul Islam -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "588",
      "ENAME": "Md. Zahangir Buiya -",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "640",
      "ENAME": "Md. Shofiullah",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "227",
      "Mobile_no": "+8801711245873",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1879",
      "ENAME": "Md. Mahbub Alam",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1880",
      "ENAME": "Md. Rahman Ali",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1881",
      "ENAME": "Md. Zamshed Alam",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1886",
      "ENAME": "Md. Julhas Hossain Sikder",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "1901",
      "Mobile_no": "+8801718699681",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1887",
      "ENAME": "Md. Jahangir Alam",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1888",
      "ENAME": "Md. Mozibur Rahman (Manik)",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "1900",
      "Mobile_no": "+8801842370442",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1889",
      "ENAME": "Md. Zillur Rahman",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1890",
      "ENAME": "Md. Almas Hossain",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1891",
      "ENAME": "Md. Raisuddin",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1893",
      "ENAME": "Md. Shah Alam Khan",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1895",
      "ENAME": "Azim Ali",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1897",
      "ENAME": "Md. Hossain Ali",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1898",
      "ENAME": "Md. Uzir Ahmed",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1899",
      "ENAME": " Md. Habibur Rahman",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1900",
      "ENAME": "Kazi Sanour Hossain",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1901",
      "ENAME": "Md. Belayet Mollah",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1902",
      "ENAME": "Md. Azizul Haque",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1903",
      "ENAME": "Md. Biddut Hossain",
      "Designation": "Driver",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2387",
      "ENAME": "Md. Ashraf-Uz-Zaman",
      "Designation": "Draftman",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "643",
      "ENAME": "Mohammad Amdadul Hoque",
      "Designation": "Director (Current Charge)",
      "DEPT_NAME": "Engineering",
      "ID": "0135",
      "Mobile_no": "+8801711-581099",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "13",
      "ENAME": "Md. Khairul Islam Mondol",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Engineering",
      "ID": "0260",
      "Mobile_no": "+8801839575765",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "294",
      "ENAME": "Md. Hafizur Rahman",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Engineering",
      "ID": "0134",
      "Mobile_no": "+8801974809030",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "642",
      "ENAME": "Mohammad Ranzu Ahmed",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Engineering",
      "ID": "0110",
      "Mobile_no": "+8801731394997",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "177",
      "ENAME": "Md. Isha Haque",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Engineering",
      "ID": "0138",
      "Mobile_no": "+8801913973094",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "666",
      "ENAME": "Md. Harun Or Rashid",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Engineering",
      "ID": "502",
      "Mobile_no": "+8801721-694254",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2138",
      "ENAME": "Md. Rashidul Islam",
      "Designation": "Asst. Plamber",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2490",
      "ENAME": "SHANTONU CHOWDHURY",
      "Designation": "Asst. Engineer",
      "DEPT_NAME": "Engineering",
      "ID": "2462",
      "Mobile_no": "+8801812021398",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "473",
      "ENAME": "Mahammad Farid Ali",
      "Designation": "Asst. Electrician",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "64",
      "ENAME": "Md. Shafiqul Islam",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Engineering",
      "ID": "0070",
      "Mobile_no": "+8801722190325",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "215",
      "ENAME": "Md. Hafiz Ullah Ahmed",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Engineering",
      "ID": "0563",
      "Mobile_no": "+8801711907255",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "250",
      "ENAME": "Muhammad Habibur Rahman",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Engineering",
      "ID": "0506",
      "Mobile_no": "+8801947468878",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "325",
      "ENAME": "Md. Mosharef Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Engineering",
      "ID": "0574",
      "Mobile_no": "+8801725065710",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "396",
      "ENAME": "Mohammad Muslam Uddin",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Engineering",
      "ID": "0",
      "Mobile_no": "+8801711677577",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2137",
      "ENAME": "Md. Mohibul Islam",
      "Designation": "Aircular Technician",
      "DEPT_NAME": "Engineering",
      "ID": "2337",
      "Mobile_no": "+8801719739810",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2226",
      "ENAME": "Md. Forhad Hossain",
      "Designation": "Aircular Technician",
      "DEPT_NAME": "Engineering",
      "ID": "2174",
      "Mobile_no": "+8801944221255",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2237",
      "ENAME": "Md. Golam Ambia",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "EState Department",
      "ID": "2108",
      "Mobile_no": "+8801728105682",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "352",
      "ENAME": "Mr. Hasan Ameer Ahmed",
      "Designation": "Director",
      "DEPT_NAME": "EState Department",
      "ID": "140",
      "Mobile_no": "+8801819274700",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "94",
      "ENAME": "Md. Alamgir",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "EState Department",
      "ID": "169",
      "Mobile_no": "+8801712264562",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "374",
      "ENAME": "Md. Asaduzzaman Khan",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "EState Department",
      "ID": "0441",
      "Mobile_no": "+8801721935786",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "649",
      "ENAME": "Kazi Shahidur Rahman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "EState Department",
      "ID": "0364",
      "Mobile_no": "+8801918997985",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2426",
      "ENAME": "Tarun Kumar Barai",
      "Designation": "Section Officer",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "2406",
      "Mobile_no": "+8801721270518",
      "Blood_Group": "O-",
      "image": "www.google.com"
    },
    {
      "PF": "2437",
      "ENAME": "Md. Minarul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "2419",
      "Mobile_no": "+8801722902865",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2444",
      "ENAME": "Md. Salah Uddin",
      "Designation": "Section Officer",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+8801306314088",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "236",
      "ENAME": "Md. Hossain Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "112",
      "Mobile_no": "+8801886711612",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "519",
      "ENAME": "Md. Rafiqul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "463",
      "ENAME": "Md. Liton Mia",
      "Designation": "Guard",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "684",
      "ENAME": "Md. Ismail",
      "Designation": "Guard",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2131",
      "ENAME": "Md. Jamal Hoshin Khalifa",
      "Designation": "Guard",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2133",
      "ENAME": "Kanak Roy",
      "Designation": "Guard",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2134",
      "ENAME": "Mohammed Dulal",
      "Designation": "Guard",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "132",
      "ENAME": "Md. Akhteruzzaman",
      "Designation": "Director",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0053",
      "Mobile_no": "+8801712261400",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "466",
      "ENAME": "Monju Sarker",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0",
      "Mobile_no": "+8801719181240",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "650",
      "ENAME": "Runa Begum",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "0226",
      "Mobile_no": "+8801816619652",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2005",
      "ENAME": "Lakkhon Chandra Das",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Discipline and Security Department",
      "ID": "1982",
      "Mobile_no": "+8801673285214",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2449",
      "ENAME": "Mahfuza Sharker",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of Teachers Training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "285",
      "ENAME": "Md. Hasanur Rahman",
      "Designation": "Director",
      "DEPT_NAME": "Department of Teachers Training",
      "ID": "0034",
      "Mobile_no": "+8801817509088",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2009",
      "ENAME": "Mohammad Rezaul Karim",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Department of Teachers Training",
      "ID": "Ex 1983",
      "Mobile_no": "+8801765199806",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1977",
      "ENAME": "Muhammad Mosharraf Hossain",
      "Designation": "Web-Master",
      "DEPT_NAME": "Department of ICT",
      "ID": "1966",
      "Mobile_no": "+8801997733374",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2030",
      "ENAME": "Md. Rejaul Karim",
      "Designation": "Web-Master",
      "DEPT_NAME": "Department of ICT",
      "ID": "1994",
      "Mobile_no": "+8801704740850",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "181",
      "ENAME": "Md. Raihanul Islam -",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Department of ICT",
      "ID": "0472",
      "Mobile_no": "+8801533832500",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "432",
      "ENAME": "Md. Jahangir Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Department of ICT",
      "ID": "0365",
      "Mobile_no": "+8801732548192",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1929",
      "ENAME": "Kazal Kumar Roy",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1917",
      "Mobile_no": "+8801705889506",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1931",
      "ENAME": "Prodip Kumar Biswas",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "Cc 1916",
      "Mobile_no": "+8801715234802",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1940",
      "ENAME": "Md. Mamun Hossain",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1912",
      "Mobile_no": "+8801918326191",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1946",
      "ENAME": "Shipra Rani Das",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1920",
      "Mobile_no": "+8801917664919",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2038",
      "ENAME": "Md. Mostafizur Rahaman",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2008",
      "Mobile_no": "+8801689225557",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2041",
      "ENAME": "Md. Aminul Islam",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2002",
      "Mobile_no": "+8801785506200",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2042",
      "ENAME": "Md. Rakibul Hasan",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1999",
      "Mobile_no": "+8801925123768",
      "Blood_Group": "B-",
      "image": "www.google.com"
    },
    {
      "PF": "2043",
      "ENAME": "Md. Shamim Reza",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2000",
      "Mobile_no": "+8801794691878",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2045",
      "ENAME": "A. K. M. Manjil Ahamed",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2003",
      "Mobile_no": "+8801817069075",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2047",
      "ENAME": "Prohlad Roy",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2007",
      "Mobile_no": "+8801982555724",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2377",
      "ENAME": "Md. Wadudur Rahman",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2358",
      "Mobile_no": "+8801913942984",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2378",
      "ENAME": "Md. Rashedul Haider Rashel",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2359",
      "Mobile_no": "+8801815229363",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1957",
      "ENAME": "Md. Nazimul Haque",
      "Designation": "System Analyst",
      "DEPT_NAME": "Department of ICT",
      "ID": "1964",
      "Mobile_no": "+8801911747590",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1959",
      "ENAME": "Md. Mobarak Hossain",
      "Designation": "System Analyst",
      "DEPT_NAME": "Department of ICT",
      "ID": "1962",
      "Mobile_no": "+8801923508806",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2032",
      "ENAME": "Dr. Md. Hayder Ali",
      "Designation": "System Analyst",
      "DEPT_NAME": "Department of ICT",
      "ID": "1995",
      "Mobile_no": "+8801712993175",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1844",
      "ENAME": "Shahina Farzana",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1844",
      "Mobile_no": "+8801724206638",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1926",
      "ENAME": "Najmul Huda",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1938",
      "Mobile_no": "+8801987958210",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1938",
      "ENAME": "H. M. Israfil",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1928",
      "Mobile_no": "+8801913266616",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1947",
      "ENAME": "Kafil Uddin Mahmud Mojumder",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1914",
      "Mobile_no": "+8801681373293",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2046",
      "ENAME": "Ushatan Chakma",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2009",
      "Mobile_no": "+8801868108778",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2380",
      "ENAME": "Sumiaya Bithee",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0",
      "Mobile_no": "+8801750 509502",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2381",
      "ENAME": "Md. Dider Alam",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2364",
      "Mobile_no": "+8801718915281",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "478",
      "ENAME": "Md. Shahnewaz",
      "Designation": "Senior System Analyst",
      "DEPT_NAME": "Department of ICT",
      "ID": "0212",
      "Mobile_no": "+8801714059772",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1955",
      "ENAME": "Mohammad Salekul Islam",
      "Designation": "Senior System Analyst",
      "DEPT_NAME": "Department of ICT",
      "ID": "2197",
      "Mobile_no": "+8801717818142",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1950",
      "ENAME": "Md. Mejbahul Azam",
      "Designation": "Senior Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2235",
      "Mobile_no": "+8801740631966",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2025",
      "ENAME": "Md. Baharul Islam",
      "Designation": "Senior Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1991",
      "Mobile_no": "+8801556310992",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "104",
      "ENAME": "Mohammad Salim",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "104",
      "Mobile_no": "+880199 360758",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "108",
      "ENAME": "Md. Ziaur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0518",
      "Mobile_no": "+8801717 166791",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "146",
      "ENAME": "Md. Zikrul Haque",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0473",
      "Mobile_no": "+8801711190999",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "245",
      "ENAME": "Md. Faruk Ahmed",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "239",
      "Mobile_no": "+8801816509159",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "263",
      "ENAME": "Muhammad Hamidur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0381",
      "Mobile_no": "+8801955269853",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "275",
      "ENAME": "Md. Nazmul Alam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0678",
      "Mobile_no": "+8801754264403",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "329",
      "ENAME": "Md. Malak Chowdhury",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0465",
      "Mobile_no": "+8801712 146531",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "407",
      "ENAME": "Md. Shofiqul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "119",
      "Mobile_no": "+8801764299689",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "606",
      "ENAME": "Mst. Asma Khatun",
      "Designation": "Section Officer",
      "DEPT_NAME": "Department of ICT",
      "ID": "054",
      "Mobile_no": "+8801911916468",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "568",
      "ENAME": "Mohammad Billal Hossen",
      "Designation": "Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "225",
      "Mobile_no": "+8801829774554",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1834",
      "ENAME": "Md. Saifur Rahman",
      "Designation": "Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1813",
      "Mobile_no": "+8801822917717",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1913",
      "ENAME": "Biplab Kumar Paul",
      "Designation": "Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0653",
      "Mobile_no": "+8801608118344",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1922",
      "ENAME": "Muhammad Manjurur Rashid",
      "Designation": "Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1940",
      "Mobile_no": "+8801722777506",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "182",
      "ENAME": "Md. Nur Amin",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Department of ICT",
      "ID": "408",
      "Mobile_no": "+8801712838331",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2322",
      "ENAME": "Md. Fakhrul Islam Reyad",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Department of ICT",
      "ID": "2293",
      "Mobile_no": "+8801783260600",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1973",
      "ENAME": "Md. Ariful Islam",
      "Designation": "Mali",
      "DEPT_NAME": "Department of ICT",
      "ID": "1946",
      "Mobile_no": "+8801913395928",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1974",
      "ENAME": "Md. Ayub Ali",
      "Designation": "Mali",
      "DEPT_NAME": "Department of ICT",
      "ID": "1945",
      "Mobile_no": "+8801934895854",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1975",
      "ENAME": "Md. Abul Kalam",
      "Designation": "Mali",
      "DEPT_NAME": "Department of ICT",
      "ID": "1944",
      "Mobile_no": "+8801924866151",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2029",
      "ENAME": "Sonjoy Kumar Nath",
      "Designation": "Maintenance Engineer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1992",
      "Mobile_no": "+8801972740366",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2050",
      "ENAME": "Md. Eunus Hasan",
      "Designation": "Maintenance Engineer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1993",
      "Mobile_no": "+8801976179279",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "631",
      "ENAME": "Md. Zakir Hossan",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Department of ICT",
      "ID": "217",
      "Mobile_no": "+8801876594261",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2167",
      "ENAME": "Bulbul Ahmed",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Department of ICT",
      "ID": "2168",
      "Mobile_no": "+880179975449",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2182",
      "ENAME": "Md. Iqbal Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Department of ICT",
      "ID": "2182",
      "Mobile_no": "+8801821734231",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1789",
      "ENAME": "Md. Mominul Islam",
      "Designation": "Director (Computer Unit)",
      "DEPT_NAME": "Department of ICT",
      "ID": "1794",
      "Mobile_no": "+8801713017550",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1962",
      "ENAME": "Md. Badrul Hasan Babu",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "1951",
      "Mobile_no": "+8801716083397",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1964",
      "ENAME": "Abdul Malek",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "1956",
      "Mobile_no": "+8801720693215",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1965",
      "ENAME": "Shahanaz Parvin",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1966",
      "ENAME": "Ali Asgar Ahmed",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "2012",
      "Mobile_no": "+8801716290487",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1967",
      "ENAME": "Md. Swakat Hossain Darani",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "1950",
      "Mobile_no": "+8801820210370",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1968",
      "ENAME": "Prodip Kumar Samaddar",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "1989",
      "Mobile_no": "+8801792126852",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1972",
      "ENAME": "Shanjoy Kumar Ghosh",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1976",
      "ENAME": "Sweety Rani Das",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Department of ICT",
      "ID": "2102",
      "Mobile_no": "+8801914674144",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1920",
      "ENAME": "Mridul Roy",
      "Designation": "Asst. Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1905",
      "Mobile_no": "+8801737344888",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1921",
      "ENAME": "Narjis Binte Islam",
      "Designation": "Asst. Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1906",
      "Mobile_no": "+8801912291706",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2516",
      "ENAME": "Shakil Sikder",
      "Designation": "Asst. Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "0",
      "Mobile_no": "+8801731179819",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2518",
      "ENAME": "Farzana Islam Jui",
      "Designation": "Asst. Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2485",
      "Mobile_no": "+8801760124789",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2520",
      "ENAME": "Md. Raysul Hasan",
      "Designation": "Asst. Programmer",
      "DEPT_NAME": "Department of ICT",
      "ID": "2499",
      "Mobile_no": "+8801969-680697",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "856",
      "ENAME": "Zulfikar Ahmed",
      "Designation": "Assistant System Analyst",
      "DEPT_NAME": "Department of ICT",
      "ID": "2234",
      "Mobile_no": "+8801712812284",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1883",
      "ENAME": "Md. Abdullah Yusuf Imam",
      "Designation": "Assistant Maintanance Engineer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1948",
      "Mobile_no": "+888801930623886",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1884",
      "ENAME": "Md. Zillur Rahman",
      "Designation": "Assistant Maintanance Engineer",
      "DEPT_NAME": "Department of ICT",
      "ID": "1880",
      "Mobile_no": "+8801830445822",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "554",
      "ENAME": "Mohammad Mostafa",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Department of ICT",
      "ID": "207",
      "Mobile_no": "+8801682827765",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "556",
      "ENAME": "Mohd. Harun-Or-Rashid",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Department of ICT",
      "ID": "0203",
      "Mobile_no": "+8801913486463",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "559",
      "ENAME": "Samina Sultana",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Department of ICT",
      "ID": "0684",
      "Mobile_no": "+8801711191772",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "560",
      "ENAME": "Dewan Golam Kibria",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Department of ICT",
      "ID": "25",
      "Mobile_no": "+8801716229091",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "561",
      "ENAME": "Md. Matiar Rahman",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Department of ICT",
      "ID": "0039",
      "Mobile_no": "+8801713114386",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "565",
      "ENAME": "Muhammad Farid Uddin Chowdhury",
      "Designation": "Assistant Director (Computer)",
      "DEPT_NAME": "Department of ICT",
      "ID": "0201",
      "Mobile_no": "+8801881556691",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "611",
      "ENAME": "Mir Hossan",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Department of ICT",
      "ID": "0082",
      "Mobile_no": "+8801834960200",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2090",
      "ENAME": "Md. Muniruzzaman Khan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "2090",
      "Mobile_no": "+8801635330806",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "249",
      "ENAME": "Md. Seraj Uddaula",
      "Designation": "Section Officer",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0435",
      "Mobile_no": "+8801718885870",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "401",
      "ENAME": "Md. Noor Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0583",
      "Mobile_no": "+8801912832215",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2094",
      "ENAME": "Kazi Habibur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "2075",
      "Mobile_no": "+8801521430987",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "84",
      "ENAME": "Md. Iqbal Hossain",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "238",
      "ENAME": "Md. Harun-Ar-Rashid Mondol",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "633",
      "ENAME": "Md. Moshin Ali",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "691",
      "ENAME": "Goure Rani Das",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "525",
      "ENAME": "Md. Zalil Hossain Khan",
      "Designation": "Office Assistant Cum Computer Typist G-1",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0173",
      "Mobile_no": "+8801712203752",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "333",
      "ENAME": "Md. Mozammel Haque",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0584",
      "Mobile_no": "+8801744210757",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "32",
      "ENAME": "Md. Mahbubur Rahman",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "071",
      "Mobile_no": "+8801840048405",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "56",
      "ENAME": "Md. Abul Kashem",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+8801711617670",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "97",
      "ENAME": "Muhammad Ashraful Haque",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+8801712278033",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "305",
      "ENAME": "Mohammed Hossain",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0551",
      "Mobile_no": "+8801815698852",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "351",
      "ENAME": "Amit Kumar Dam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "391",
      "ENAME": "Mohammad Rafiqul Islam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0143",
      "Mobile_no": "+88+880 1719-336273",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "438",
      "ENAME": "Mahabuba Khanam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0163",
      "Mobile_no": "+8801818260585",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "477",
      "ENAME": "Jinnat Ara",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+8801785246187",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "583",
      "ENAME": "Md. Kamrul Islam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "481",
      "Mobile_no": "+8801610100883",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1979",
      "ENAME": "Dr. Md. Nasiruddin",
      "Designation": "Dean (In Charge)",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "2237",
      "Mobile_no": "+8801713092792",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "345",
      "ENAME": "Hafez Ahmed Noman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "376",
      "ENAME": "Md. Aminul Aktar",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "310",
      "Mobile_no": "+8801686712834",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "411",
      "ENAME": "Mahfuza Khatun",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0170",
      "Mobile_no": "+8801927463380",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "648",
      "ENAME": "Mst. Shamima Akther",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0",
      "Mobile_no": "+8801790721202",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "665",
      "ENAME": "Mohammad Abu Bakar Siddique",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "0470",
      "Mobile_no": "+8801813920399",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2011",
      "ENAME": "Mst. Kamrun Naher",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "1981",
      "Mobile_no": "+8801765-199806",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2110",
      "ENAME": "Md. Sohel Rana",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "2074",
      "Mobile_no": "+8801722750655",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2117",
      "ENAME": "Md. Saijuddin Molla",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Dean, School of Under Graduate Studies",
      "ID": "2076",
      "Mobile_no": "+8801886221418",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1862",
      "ENAME": "Golam Kibria",
      "Designation": "Senior Asst. Registrar",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "1860",
      "Mobile_no": "+8801712763674",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "183",
      "ENAME": "Md. Rayhan Habib",
      "Designation": "Section Officer",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0",
      "Mobile_no": "+8801816 224074",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "589",
      "ENAME": "Ahamed Sarder",
      "Designation": "Section Officer",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0",
      "Mobile_no": "+8801711976257",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "624",
      "ENAME": "Meherunnahar",
      "Designation": "Section Officer",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0",
      "Mobile_no": "+8801785892795",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "44",
      "ENAME": "Md. Enamul Karim",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0280",
      "Mobile_no": "+8801916830049",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "216",
      "ENAME": "Md. Nazrul Islam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0",
      "Mobile_no": "+8801708537578",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "569",
      "ENAME": "Rajaur  Rahman Miah",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0123",
      "Mobile_no": "+8801552450745",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1548",
      "ENAME": "Md. Shahab Uddin Ahmed",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "1259",
      "Mobile_no": "+8801917021801",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1843",
      "ENAME": "Md. Ayub Hossain",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "1873",
      "Mobile_no": "+8801711171449",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1999",
      "ENAME": "Dr. Md. Faruque Hossain",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "2067",
      "Mobile_no": "+8801552460271",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "139",
      "ENAME": "Md. Ashraful Alam",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "294",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "174",
      "ENAME": "Taufiq Imam Mohammad Ashraful Alam",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0545",
      "Mobile_no": "+8801711303692",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1857",
      "ENAME": "Mohammed Bin Kashem",
      "Designation": "Dean (In Charge)",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0",
      "Mobile_no": "+8801780 455617",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "38",
      "ENAME": "Md. Abul Kalam Azad",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "0",
      "Mobile_no": "+8801989962154",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2082",
      "ENAME": "Johirul Islam",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Dean, Curriculum Dev. and Evaluation Certer",
      "ID": "2050",
      "Mobile_no": "+8801712548294",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "23",
      "ENAME": "Md. Babul Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "112",
      "ENAME": "Monirul Islam Jamadder",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0624",
      "Mobile_no": "+8801983458713",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "144",
      "ENAME": "Muhammad Mokshedul Hoque",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "353",
      "Mobile_no": "+8801728880708",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "153",
      "ENAME": "Md. Abdul Khaleque",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0649",
      "Mobile_no": "+8801761077971",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "392",
      "ENAME": "Biplop Kumar Dutta",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "613",
      "Mobile_no": "+8801613519790",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2089",
      "ENAME": "Md. Shariful Islam",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2026",
      "Mobile_no": "+8801748912047",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2286",
      "ENAME": "Nadiatul Ferdous",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2276",
      "Mobile_no": "+8801521234770",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2293",
      "ENAME": "S.M. Rubel",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2295",
      "ENAME": "Zahid Hasan Peayel",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2250",
      "Mobile_no": "+88A+(positive)",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2311",
      "ENAME": "Md. Rahat Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2266",
      "Mobile_no": "+8801705808672",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2354",
      "ENAME": "Helena Khatun",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2334",
      "Mobile_no": "+8801670038242",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2373",
      "ENAME": "A. M. Monirul Alam\r\n",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88???????????",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1923",
      "ENAME": "Prodip Barai",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1919",
      "Mobile_no": "+8801676827384",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1941",
      "ENAME": "Md. Rubel Khondoker",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1929",
      "Mobile_no": "+8801736773565",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1932",
      "ENAME": "Md. Abdul Alim",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "01937",
      "Mobile_no": "+8801955383922",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2363",
      "ENAME": "Md. Waheduzzaman",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2438",
      "Mobile_no": "+8801945730657",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2364",
      "ENAME": "Jannatul Baky",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2364",
      "Mobile_no": "+8801711043967",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "49",
      "ENAME": "Md. Taffazzal Hossain",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0246",
      "Mobile_no": "+8801816643221",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "59",
      "ENAME": "Md. Hafizur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "133",
      "ENAME": "Shah Md. Shajahan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711 003372",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "138",
      "ENAME": "Mohammad Khademul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0138",
      "Mobile_no": "+8801712090142",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "142",
      "ENAME": "Md. Khairul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0307",
      "Mobile_no": "+8801716942499",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "156",
      "ENAME": "Md. Afsar Ali Mondol",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "452",
      "Mobile_no": "+8801712159218",
      "Blood_Group": "A-",
      "image": "www.google.com"
    },
    {
      "PF": "169",
      "ENAME": "Md. Zahirul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711289804",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "176",
      "ENAME": "Md. Abdul Baten",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801712542688",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "209",
      "ENAME": "Md. Ahidul Pramanik",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801743968047",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "219",
      "ENAME": "A.N.M. Abdul Hamid",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801913022100",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "223",
      "ENAME": "Md. Rezaul Karim",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "224",
      "ENAME": "Kazi Md. Waliullah",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0655",
      "Mobile_no": "+8801706690991",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "228",
      "ENAME": "Md. Zahirul Alam Khandaker",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "236",
      "Mobile_no": "+8801937806206",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "229",
      "ENAME": " Md. Shahidul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "414",
      "Mobile_no": "+8801718381473",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "234",
      "ENAME": "Md. Mazedur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0539",
      "Mobile_no": "+8801671141361",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "252",
      "ENAME": "Md. Abdul Alim",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "Ex 450",
      "Mobile_no": "+8801675365835",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "262",
      "ENAME": "Md. Golam Kibria",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801712 132162",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "267",
      "ENAME": "Md. Abul Hashem Khan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711192352",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "270",
      "ENAME": "Abul Kalam Md. Mominul Haque",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "105",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "274",
      "ENAME": "Md. Nazmul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0098",
      "Mobile_no": "+8801711248142",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "312",
      "ENAME": "Md. Abul Kalam Miagee",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0336",
      "Mobile_no": "+8801867782772",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "394",
      "ENAME": "Md. Golam Sarwar",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0585",
      "Mobile_no": "+8801754106337",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "412",
      "ENAME": "Md. Shabir Uddin",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801763433604",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "417",
      "ENAME": "Md. Jahirul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0228",
      "Mobile_no": "+8801732-121684",
      "Blood_Group": "O-",
      "image": "www.google.com"
    },
    {
      "PF": "441",
      "ENAME": "Ashraf Ahammod Khan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "188",
      "Mobile_no": "+8801777307473",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "489",
      "ENAME": "A.Z.Md. Iftiar Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801710 630870",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "493",
      "ENAME": "Md. Khorshed Alam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801879988995",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "546",
      "ENAME": "Aminur Rahman Khandoker",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0604",
      "Mobile_no": "+8801715304016",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "604",
      "ENAME": "Md. Atiqur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801935568352",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "605",
      "ENAME": "Mohammad Anayet Ullah",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801712436254",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "615",
      "ENAME": "Md. Enamul Haque",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "316",
      "Mobile_no": "+8801793574508",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "616",
      "ENAME": "Md. Nurunnabi Chowdhury",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "094",
      "Mobile_no": "+8801711136196",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "621",
      "ENAME": "Md. Hossain Shaheed",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "621",
      "Mobile_no": "+8801676797023",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "628",
      "ENAME": "Md. Gias Uddin",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0030",
      "Mobile_no": "+8801797131905",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "677",
      "ENAME": "Md. Abul Hossain",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0347",
      "Mobile_no": "+8801671979896",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "695",
      "ENAME": "K.M. Hafijur Rahaman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "044",
      "Mobile_no": "+8801717059784",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "696",
      "ENAME": "Rafiqul Islam Gazi",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0352",
      "Mobile_no": "+8801717-074314",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "697",
      "ENAME": "Nasrin Akhter",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801792199846",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2072",
      "ENAME": "Md. Nasir Mia",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2030",
      "Mobile_no": "+8801628000088",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2073",
      "ENAME": "Alamin Talukder",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2029",
      "Mobile_no": "+8801722738264",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2100",
      "ENAME": "Md. Shaheen Sarkar",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2028",
      "Mobile_no": "+8801711426701",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2127",
      "ENAME": "Md. Rokanuzzaman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2337",
      "Mobile_no": "+8801719739810",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2421",
      "ENAME": "Md. Jashim Mahmud",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2410",
      "Mobile_no": "+8801670432172",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2436",
      "ENAME": "Nazrul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2431",
      "Mobile_no": "+8801911847759",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2443",
      "ENAME": "Md Sirazul Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2429",
      "Mobile_no": "+8801982082018",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2448",
      "ENAME": "Raihan Uddin Khan",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2430",
      "Mobile_no": "+8801788053013",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2453",
      "ENAME": "Md. Mamun Mia",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2409",
      "Mobile_no": "+8801712799350",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2461",
      "ENAME": "Tania Lipy",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2435",
      "Mobile_no": "+8801756297757",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2466",
      "ENAME": "Iqbal Hossain",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2412",
      "Mobile_no": "+8801725418620",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2477",
      "ENAME": "Md. Mahfuzullah",
      "Designation": "Section Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801724853017",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1917",
      "ENAME": "Md. Manirul Islam",
      "Designation": "Programmer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1903",
      "Mobile_no": "+8801794209480",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "81",
      "ENAME": "Md. Shafiqul Islam",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "580",
      "Mobile_no": "+8801751874539",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "184",
      "ENAME": "Md. Enamul Hoque",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0528",
      "Mobile_no": "+8801745635623",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "318",
      "ENAME": "Md. Sahidur Rahman Khan",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "332",
      "ENAME": "Ahammed Hossain",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "521",
      "ENAME": "Md. Uzzal Ali",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "375",
      "Mobile_no": "+8801893969768",
      "Blood_Group": "A-",
      "image": "www.google.com"
    },
    {
      "PF": "522",
      "ENAME": "Md. Abu Syed Chowdhury",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0022",
      "Mobile_no": "+8801726907937",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "634",
      "ENAME": "Md. Menazul Islam",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "633",
      "Mobile_no": "+8801712220972",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "85",
      "ENAME": "Md. Abdul Hakim",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "107",
      "ENAME": "Md. Sakendar Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0493",
      "Mobile_no": "+8801710605901",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "147",
      "ENAME": "Md. Hasan Ali Sikder",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0064",
      "Mobile_no": "+8801716202376",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "187",
      "ENAME": "Md. Nurul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "233",
      "ENAME": "Md. Khairul Bashar Badsha",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0590",
      "Mobile_no": "+8801712090142",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "237",
      "ENAME": "Md. Sahidul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "240",
      "ENAME": "Md. Shafiqul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0402",
      "Mobile_no": "+8801727466967",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "331",
      "ENAME": "Md. Shahedul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0658",
      "Mobile_no": "+8801716251501",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "508",
      "ENAME": "Md. Mizanur Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "511",
      "ENAME": "Md. Moizul Haque",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "069",
      "Mobile_no": "+8801846835544",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "629",
      "ENAME": "Md. Shahjahan",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0083",
      "Mobile_no": "+8801715-459836",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1790",
      "ENAME": "Md. Sabuj Khan-4250",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2143",
      "ENAME": "Md. Arshad Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2203",
      "Mobile_no": "+8801611148976",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2243",
      "ENAME": "Md. Habibur Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2231",
      "Mobile_no": "+8801930297004",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "67",
      "ENAME": "Md. Abdul Hai Siddique Sarker",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "098",
      "Mobile_no": "+8801715153077",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "204",
      "ENAME": "Munir Hossain",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "454",
      "Mobile_no": "+8801673909303",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "218",
      "ENAME": "Sarker Mohammad Ershad",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0436",
      "Mobile_no": "+8801715316217",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "259",
      "ENAME": "Md. Abdul Khaleq",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0490",
      "Mobile_no": "+8801711969522",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "279",
      "ENAME": "Md. Nuruzzaman Khan",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0530",
      "Mobile_no": "+8801775015600",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "296",
      "ENAME": "Easmin Jennifer",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0642",
      "Mobile_no": "+8801947705438",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "361",
      "ENAME": "Syed Saiful Haque",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801911023156",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "366",
      "ENAME": "Md. Mohasin Iqbal",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801730795893",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "367",
      "ENAME": "Md. Shahanur Rahman Saad",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801716271785",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "375",
      "ENAME": "Md. Shah Alam Dhali",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "380",
      "ENAME": "Md. Kudrat Ali",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0425",
      "Mobile_no": "+8801721551558",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "400",
      "ENAME": "Md. Harun-Or-Rashid",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0586",
      "Mobile_no": "+8801712683804",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "445",
      "ENAME": "Md. Mamunur Rashid",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711824292",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "484",
      "ENAME": "Md. Shah Alam Sheikh",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "458",
      "Mobile_no": "+8801711287162",
      "Blood_Group": "A-",
      "image": "www.google.com"
    },
    {
      "PF": "562",
      "ENAME": "Md. Amir Khaiam",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0067",
      "Mobile_no": "+8801721287213",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "563",
      "ENAME": "Mohammad Abdus Salam Khan",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0224",
      "Mobile_no": "+8801712226862",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "571",
      "ENAME": "Mohammad Siddiqur Rahman",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0250",
      "Mobile_no": "+8801712013325",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "601",
      "ENAME": "Md. Kamrul Hasan Talukdar",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0404",
      "Mobile_no": "+8801713227376",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "652",
      "ENAME": "Syed Ahmed Khan",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "510",
      "Mobile_no": "+8801727604439",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "654",
      "ENAME": "Md. Tarikul Islam",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0370",
      "Mobile_no": "+8801712106829",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "670",
      "ENAME": "Ashit Kumar Sarkar",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "315",
      "Mobile_no": "+8801787161218",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "672",
      "ENAME": "Md. Zahid Iqbal",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0497",
      "Mobile_no": "+8801914222924",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1845",
      "ENAME": "Md. Abu Kawsar",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2002",
      "ENAME": "Hossne Ara Rayhan",
      "Designation": "Deputy Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1974",
      "Mobile_no": "+8801817509828",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1961",
      "ENAME": "Abdullah Al-Mamun",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1954",
      "Mobile_no": "+8801552329171",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "45",
      "ENAME": "Badruzzaman",
      "Designation": "Controller of Examination",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0562",
      "Mobile_no": "+8801714036341",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "534",
      "ENAME": "Anjoli Rani Sarker",
      "Designation": "Cleaner",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "220",
      "ENAME": "Md. Atiar Rahman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801789763611",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "316",
      "ENAME": "Md. Yousuf Ali",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801716416777",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "447",
      "ENAME": "A.K.M. Badrul Alam",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711471350",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "35",
      "ENAME": "S.M Tahmidur Rahman",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "608",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "80",
      "ENAME": "Sukumar Chandra Mondal",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0204",
      "Mobile_no": "+8801u16429582",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "99",
      "ENAME": "Nur Muhammad Sarder",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "179",
      "Mobile_no": "+8801712579439",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "117",
      "ENAME": "Dulal Chandra Chowdhury",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0234",
      "Mobile_no": "+8801747408804",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "136",
      "ENAME": "Md. Qamruzzaman",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "145",
      "ENAME": "Muhammed Mozibur Rahman",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "175",
      "Mobile_no": "+8801818248436",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "167",
      "ENAME": "Md. Mohir Uddin",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0627",
      "Mobile_no": "+8801704638050",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "213",
      "ENAME": "Md. Mahmudul Hasan",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "217",
      "ENAME": "Mohammad Zakair Hossain",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801719992605",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "243",
      "ENAME": "Md. Mashudur Rahman",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711079414",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "251",
      "ENAME": "Md. Nazim Uddin",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0309",
      "Mobile_no": "+8801732480508",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "258",
      "ENAME": "Shibu Nath Ghosh",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0109",
      "Mobile_no": "+8801300293870",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "326",
      "ENAME": "Khirul Alam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0453",
      "Mobile_no": "+8801716203979",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "371",
      "ENAME": "Md. Shafiqul Islam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "378",
      "ENAME": "Dwijendra Nath Bagchi",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0331",
      "Mobile_no": "+8801712997676",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "397",
      "ENAME": "Mohammed Jahangir Alam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801718889348",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "408",
      "ENAME": "Md. Salah Uddin",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "510",
      "Mobile_no": "+8801711173504",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "415",
      "ENAME": "Md. Abdul Aziz Sarker",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711487345",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "420",
      "ENAME": "Lucky Rani Borua",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0169",
      "Mobile_no": "+8801712820856",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "421",
      "ENAME": "Md. Abu Ashraf",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "6",
      "Mobile_no": "+8801552350823",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "442",
      "ENAME": "Md. Jahangir Alam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711386950",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "482",
      "ENAME": "Md. Ziaul Hoque",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "120",
      "Mobile_no": "+8801711 289796",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "497",
      "ENAME": "Md. Tarazul  Islam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711580672",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "505",
      "ENAME": "Kohinoor Begum",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801739057227",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "609",
      "ENAME": "Shanti Ranjan Golder",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "565",
      "Mobile_no": "+8801716864176",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "614",
      "ENAME": "Md. Kamruzzaman Majumder",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801711173757",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "620",
      "ENAME": "Md. Fajlur Rahman",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801552441330",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "622",
      "ENAME": "A.K.M Nazmull Karim",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0349",
      "Mobile_no": "+8801531728534",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "625",
      "ENAME": "Mohammad Gias Uddin",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0076",
      "Mobile_no": "+8801916709125",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "657",
      "ENAME": "Shamsun Nahar Begum",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0532",
      "Mobile_no": "+8801914923590",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "667",
      "ENAME": "Shyamal Kanti Roy",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801712981123",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "678",
      "ENAME": "Md. Azizur Rahman",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+8801712700736",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2007",
      "ENAME": "Md. Sujauddoula",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1969",
      "Mobile_no": "+8801814739355",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2013",
      "ENAME": "Md. Shoeb Atia",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1980",
      "Mobile_no": "+8801917569208",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2019",
      "ENAME": "Md. Mahbubul Islam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "1906",
      "Mobile_no": "+8801828543026",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2484",
      "ENAME": "MOHAMMED KAMAL UDDIN AHMED",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2451",
      "Mobile_no": "+8801992130466",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "276",
      "ENAME": "Md. Mizanur Rahman",
      "Designation": "Assistant Controller (Computer)",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0376",
      "Mobile_no": "+8801917265200",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "388",
      "ENAME": "Samiron Majumder",
      "Designation": "Assistant Controller (Computer)",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0186",
      "Mobile_no": "+8801971277233",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "564",
      "ENAME": "Mohammad Jamal Khan",
      "Designation": "Assistant Controller (Computer)",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0185",
      "Mobile_no": "+8801913592275",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2120",
      "ENAME": "Md. Sohel Rana",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2124",
      "ENAME": "Md. Mizanur Rahman",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "2062",
      "Mobile_no": "+8801717292496",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2289",
      "ENAME": "Biswajit Baral",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "Controller of Examinations",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2463",
      "ENAME": "Sajal Mandal",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "2421",
      "Mobile_no": "+8801911605870",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "179",
      "ENAME": "Mahamudur Habibbullah",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "607",
      "Mobile_no": "+8801740592896",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "617",
      "ENAME": "Md. Abul Kalam Azad",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801552323090",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2099",
      "ENAME": "Bidhan Chandra Das",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "2039",
      "Mobile_no": "+8801914764721",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2116",
      "ENAME": "Syful Islam",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "2073",
      "Mobile_no": "+8801310442235",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2417",
      "ENAME": "Sumana Sultana Champa",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "2427",
      "Mobile_no": "+88 01725172033",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2418",
      "ENAME": "Ryan Binte Eunus",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "2401",
      "Mobile_no": "+8801928087606",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2434",
      "ENAME": "Sharmin Akhter",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801798703882",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2460",
      "ENAME": "Prianka Shankar Das",
      "Designation": "Section Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "CC 2400",
      "Mobile_no": "+8801671141478",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "517",
      "ENAME": "Md. Dulal Miah",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "College Inspection",
      "ID": "0272",
      "Mobile_no": "+8801711056770",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2162",
      "ENAME": "Md. Akter Hossen",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "College Inspection",
      "ID": "2182",
      "Mobile_no": "+8801713533604",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2197",
      "ENAME": "Md. Sariful Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "College Inspection",
      "ID": "2171",
      "Mobile_no": "+8801945507743",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "297",
      "ENAME": "Fahima Sultana",
      "Designation": "Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801552410906",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "595",
      "ENAME": "Nittya Nanda Gain",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "College Inspection",
      "ID": "409",
      "Mobile_no": "+8801743134143",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "280",
      "ENAME": "Syeda Sayera Sultana",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801765591173",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "335",
      "ENAME": "Golam Farouqe",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801716042405",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "368",
      "ENAME": "Md. Mokhlesur Rahman",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0456",
      "Mobile_no": "+88",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "389",
      "ENAME": "Rahena Mustafa",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "034",
      "Mobile_no": "+8801743911312",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "436",
      "ENAME": "S.M Masud Rana",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "164",
      "Mobile_no": "+8801711634476",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "483",
      "ENAME": "Md. Mir Kasem",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0449",
      "Mobile_no": "+8801735233679",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "567",
      "ENAME": "Ashutosh Dewan",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0393",
      "Mobile_no": "+8801553354611",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "602",
      "ENAME": "A.H.M. Mashiur Rahman",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0656",
      "Mobile_no": "+8801711060687",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "653",
      "ENAME": "Swarnomayee Saha",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "669",
      "ENAME": "Abul Kalam Mostofa",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0476",
      "Mobile_no": "+8801711824115",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1997",
      "ENAME": "Mohammed Harun Or Rashid Bhuyin",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "1979",
      "Mobile_no": "+8801936309931",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2003",
      "ENAME": "M. M. Kudrat Ullah",
      "Designation": "Deputy Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "1975",
      "Mobile_no": "+8801736324966",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2052",
      "ENAME": "Md. Moydul Islam",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "College Inspection",
      "ID": "2212",
      "Mobile_no": "+8801712006196",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "18",
      "ENAME": "Md. Rashedul Haque",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0350",
      "Mobile_no": "+8801620338558",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "207",
      "ENAME": "Sheikh Md. Ahsan Ullah",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "533",
      "Mobile_no": "+8801712285018",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "314",
      "ENAME": "Md. Fakhrul Islam (Milon)",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0338",
      "Mobile_no": "+8801720070121",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "336",
      "ENAME": "H. M. A. Shajahan",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801712 054591",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "379",
      "ENAME": "Umme Kulsum Ara",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0043",
      "Mobile_no": "+8801716-964605",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "384",
      "ENAME": "Nasima Begum",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0168",
      "Mobile_no": "+8801712518370",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "494",
      "ENAME": "Firoz Ahmed Chowdhury",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0581",
      "Mobile_no": "+8801715424238",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "619",
      "ENAME": "Md. Moksedul Islam",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "410",
      "Mobile_no": "+8801740338341",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2004",
      "ENAME": "Mohammad Ali",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801701 346370",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2006",
      "ENAME": "Sujibon Chakma",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+8801827824048",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2008",
      "ENAME": "Most. Yeasmin Naher",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "1971",
      "Mobile_no": "+8801716850594",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2012",
      "ENAME": "Mohammad Shahidullah",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "1987",
      "Mobile_no": "+8801763340270",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2033",
      "ENAME": "Md. Nurul Huda",
      "Designation": "Asst. Inspector of Colleges",
      "DEPT_NAME": "College Inspection",
      "ID": "2033",
      "Mobile_no": "+8801572090348",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2035",
      "ENAME": "Juliet Sarkar",
      "Designation": "Assistant Registrar (Computer)",
      "DEPT_NAME": "College Inspection",
      "ID": "0",
      "Mobile_no": "+88no",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2036",
      "ENAME": "Sonjay Kumar Mojumder",
      "Designation": "Assistant Inpector of Colleges(Computer)",
      "DEPT_NAME": "College Inspection",
      "ID": "2034",
      "Mobile_no": "+8801716806737",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2080",
      "ENAME": "Kazi Aowlad Hossain",
      "Designation": "Administrative Officer",
      "DEPT_NAME": "College Inspection",
      "ID": "2015",
      "Mobile_no": "+8801752532320",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2126",
      "ENAME": "Jayashry Karmaker",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "2027",
      "Mobile_no": "+8801884758409",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2284",
      "ENAME": "Arshad Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "2243",
      "Mobile_no": "+8801816120907",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2240",
      "ENAME": "Md. Mahbubur Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "2195",
      "Mobile_no": "+8801887739986",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "685",
      "ENAME": "Md. Alamgir",
      "Designation": "Guard",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "486",
      "Mobile_no": "+8801310268222",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "349",
      "ENAME": "Kazi Nasir Uddin",
      "Designation": "Director (In Charge)",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "39",
      "ENAME": "Md. Touhiduzzaman",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "327",
      "Mobile_no": "+8801710812377",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2492",
      "ENAME": "SUMAN DUTTA",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "0",
      "Mobile_no": "+8801991947271",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "647",
      "ENAME": "Manomay Kumer Halder",
      "Designation": "Assistant Registrar (Computer)",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "CC19",
      "Mobile_no": "+8801716222800",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "500",
      "ENAME": "Md. Mazbah Uddin",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Chittagong Regional Office",
      "ID": "0",
      "Mobile_no": "+8801753399315",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "151",
      "ENAME": "Md. Amzad Hossain",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "443",
      "ENAME": "Amin Uddin",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0195",
      "Mobile_no": "+8801713564165",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "523",
      "ENAME": "Mohammed Sayem Ali Khan",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "271",
      "Mobile_no": "+8801719177976",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2524",
      "ENAME": "Md. Mahedi Hasan",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "125",
      "ENAME": "Md. Ataur Rahman",
      "Designation": "Section Officer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "323",
      "Mobile_no": "+8801706348051",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "608",
      "ENAME": "Md. Saminur Alam",
      "Designation": "Section Officer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801720097288",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2430",
      "ENAME": "Md. Ariful Haque",
      "Designation": "Section Officer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "2408",
      "Mobile_no": "+8801633389367",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2457",
      "ENAME": "Md. Saiful Islam Chowdhury",
      "Designation": "Section Officer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "2394",
      "Mobile_no": "+8801315201773",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1856",
      "ENAME": "Dr. Balal Hossain",
      "Designation": "Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1849",
      "Mobile_no": "+8801712076280",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "273",
      "ENAME": "Md. Noyon Ali",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "142",
      "Mobile_no": "+8801730795898",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "425",
      "ENAME": "Md. Aminul Hoque",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "528",
      "ENAME": "Md. Akram Hossain",
      "Designation": "Office Assistant Cum Computer Typist G-2",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "400",
      "Mobile_no": "+8801911419418",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "43",
      "ENAME": "Md. Jaynal Abedin",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "149",
      "ENAME": "Md. Mohor Ali",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "192",
      "ENAME": "Md. Oliar Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0275",
      "Mobile_no": "+8801720019127",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "241",
      "ENAME": "Md. Amirul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "341",
      "ENAME": "Md. Abdul Malek",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "527",
      "ENAME": "Md. Shafiul Islam",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "343",
      "ENAME": "Md. Hafizur Rahman",
      "Designation": "Lecturer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801711367582",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1744",
      "ENAME": " Dr. Md. Saleh Uddin",
      "Designation": "Lecturer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801671419413",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1817",
      "ENAME": "Nasrin Akhter",
      "Designation": "Lecturer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1824",
      "Mobile_no": "+8801951253568",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2496",
      "ENAME": "Kamrul Hasan Bhuiyan",
      "Designation": "Lecturer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "No Id",
      "Mobile_no": "+88???????????",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2497",
      "ENAME": "Shahariar Hasan",
      "Designation": "Lecturer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801711085802",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2498",
      "ENAME": "Manzuma Sharmin Munne",
      "Designation": "Lecturer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801916966357",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2499",
      "ENAME": "Debasree Bhowmik",
      "Designation": "Lecturer",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801824915318",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "29",
      "ENAME": "Md. Shahidur Rahman",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0091",
      "Mobile_no": "+8801796284597",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "212",
      "ENAME": "Mohammad Abdul  Malek",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0541",
      "Mobile_no": "+8801722587589",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "293",
      "ENAME": "Monnujan Begum",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0701",
      "Mobile_no": "+8801711394634",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "580",
      "ENAME": "Arati Biswas",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0589",
      "Mobile_no": "+8801727701066",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1864",
      "ENAME": "Md. Sanaullah Mia",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1866",
      "Mobile_no": "+8801749472412",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "481",
      "ENAME": "Md. Nur Alam Nesar Uddin",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0448",
      "Mobile_no": "+8801749-756077",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "599",
      "ENAME": "Tamal Barua",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0261",
      "Mobile_no": "+8801715619828",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1963",
      "ENAME": "Md. Sadruzzaman Sadi",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1949",
      "Mobile_no": "+8801623525453",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2392",
      "ENAME": "MD. SADDAM HOSSAIN",
      "Designation": "Data Entry Operator",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "2349",
      "Mobile_no": "+8801313833755",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "535",
      "ENAME": "Md. Fazlul Hoque Bhuya",
      "Designation": "Cleaner",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "102",
      "ENAME": "Md. Khalequzzaman Chowdhury",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0598",
      "Mobile_no": "+8801732640715",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2014",
      "ENAME": "Mst. Taslima Parvin",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "2104",
      "Mobile_no": "+8801717623760",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1572",
      "ENAME": "Dr. Mohammad Mostafizur Rahman",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1747",
      "Mobile_no": "+8801716257188",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1782",
      "ENAME": "Dr. Mohammad Monzur -E-Elahi",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1784",
      "Mobile_no": "+8801813055384",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1802",
      "ENAME": "Dr. Md. Alamuddin",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1807",
      "Mobile_no": "+8801674591400",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1807",
      "ENAME": "Dr. Syed Hadiuzzaman",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1808",
      "Mobile_no": "+8801716910222",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1822",
      "ENAME": " Dr. Md. Najeebur Rahman",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801772916448",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1823",
      "ENAME": " Dr. Mohammad Anwarul Kabir",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801819841660",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1825",
      "ENAME": "Dr. Sonia Zebsyn",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1943",
      "Mobile_no": "+8801711230846",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1827",
      "ENAME": "Dr. Chinmoy Howlader",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1831",
      "Mobile_no": "+8801717727664",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "575",
      "ENAME": "Mohammad Ali Azahar Khandakar",
      "Designation": "Assistant Registrar (Computer)",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0037",
      "Mobile_no": "+8801978291729",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1562",
      "ENAME": "Saika Mahjabin",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801817515924",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1785",
      "ENAME": "Dr. Md. Iftekher Islam",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1782",
      "Mobile_no": "+8801816601949",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1803",
      "ENAME": "Dr. Md. Tajul Islam Chowdhury",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1803",
      "Mobile_no": "+8801715023674",
      "Blood_Group": "AB-",
      "image": "www.google.com"
    },
    {
      "PF": "1806",
      "ENAME": "Shaela Tasmina Mahbub",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801714236544",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1818",
      "ENAME": "Mafuza Khanam",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801715866247",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1819",
      "ENAME": "Dr. Mohammad Imam Hossain",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1817",
      "Mobile_no": "+8801670180392",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1826",
      "ENAME": "Rehana Yeasmin",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "0",
      "Mobile_no": "+8801554318768",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1847",
      "ENAME": "Syed Afzal Hossain",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Centre for Post Graduate Studies training",
      "ID": "1843",
      "Mobile_no": "+8801961896210",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1987",
      "ENAME": "Md. Nahid Mia",
      "Designation": "Lecturer",
      "DEPT_NAME": "Business Studies Group",
      "ID": "1976",
      "Mobile_no": "+8801623322490",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1756",
      "ENAME": "Tahnia Islam Khan",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Business Studies Group",
      "ID": "0",
      "Mobile_no": "+889292094",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1799",
      "ENAME": "Shak Muhammad Mujahidul Islam",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "1801",
      "Mobile_no": "+8801728112244",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1804",
      "ENAME": "Dr. Md. Anowar Hossain Bhuiyan",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1820",
      "ENAME": " Md. Khalilur Rahman",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "1819",
      "Mobile_no": "+8801747499463",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1982",
      "ENAME": "Fatema Akter",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "1977",
      "Mobile_no": "+8801716645808",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2277",
      "ENAME": "Md. Saiful Islam",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "2353",
      "Mobile_no": "+8801815017661",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2278",
      "ENAME": "Tajul Islam",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "0",
      "Mobile_no": "+8801712756024",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2393",
      "ENAME": "Md. Amin Mia",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "2355",
      "Mobile_no": "+8801916266352",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2394",
      "ENAME": "Md. Ibrahim Khalil",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "0",
      "Mobile_no": "+8801722 425542",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2395",
      "ENAME": "Md. Abu Toha",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "0",
      "Mobile_no": "+8801550 005188",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2396",
      "ENAME": "Md. Khairul Alam Rasel",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Business Studies Group",
      "ID": "2352",
      "Mobile_no": "+8801915998068",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "134",
      "ENAME": "Muhammad Nurul Islam",
      "Designation": "Assistant Controller of Examinations",
      "DEPT_NAME": "Business Studies Group",
      "ID": "0",
      "Mobile_no": "+8801760 494199",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2113",
      "ENAME": "Sayed Abe Abdullah",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "0",
      "Mobile_no": "+88???????????",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2288",
      "ENAME": "Bethika Rani Das",
      "Designation": "Upper Division Assistant",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "2246",
      "Mobile_no": "+8801757535254",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "113",
      "ENAME": "Md. Lutfor Rahman",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "194",
      "ENAME": "Md. Kabir Hossain",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2249",
      "ENAME": "Tousif Islam khokon",
      "Designation": "M.L.S.S",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "2247",
      "Mobile_no": "+8801846285588",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "63",
      "ENAME": "Md. Raisul Anam",
      "Designation": "Director (In Charge)",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "295",
      "Mobile_no": "+880258150651",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1991",
      "ENAME": "Dr. Alak Kumar Saha",
      "Designation": "Director",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "2163",
      "Mobile_no": "+8801715577705",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "552",
      "ENAME": "Md. Zafor Ali Khan",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "0032",
      "Mobile_no": "+8801511430255",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1755",
      "ENAME": "Mostak Ahmad",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Barishal Regional Office",
      "ID": "0",
      "Mobile_no": "+8801833776040",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2031",
      "ENAME": "Md. Abu Baker",
      "Designation": "Web-Master",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "2056",
      "Mobile_no": "+8801797735801",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2037",
      "ENAME": "Susanta Acharjee",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "2004",
      "Mobile_no": "+8801552352059",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "2385",
      "ENAME": "M. A. Rana",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "2350",
      "Mobile_no": "+8801791815647",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2049",
      "ENAME": "Md. Shamsul Alam",
      "Designation": "Sub Technical Officer",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "2005",
      "Mobile_no": "+8801839393971",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "2389",
      "ENAME": "S M Ziaul Bashir",
      "Designation": "Senior Programmer",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "2348",
      "Mobile_no": "+8801712186535",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2028",
      "ENAME": "Esmot Ara",
      "Designation": "Programmer",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "1996",
      "Mobile_no": "+8801554819906",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2517",
      "ENAME": "Md Muhaimenur Rahman",
      "Designation": "Asst. Programmer",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2519",
      "ENAME": "Sajib Kumar Mondal",
      "Designation": "Asst. Programmer",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "574",
      "ENAME": "Mohammad Manir Hossain",
      "Designation": "Assistant Registrar (Computer)",
      "DEPT_NAME": "Admission & Registration Cell",
      "ID": "0103",
      "Mobile_no": "+8801554545516",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1945",
      "ENAME": "Md. Mohibul Hasan",
      "Designation": "Technical Officer",
      "DEPT_NAME": "Administration",
      "ID": "1908",
      "Mobile_no": "+8801915726576",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1911",
      "ENAME": "Newtan Halder",
      "Designation": "Law Officer",
      "DEPT_NAME": "Administration",
      "ID": "1935",
      "Mobile_no": "+8801911874759",
      "Blood_Group": "AB+",
      "image": "www.google.com"
    },
    {
      "PF": "1912",
      "ENAME": "Israt Jahan Shammy",
      "Designation": "Law Officer",
      "DEPT_NAME": "Administration",
      "ID": "1936",
      "Mobile_no": "+8801718564333",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "55",
      "ENAME": "Md. Shahazamal",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Administration",
      "ID": "369",
      "Mobile_no": "+8801552342638",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "655",
      "ENAME": "Mohammad Safiqul Islam",
      "Designation": "Deputy Registrar",
      "DEPT_NAME": "Administration",
      "ID": "0556",
      "Mobile_no": "+8801715702273",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "291",
      "ENAME": "Md. Waziar Rahman",
      "Designation": "Deputy Director",
      "DEPT_NAME": "Administration",
      "ID": "424",
      "Mobile_no": "+8801716088914",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "170",
      "ENAME": "Md. Salim",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Administration",
      "ID": "0445",
      "Mobile_no": "+8801712798088",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "337",
      "ENAME": "Jahanara Begum",
      "Designation": "Asst. Registrar",
      "DEPT_NAME": "Administration",
      "ID": "0056",
      "Mobile_no": "+8801914733228",
      "Blood_Group": "A+",
      "image": "www.google.com"
    },
    {
      "PF": "1910",
      "ENAME": "Md. Nazrul Islam",
      "Designation": "Assistant Registrar (Law)",
      "DEPT_NAME": "Administration",
      "ID": "0",
      "Mobile_no": "+8801777015208",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "20",
      "ENAME": "Md. Mujibur Rahman",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Administration",
      "ID": "0",
      "Mobile_no": "+8801552552762",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "590",
      "ENAME": "Md. Ali Hossain",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Administration",
      "ID": "0",
      "Mobile_no": "+8801740972281",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "656",
      "ENAME": "Md. Ezazul Hoq Hawlader",
      "Designation": "Assistant Director",
      "DEPT_NAME": "Administration",
      "ID": "508",
      "Mobile_no": "+8801717564994",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1988",
      "ENAME": "Dr. Abu Md. Iqbal Rumi Shah",
      "Designation": "Professor",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "2600",
      "Mobile_no": "+8801715138625",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1984",
      "ENAME": "Nepa Zahan",
      "Designation": "Lecturer",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "0",
      "Mobile_no": "+8801758572107",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "2020",
      "ENAME": "Sayeda Fatima",
      "Designation": "Lecturer",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "2249",
      "Mobile_no": "+8801711829501",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "2534",
      "ENAME": "Robiul Haque",
      "Designation": "Lecturer",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "0",
      "Mobile_no": "+88",
      "Blood_Group": "NA",
      "image": "www.google.com"
    },
    {
      "PF": "1855",
      "ENAME": "Dr. A. N. M. Fazlul Hoque",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "1850",
      "Mobile_no": "+8801824516088",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "2021",
      "ENAME": "Ahmmed Shorif",
      "Designation": "Associate Professor",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "2338",
      "Mobile_no": "+8801782353571",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1814",
      "ENAME": "Dr. Jagannath Barua",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "1822",
      "Mobile_no": "+8801313-052365",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
    {
      "PF": "1860",
      "ENAME": "Dr. Md. Eahea",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "1852",
      "Mobile_no": "+8801743 711498",
      "Blood_Group": "B+",
      "image": "www.google.com"
    },
    {
      "PF": "1980",
      "ENAME": "Md. Sala Uddin",
      "Designation": "Assistant Professor",
      "DEPT_NAME": "Academic Committee of Arts Group",
      "ID": "1957",
      "Mobile_no": "+8801675254636",
      "Blood_Group": "O+",
      "image": "www.google.com"
    },
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  Timer? _timer;

  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () {
      List<Map<String, dynamic>> results = [];
      if (enteredKeyword.isEmpty) {
        results = _allUsers;
      } else {
        results = _allUsers
            .where((user) =>
                user["ENAME"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["PF"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["Designation"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["Mobile_no"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["Blood_Group"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["DEPT_NAME"]
                    .toString()
                    .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
      setState(() {
        _foundUsers = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search Employee"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.1),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(hintText: "Search..."),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_foundUsers[index]["ENAME"]),
                    subtitle: Text(_foundUsers[index]["Designation"]),
                    onTap: () {
                      // launch(_foundUsers[index]['Mobile_no']);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('' + _foundUsers[index]['ENAME'] ?? ''),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Designation: ' +
                                        _foundUsers[index]['Designation'] ??
                                    ''),
                                Text(
                                    'PF No: ' + _foundUsers[index]['PF'] ?? ''),
                                Text('Blood Group: ' +
                                        _foundUsers[index]['Blood_Group'] ??
                                    ''),
                                Text('Mobile No: ' +
                                        _foundUsers[index]['Mobile_no'] ??
                                    ''),

                                SizedBox(height: 10), // add some spacing
                                Text('Department: ' +
                                        _foundUsers[index]['DEPT_NAME'] ??
                                    ''),
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: Text('Call'),
                                onPressed: () {
                                  // Add your code here to call the mobile number
                                  launch(
                                      'tel:${_foundUsers[index]['Mobile_no']}');
                                },
                              ),

                              TextButton(
                                child: Text('SMS'),
                                onPressed: () {
                                  // Add your code here to send an SMS to the mobile number
                                  launch(
                                      'sms:${_foundUsers[index]['Mobile_no']}');
                                },
                              ),

/*
                              TextButton(
    child: Text('Email'),
    onPressed: () {
      launch('mailto:${_foundUsers[index]['Email']}',);
    },
  ),

  */

                              TextButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  //  launch(
                                  //    'tel:${_foundUsers[index]['Mobile_no']}');
                                },
                              ),
                              ////////////////////////

                              //////////////////////
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
