import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:io';

class collegelists extends StatefulWidget {
  const collegelists({super.key});

  @override
  State<collegelists> createState() => _collegelistsState();
}

class _collegelistsState extends State<collegelists>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0101",
      "college_name": "GOVT. P. C. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0102",
      "college_name": "SHERE BANGLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0103",
      "college_name": "BAGERHAT GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0104",
      "college_name": "RAMPAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0105",
      "college_name": "GILATALA ABUL KALAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0106",
      "college_name": "MORELGANJ SIRAJUDDIN MEMO. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0107",
      "college_name": "KAZI AZHAR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0108",
      "college_name": "KHALILUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0109",
      "college_name": "SHARANKHOLA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0110",
      "college_name": "MONGLA GOVT.  COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0111",
      "college_name": "ROWSHAN ARA SMRITI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0112",
      "college_name": "KACHUA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0113",
      "college_name": "SUNDARBAN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0114",
      "college_name": "FAKIRHAT FAZILATUNNESSA MUJIB MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0115",
      "college_name": "A. R. KHAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0116",
      "college_name": "SHAHID SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0117",
      "college_name": "SHAHID SHEIKH ABU NASER MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0118",
      "college_name": "DIGRAJ DEGREE MAHAVIDYALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0119",
      "college_name": "BAGERHAT LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0120",
      "college_name": "D. MIA ABBAS UDDIN TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0121",
      "college_name": "GOVT. PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0122",
      "college_name": "BELAYET HOSSAIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0123",
      "college_name": "BELAYAT HOSSAIN B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0124",
      "college_name": "KHAN JAHAN ALI TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0125",
      "college_name": "SALIMABAD DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0126",
      "college_name": "SHEIKH HELAL UDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0127",
      "college_name": "KALIDAS BARAL SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0128",
      "college_name": "BANGABANDHU MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0129",
      "college_name": "KHAN JAHAN ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0130",
      "college_name": "BANGABANDHU MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0201",
      "college_name": "SATKHIRA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0202",
      "college_name": "SATKHIRA DAY\/NIGHT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0203",
      "college_name": "SATKHIRA CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0204",
      "college_name": "SATKHIRA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0205",
      "college_name": "KUMIRA MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0206",
      "college_name": "ASSASUNI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0207",
      "college_name": "SHAYMNAGAR GOVT. MOHSIN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0208",
      "college_name": "KALIGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0209",
      "college_name": "KOLAROA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0210",
      "college_name": "KHAN BAHADUR AHSANULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0211",
      "college_name": "TALA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0212",
      "college_name": "MUNSHIGONG COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0213",
      "college_name": "BHALUKA CHANDPUR ADRASHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0214",
      "college_name": "SHIMANTA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0215",
      "college_name": "RAHIMA EZAHAR MEMORIAL B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0216",
      "college_name": "NALTA AHSANIA MISSION RESIDENTIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0217",
      "college_name": "SUNDERBAN SCIENCE AND BUSINESS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0218",
      "college_name": "BANGABONDHU MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0219",
      "college_name": "KAZIRHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0220",
      "college_name": "SHALIKHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0236",
      "college_name": "SHEIKH AMANULLAH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0237",
      "college_name": "SHAHID SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0238",
      "college_name": "ROKEYA MANSUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0239",
      "college_name": "SHAMNAGAR ATARJAN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0240",
      "college_name": "TALA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0241",
      "college_name": "HAJI KEYAMUDDIN MEMORIAL MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0242",
      "college_name": "KATUNIA RAJBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0243",
      "college_name": "SHAHEED MUKTIJODHYA MAHABIDYALYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0244",
      "college_name": "NAWABENKI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0245",
      "college_name": "SAFURANNESSA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0246",
      "college_name": "SATKHIRA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0247",
      "college_name": "KALARUA SHIKKHAK PROSHIKHAN COLLEGE, KALARUA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0248",
      "college_name": "SATKHIRA SHIKKHAK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0249",
      "college_name": "A. P. S. MAHABIDDALOY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0250",
      "college_name": "SUNDARBON SHIKKHOK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0251",
      "college_name": "KALARUA PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0252",
      "college_name": "ADVOCATE ABDUR RAHMAN COLLEGE, BINERPOTA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0253",
      "college_name": "KAZI ALAUDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0254",
      "college_name": "DEBHATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0255",
      "college_name": "JHAUDANGA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0256",
      "college_name": "HAZI WAZED ALI TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0257",
      "college_name": "ASSASUNI MOHILLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0258",
      "college_name": "PATKELGHAT HARUN-OR-RASHID COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0259",
      "college_name": "SHUVASHINI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0260",
      "college_name": "HAZI NASIRUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0261",
      "college_name": "SONAR BANGLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0262",
      "college_name": "SHAHEED ZIAUR RAHMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0263",
      "college_name": "BEGUM KHALEDA ZIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0264",
      "college_name": "BOALIA MUKTIJODDAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0265",
      "college_name": "DRM UNITED IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0266",
      "college_name": "SUNDARBAN COLLEGE OF TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "SATKHIRA",
      "college_code": "0267",
      "college_name": "COLLEGE OF EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0307",
      "college_name": "RAYERMOHAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0308",
      "college_name": "METROPOLITAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0309",
      "college_name": "KHANJAHAN ALI COLLEGE OF SCIENCE &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0310",
      "college_name": "KOYRA GOVERNMENT MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0311",
      "college_name": "ALAIPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0312",
      "college_name": "KHULNA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0313",
      "college_name": "AZAM KHAN COMMERCE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0314",
      "college_name": "AHSANULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0315",
      "college_name": "GOVT. SUNDARBAN ADARSHA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0316",
      "college_name": "M. M. CITY COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0317",
      "college_name": "SHAHID SUHRAWARDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0318",
      "college_name": "RUPSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0319",
      "college_name": "PIONEER GOVERNMENT MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0320",
      "college_name": "HAJI ABDUL MALEK ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0321",
      "college_name": "GOVT. HAJI MD. MOHSIN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0322",
      "college_name": "GOVT. B. L. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0323",
      "college_name": "MOHSIN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0324",
      "college_name": "DAULATPUR DAY\/NIGHT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0325",
      "college_name": "BAJUA SURENDRANATH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0326",
      "college_name": "M. A. MAJID COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0327",
      "college_name": "NORTH KHULNA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0328",
      "college_name": "DUMURIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0329",
      "college_name": "BATIAGHATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0330",
      "college_name": "SHAHPUR MADHUGRAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0331",
      "college_name": "FULTALA M. M. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0332",
      "college_name": "PAIKGACHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0333",
      "college_name": "KAPILMUNI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0334",
      "college_name": "BANGA BANDHU COLLEGE, BELFULIA",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0335",
      "college_name": "ALHAJ SARWAR KHAN COLLEGE, KHULNA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0336",
      "college_name": "SABURANNESA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0337",
      "college_name": "FASIAR RAHMAN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0338",
      "college_name": "KHAN SHAHEB KOMORUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0339",
      "college_name": "SHAHID SMRITI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0340",
      "college_name": "PHULTALA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0341",
      "college_name": "KHULNA ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0342",
      "college_name": "KHANJAHAN ALI ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0343",
      "college_name":
          "INSTITUTE OF LIBRARY, ARTS, COMMERCE &amp; SCIENCE (ILACS)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0344",
      "college_name": "KHULNA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0345",
      "college_name": "MOULANA BHASHANI MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0346",
      "college_name": "CITY GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0347",
      "college_name": "KHULNA INSTITUTE OF TECHNOLOGY AND MANAGEMENT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0348",
      "college_name": "GOVT. L. B. K. DEGREE WOMEN'S COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0349",
      "college_name": "SHAHEED AYUB &amp; MUSA MEMORIAL (DEGREE) COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0350",
      "college_name": "AKIJ INSTITUTE OF TECHNOLOGY KHULNA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0351",
      "college_name": "CITY LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0352",
      "college_name": "CENTRAL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0353",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0354",
      "college_name": "SAROWAR KHAN TEACHERES' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0355",
      "college_name": "INSTITUTE OF EDUCATION LIBRARY AND MANAGEMENT (IELAM)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0356",
      "college_name":
          "INSTITUTE OF LIBRARY, ARTS, COMMERCE AND SCIENCE (ILACS), KHULNA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0357",
      "college_name": "KHULNA ART COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0358",
      "college_name": "SHAHID ABUL KASHEM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0359",
      "college_name": "CHALNA MOBARAK MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0360",
      "college_name": "AMIRUL ISLAM KAGOJI TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0361",
      "college_name": "POLLISREE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0362",
      "college_name": "KAPOTAKSHMA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0363",
      "college_name": "CHALNA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0364",
      "college_name": "CHUKNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0365",
      "college_name": "HORIDHALI KAPILMUNI MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0366",
      "college_name": "MAHESHWARPASHA SHAHID ZIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0401",
      "college_name": "NARAIL GOVT. VICTORIA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0402",
      "college_name": "ABDUL HAYEE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0403",
      "college_name": "SHAHID ABDUS SALAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0404",
      "college_name": "LOHAGARA GOVT. ADARSHA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0405",
      "college_name": "MUNSHI MANIK MIAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0406",
      "college_name": "NABOGANGA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0407",
      "college_name": "LAKSHMIPASHA ADARSHA DEGREE WOMENS' COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0408",
      "college_name": "MIRZAPUR UNITED DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0409",
      "college_name": "S. M. A. AHAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0410",
      "college_name": "MAIJPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0411",
      "college_name": "MONORANJAN KAPURIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0412",
      "college_name": "SM SULTAN BENGAL CHARUKALA MOHABIDYALAY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "NARAIL",
      "college_code": "0413",
      "college_name": "NARAIL GOVT MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0501",
      "college_name": "M. M. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0502",
      "college_name": "KAZI NAZRUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0503",
      "college_name": "SHAHID SIRAJUDDIN HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0504",
      "college_name": "UPASHAHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0505",
      "college_name": "JESSORE CANTONMENT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0506",
      "college_name": "JESSORE GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0507",
      "college_name": "JESSORE GOVT. CITY COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0508",
      "college_name": "MONIRAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0509",
      "college_name": "MONIRAMPUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0510",
      "college_name": "KESHABPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0511",
      "college_name": "HAZI ABDUL MOTALEB MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0512",
      "college_name": "JHICKERGACHHA SHAHID MASHIUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0513",
      "college_name": "CHOWGACHHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0514",
      "college_name": "NAVARON DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0515",
      "college_name": "DR. AFIL UDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0516",
      "college_name": "NOAPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0517",
      "college_name": "MASHIAHATI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0518",
      "college_name": "SINGIA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0519",
      "college_name": "BAGHARPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0520",
      "college_name": "BANKRA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0521",
      "college_name": "CHOWGACHA MRIDHAPARA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0522",
      "college_name": "HAMIDPUR AL-HERA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0523",
      "college_name": "TALBARIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0524",
      "college_name": "NAWAPARA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0525",
      "college_name": "MUKTIJODDHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0526",
      "college_name": "UPASHAHAR MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0527",
      "college_name": "BANGLADESH COMPUTER AND MANAGEMENT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0528",
      "college_name": "JESSORE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0529",
      "college_name": "SHAMMILANY MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0530",
      "college_name": "JHIKORGACHA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0531",
      "college_name": "GANGANANDAPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0532",
      "college_name": "MUKTESWARI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0533",
      "college_name": "KAPATACKHA SHAMMILANI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0534",
      "college_name": "GOVT. BIR SHRESTHA NOOR MOHAMMAD DEGREE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0535",
      "college_name": "SAMMILANI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0536",
      "college_name": "FAZILATUNNESA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0537",
      "college_name": "SALUA ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0538",
      "college_name": "S.M.R. LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0539",
      "college_name": "A. B. C. D. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0540",
      "college_name": "HIZAL DANGA SHAHID FLIGHTLT. MASUD MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0541",
      "college_name": "BENAPOLE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0542",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0543",
      "college_name": "MUNSHI MEHERULLAH TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0544",
      "college_name": "JESSORE SHIKKHAK PROSHIKHAN COLLEGE, PALBARI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0545",
      "college_name": "AMDABAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0546",
      "college_name": "NOAPARA MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0547",
      "college_name": "NARIKEL BARIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0548",
      "college_name": "KESHABPUR PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0549",
      "college_name": "JESSORE PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0550",
      "college_name": "UPASHAHAR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0551",
      "college_name": "BANGLADESH SOUTH WEST MODEL INSTITUTE, JESSORE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0552",
      "college_name": "S.M. SULTAN FINE ART COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0553",
      "college_name": "BANGLADESH AIR FORCE ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0554",
      "college_name": "RUPDIA SHAHEED SMRITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0555",
      "college_name": "RAJGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0556",
      "college_name": "NATUNHAT PUBLIC COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0557",
      "college_name": "BAGHAR PARA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0558",
      "college_name": "VANGURA ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0559",
      "college_name": "MIRJAPUR ADARSHA WOMEN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0560",
      "college_name": "BAGACHRA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0561",
      "college_name": "PAKSHIA IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0562",
      "college_name": "BIRPROTIK ISHAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0563",
      "college_name": "PANJIA MAHAVIDYALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0564",
      "college_name": "DR. ABDUR RAZZAK MUNICIPAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0565",
      "college_name": "SHIMULIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0566",
      "college_name":
          "SOUTHERN INSTITUTE OF BUSINESS AND INFORMATION TECHNOLOGY (SIBIT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0567",
      "college_name": "GABKHALI MAGURA UNITED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0568",
      "college_name": "BHABADAHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0601",
      "college_name": "GOVT. K. C. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0602",
      "college_name": "SAILKUPA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0603",
      "college_name": "GOVT. LALAN SHAH COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0604",
      "college_name": "GOVT. NURUNNAHAR MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0605",
      "college_name": "JHENAIDAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0606",
      "college_name": "KHONDOKAR MOSHARRAF HOSSAIN GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0607",
      "college_name": "MAHESHPUR GOVERNMENT DEGREE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0608",
      "college_name": "MAHTABUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0609",
      "college_name": "SHEIKPARA DUKHI MAHMUD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0610",
      "college_name": "KOTCHANDPUR POURA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0611",
      "college_name": "AMINA KHATUN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0612",
      "college_name": "S. D. DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0613",
      "college_name": "JARIP BISWAS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0614",
      "college_name": "MIA ZINNAH ALAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0615",
      "college_name": "A. ROUF DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0616",
      "college_name": "SHEIKH HASINA PADMA PUKUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0617",
      "college_name": "RAICHARAN TARINICHARAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0618",
      "college_name": "SHAHEED ZIAUR RAHMAN LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0619",
      "college_name": "SALEHA BEGUM MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0620",
      "college_name": "MOHESHPUR POURO MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0621",
      "college_name": "SHAHID ZIA-UR RAHMAN COLLEGE, FATEPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0622",
      "college_name": "SHAILKUPA CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0623",
      "college_name": "MD. SHAHIDUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0624",
      "college_name": "BIDWA SAGAR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0625",
      "college_name": "JHENAIDAH ADARSHA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0626",
      "college_name": "MUKTIJADDAH MOSHIUR RAHMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0627",
      "college_name": "ALHAZ AMZAD ALI AND FAIZUR RAHMAN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0628",
      "college_name": "ADIL UDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0629",
      "college_name": "BANGABANDHU MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0630",
      "college_name": "G. T. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0631",
      "college_name": "KATLAGARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0632",
      "college_name": "GOVT. BIRSHRESTHA SHAHID HAMIDUR RAHMAN DEGREE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0633",
      "college_name": "SHAILKUPA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0634",
      "college_name": "HAZI ARSHAD ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0635",
      "college_name": "DR. SAIFUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0636",
      "college_name": "AL-HAZ MOSIUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0637",
      "college_name":
          "JATEER JANAK BANGABANDHU SHEIKH MUGIB MEMORIAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0638",
      "college_name": "KOTCHANDPUR POURO COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0639",
      "college_name": "BAROBAZAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0701",
      "college_name": "GOVT. H. S. S. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0702",
      "college_name": "SREEPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0703",
      "college_name": "AMINUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0704",
      "college_name": "AMARESH BASU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0705",
      "college_name": "BONAGATI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0706",
      "college_name": "ARPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0707",
      "college_name": "NAZIR AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0708",
      "college_name": "MAGURA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0709",
      "college_name": "KAZI SALIMA HAQUE MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0710",
      "college_name": "NAKOL SAMMILANY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0711",
      "college_name": "G. K. IDEAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0712",
      "college_name": "BINODPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0713",
      "college_name": "MAGURA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0714",
      "college_name": "MAGURA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0715",
      "college_name": "DARIAPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0716",
      "college_name": "BIHARILAL SHIKDER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0717",
      "college_name": "MAGURA GOVT. MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0718",
      "college_name": "BABUKHALI ARDARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0719",
      "college_name": "JAGDAL SOMMILONY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0801",
      "college_name": "CHUADANGA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0802",
      "college_name": "ADARSHA MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0803",
      "college_name": "CHUADANGA POURA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0804",
      "college_name": "ALAMDANGA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0805",
      "college_name": "M. S. ZOHA DEGREE COLLEGE, ALAMDANGA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0806",
      "college_name": "DARSHANA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0807",
      "college_name": "JIBON NAGAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0808",
      "college_name": "ABDUL WADUD SHAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0809",
      "college_name": "ALAMDANGA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0810",
      "college_name": "BADARGONJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0811",
      "college_name": "NIGAR SIDDIK DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0812",
      "college_name": "JIBANNAGAR ADARSHA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0813",
      "college_name": "KHASHKARARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0814",
      "college_name": "BOROSOLUA NEW MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0815",
      "college_name": "KARPASHDANGA MAHABIDDYALYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0901",
      "college_name": "MEHERPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0902",
      "college_name": "MEHERPUR GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0903",
      "college_name": "MUJIBNAGAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0904",
      "college_name": "GANGNI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0905",
      "college_name": "GANGNI MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0906",
      "college_name": "MEHERPUR PAURA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0907",
      "college_name": "TERAIL-JOREPUKURIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0908",
      "college_name": "KAZIPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0909",
      "college_name": "A. R. B. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MEHERPUR",
      "college_code": "0910",
      "college_name": "KARAMDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1001",
      "college_name": "KUSHTIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1002",
      "college_name": "KUSHTIA ADARSHA DEGREE MAHABIDYALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1003",
      "college_name": "KUSHTIA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1004",
      "college_name": "KUSHTIA ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1005",
      "college_name": "KUMARKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1006",
      "college_name": "KHOKSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1007",
      "college_name": "SHOMSPUR ABU TALEB DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1008",
      "college_name": "BHERAMARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1009",
      "college_name": "BHERAMARA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1010",
      "college_name": "DAULATPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1011",
      "college_name": "PEOPLES COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1012",
      "college_name": "AMLA GOVT. DEGREE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1013",
      "college_name": "MIRPUR MAHAMUDA CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1014",
      "college_name": "BANSHGRAM ALAUDDIN AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1015",
      "college_name": "HALSA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1016",
      "college_name": "PHILIP NAGAR MARICHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1017",
      "college_name": "KHOLISHA KUNDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1018",
      "college_name": "BHERAMARA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1019",
      "college_name": "KUMARKHALI ADARSHA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1020",
      "college_name": "NASIRUDDIN BISWAS MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1021",
      "college_name": "NURUZZAMAN BISWAS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1022",
      "college_name": "ALAUDDIN AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1023",
      "college_name": "SHELAIDAH BISHWAKABI RABINDRANATH TAGORE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1024",
      "college_name": "DR. MD. FAZLUL HAQUE GIRLS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1025",
      "college_name": "MIRPUR MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1026",
      "college_name": "KUSHTIA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1027",
      "college_name": "ALLAUDDIN AHMED TEACHERS' TRAINING COLLEGE, KUMARKHALI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1028",
      "college_name": "B. J. M. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1029",
      "college_name": "KUSHTIA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1030",
      "college_name": "ALAUDDIN AHMMED PHYSICAL INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1031",
      "college_name": "KUSHTIA PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1032",
      "college_name": "AL-HAJ SAIDUR RAHMAN MONTU WOMEN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1033",
      "college_name": "SYED MAS-UD RAMY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1034",
      "college_name": "PANTI MAHABIDDALOY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1035",
      "college_name": "COLLEGE OF BUSINESS ADMINISTRATION AND TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1036",
      "college_name": "KUSHTIA HAZI ABUL HOSSAIN INSTITUTE OF TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1037",
      "college_name": "MOHISHKUNDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1038",
      "college_name": "KHATER ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1039",
      "college_name": "PORADAH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1040",
      "college_name": "DHOKRAKOL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1041",
      "college_name": "SHAGAR KHALI ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSHTIA",
      "college_code": "1042",
      "college_name": "DAULATPUR GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1101",
      "college_name": "GOVT. B. M. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1102",
      "college_name": "AMRITLAL DEY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1103",
      "college_name": "SYED BAZLUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1104",
      "college_name": "HAJI TAHERUDDIN ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1105",
      "college_name": "BARISAL CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1106",
      "college_name": "ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1107",
      "college_name": "BARISAL GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1108",
      "college_name": "BEGUM TOFAZZAL HOSSAIN MANIK MIAH MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1109",
      "college_name": "BARISAL GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1110",
      "college_name": "GOVT. SYED HATEM ALI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1111",
      "college_name": "GOVT. BAKERGONJ COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1112",
      "college_name": "SYED AFSAR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1113",
      "college_name": "GOURNADI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1114",
      "college_name": "PATARHAT R. C. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1115",
      "college_name": "FUZLUL HUQ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1116",
      "college_name": "BANARIPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1117",
      "college_name": "ABUL KALAM COLLEGE, RAKUDIA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1118",
      "college_name": "KALASHKATHI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1119",
      "college_name": "HAZRAT ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1120",
      "college_name": "MULADI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1121",
      "college_name": "HIZLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1122",
      "college_name": "SHAHEED ABDUR ROB SERNIABAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1123",
      "college_name": "UJIRPUR AL HAJ B. N. KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1124",
      "college_name": "DHAMURA COLLEGE, BARISAL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1125",
      "college_name": "SHER-E-BANGLA DEGREE COLLEGE, SHIKARPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1126",
      "college_name": "BABUGANJ DEGREE COLLEGE, BABUGANJ",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1127",
      "college_name": "AGARPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1128",
      "college_name": "SHAHID ZIAUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1129",
      "college_name": "NAZIRPUR UNITED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1130",
      "college_name": "CHARKALEKHAN ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1131",
      "college_name": "ULANIA MUZAFFAR KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1132",
      "college_name": "C. N. B. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1133",
      "college_name": "MAHILARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1134",
      "college_name": "SHAHID SMARANIKA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1135",
      "college_name": "BARAKOTHA UNION DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1136",
      "college_name": "GUTHIA IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1137",
      "college_name": "BARISAL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1138",
      "college_name": "BEGUM SAMSUDDIN TALUKDER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1139",
      "college_name": "COLLEGE OF EDUCATION (B. ED.)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1140",
      "college_name":
          "GOVT. SHAHID ABDUR ROUB SERNIABAD TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1141",
      "college_name": "COLLEGE OF EDUCATION (B. P. ED.)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1142",
      "college_name": "INSTITUTE OF LIBRARY AND INFORMATION SCIENCE, BARISAL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1143",
      "college_name": "SYED AZIZUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1144",
      "college_name": "BARISAL INSTITUTE OF INFORMATION TECHNOLOGY (BIIT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1145",
      "college_name": "HELALUDDIN AHMMOD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1146",
      "college_name": "MAHENDIGONJ MOHILA MOHABIDHALAY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1147",
      "college_name": "BARTHI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1148",
      "college_name": "M. A. MALEK DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1149",
      "college_name": "GOVT. PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1150",
      "college_name": "BISHARKANDI SHER-E-BANGLA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1151",
      "college_name": "ARIF MAHMUD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1152",
      "college_name": "ATAHAR UDDIN HOWLADER DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1153",
      "college_name": "UJIRPUR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1154",
      "college_name": "AKOTA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1155",
      "college_name": "NIZAMUDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1156",
      "college_name": "BARISAL INFORMATION TECHNOLOGY COLLEGE (BITC)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1157",
      "college_name": "KABAI UNION ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1158",
      "college_name": "HAZI SYED BODRUL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1201",
      "college_name": "SUHRAWARDI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1202",
      "college_name": "PEROJPUR GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1203",
      "college_name": "KAUKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1204",
      "college_name": "HEMAYET UDDIN COLLEGE, GUATON",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1205",
      "college_name": "BHANDARIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1207",
      "college_name": "BHANDARIA MAJIDA BEGUM MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1208",
      "college_name": "GOVT. SWARUPKATHI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1209",
      "college_name": "NAZIRPUR SHAHID ZIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1210",
      "college_name": "MATIBHANGA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1211",
      "college_name": "MOTHBARIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1212",
      "college_name": "KABI GURU RABINDRA NATH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1213",
      "college_name": "ZIANAGAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1214",
      "college_name": "SAFA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1215",
      "college_name": "AFTABUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1216",
      "college_name": "SHAHID SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1217",
      "college_name": "MOHIUDDIN AHMED WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1218",
      "college_name": "RAJBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1219",
      "college_name": "MOTHBARIA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1220",
      "college_name": "DR. RUSTUM ALI FARAJI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1221",
      "college_name": "PEROJPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1222",
      "college_name": "PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1223",
      "college_name": "PEROJPUR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1224",
      "college_name": "AMANULLAH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1225",
      "college_name": "FAZILA RAHMAN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1226",
      "college_name": "PACHIM SHOHAGDAL SHAHID SMRITY B. M. DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1227",
      "college_name": "KAUKHALI MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1301",
      "college_name": "JHALOKATHI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1302",
      "college_name": "SHERE BANGLA FAZLUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1303",
      "college_name": "NOLCHHITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1304",
      "college_name": "Z. A. BHUTTO COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1305",
      "college_name": "TOFAZZAL HOSSAIN MANIK MIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1306",
      "college_name": "SHAHID RAJA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1307",
      "college_name": "JHALOKATHI MOHILA COLLEGE, JHALOKATHI",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1308",
      "college_name": "ALHAJ LALMON HAMID WOMEN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1309",
      "college_name": "RAJAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1310",
      "college_name": "COLLEGE OF EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1311",
      "college_name": "DOPDOPIA UNIOUN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1312",
      "college_name": "BARAIYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1313",
      "college_name": "MONOSWITA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1314",
      "college_name": "ABDUL MALEQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1401",
      "college_name": "BHOLA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1402",
      "college_name": "NAZIUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1403",
      "college_name": "TAZUMUDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1404",
      "college_name": "SHEIKH FAZILATUNNESSA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1405",
      "college_name": "DAULATKHAN ABU ABDULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1406",
      "college_name": "ABDUL JABBAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1407",
      "college_name": "CHARFASSION GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1408",
      "college_name": "KORIMUNNESSA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1409",
      "college_name": "SHAHBAJPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1410",
      "college_name": "FATEMA MATIN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1411",
      "college_name": "DULAR HAT ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1412",
      "college_name": "ALTAZER RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1413",
      "college_name": "BORHANUDDIN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1414",
      "college_name": "MANPURA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1415",
      "college_name": "DR. AZAHAR UDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1416",
      "college_name": "RASULPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1417",
      "college_name": "BANKERHAT CO-OPERATIVE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1418",
      "college_name": "ELISHA ISLAMIA MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1419",
      "college_name": "BANGLA BAZAR FATEMA KHANAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1420",
      "college_name": "BHOLA ADAKHA NAZRUL ISLAM TEACHER'S TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1421",
      "college_name": "HALIMA KHATUN MOHILA MOHABIDHALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1422",
      "college_name": "DHALIGOURNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1423",
      "college_name": "REBA RAHMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1424",
      "college_name": "ZANATA BAZAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1425",
      "college_name": "BEGUM RAHIMA ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1501",
      "college_name": "PATUAKHALI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1502",
      "college_name": "PATUAKHALI MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1503",
      "college_name": "MAUKARAN B. L. P. DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1504",
      "college_name": "JANATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1505",
      "college_name": "IDRIS MOLLAH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1506",
      "college_name": "ABDUL KARIM MRIDHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1507",
      "college_name": "GALACHIPA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1508",
      "college_name": "MOZAHARUDDIN BISWAS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1509",
      "college_name": "SUBIDKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1510",
      "college_name": "BAUFAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1511",
      "college_name": "DR. YAKUB SHARIF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1512",
      "college_name": "KOLAGACHIA S. M. SAKENDAR ALI CHOWDHURY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1513",
      "college_name": "KALISURI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1514",
      "college_name": "KACHIPARA MD. ABDUR RASHID MIAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1515",
      "college_name": "GALACHIPA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1516",
      "college_name": "AKHTAR HOSSAIN CHOUDHURY MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1517",
      "college_name": "PATUAKHALI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1518",
      "college_name": "DAKSHINBANGA TEACHERS' TRAINING COLLEGE, MOWKARAN",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1519",
      "college_name": "DAKSHINBANGA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1520",
      "college_name": "PATUAKHALI TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1521",
      "college_name": "PATUAKHALI PHYSICAL TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1522",
      "college_name": "MOHAMMED ISHAQUE MODEL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1523",
      "college_name": "ABDUR RASHID TALUKDER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1524",
      "college_name": "DHANKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1525",
      "college_name": "SUBIDKHALI MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1526",
      "college_name": "ABDUR RASHID KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1527",
      "college_name": "HAZI MOKTER ALI MRIDHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1528",
      "college_name": "ENGINEER FARUK TALUKDER MOHILLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1529",
      "college_name": "DHARANDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1530",
      "college_name": "KHARIZZAMA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1531",
      "college_name": "AZIZ AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1532",
      "college_name": "PATUAKHALI LIBRARY AND INFORMATION SCIENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1533",
      "college_name": "KALAPARA MOHILLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1534",
      "college_name": "KESHABPUR MAHAVIDYALA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1535",
      "college_name": "KUAKATA KHANABAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1536",
      "college_name": "HAZI AKKEL ALI HOWLADER DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1537",
      "college_name": "MUKTIJHODDHA MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1601",
      "college_name": "BARGUNA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1602",
      "college_name": "SYED FAZLUL HAQUE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1603",
      "college_name": "BARGUNA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1604",
      "college_name": "BETAGI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1605",
      "college_name": "BAMNA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1606",
      "college_name": "AMTALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1607",
      "college_name": "TALTALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1608",
      "college_name": "BEGUM FAIZUNNESSA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1609",
      "college_name": "LALMIA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1610",
      "college_name": "EUNUS ALI KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1611",
      "college_name": "PATHARGHATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1612",
      "college_name": "H. S. S. LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1613",
      "college_name": "HALTA DAWATALA WAZED ALI KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1614",
      "college_name": "BAKULNESSA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARGUNA",
      "college_code": "1615",
      "college_name": "HAZI JALAL UDDIN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1701",
      "college_name": "M. C. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1702",
      "college_name": "HAZRAT SHAHJALAL (RA.) COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1703",
      "college_name": "TAJPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1704",
      "college_name": "BHADESWAR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1705",
      "college_name": "GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1706",
      "college_name": "MOINUDDIN ADARSHA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1707",
      "college_name": "SYLHET GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1708",
      "college_name": "MADAN MOHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1709",
      "college_name": "BEANIBAZAR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1710",
      "college_name": "FENCHUGANJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1711",
      "college_name": "DHAKA DAKSHIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1712",
      "college_name": "GOAIN GHAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1713",
      "college_name": "KANAI GHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1714",
      "college_name": "DAKSHIN SURMA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1715",
      "college_name": "RAGIB-RABEYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1716",
      "college_name": "JAINTAPUR TAYOB ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1717",
      "college_name": "BALAGONJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1718",
      "college_name": "AKIJ INSTITUTE OF TECHNOLOGY, SYLHET",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1719",
      "college_name": "SYLHET LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1720",
      "college_name": "JALALABAD TEACHERS' TRAINING COLLEGE, UPASHAHAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1721",
      "college_name": "METROPOLITAN LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1722",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1723",
      "college_name": "SHAH KHURROM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1724",
      "college_name": "JAINTIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1725",
      "college_name": "NOORJAHAN MEMORIAL WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1726",
      "college_name": "SHIMANTIK IDEAL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1727",
      "college_name": "BEANIBAZAR ADARSHA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1728",
      "college_name": "BISWANATH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1729",
      "college_name": "LATIFA-SHAFI CHOUDHURY WOMEN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1730",
      "college_name": "ISAMOTI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1731",
      "college_name": "SHAHPORAN INSTITUTE OF BUSINESS AND TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1732",
      "college_name": "HAFSA MAZUMDER MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1733",
      "college_name": "IMRAN AHMAD WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1734",
      "college_name": "GOALABAZAR ADARSHA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1735",
      "college_name": "M. SAIFUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1736",
      "college_name": "JALALPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1737",
      "college_name": "DAYAMIR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1738",
      "college_name": "BAROHAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1739",
      "college_name": "AL-EMDAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1740",
      "college_name": "GACHHBARI IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1741",
      "college_name": "ZAASS INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1742",
      "college_name": "BOIRAGIBAZAR IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1801",
      "college_name": "BRINDABAN GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1802",
      "college_name": "CHUNARUGHAT GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1803",
      "college_name": "SAISTAGANJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1804",
      "college_name": "JANAB ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1805",
      "college_name": "SYED SAIDUDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1806",
      "college_name": "HABIGANJ MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1807",
      "college_name": "NABIGANJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1808",
      "college_name": "INATHGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1809",
      "college_name": "ALIF SHUBHAN CHOWDHUARY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1810",
      "college_name": "SHACHINDRA COLLEGE, NAGURA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1811",
      "college_name": "SHAHJALAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1812",
      "college_name": "AJMIRIGANJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1813",
      "college_name": "HABIGANJ LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1814",
      "college_name": "BAHUBAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1815",
      "college_name": "SUFIA MATIN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1816",
      "college_name": "DHARMAGHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "HABIGANJ",
      "college_code": "1817",
      "college_name": "MUKTIJODDHA ZIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1901",
      "college_name": "SUNAMGANJ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1902",
      "college_name": "JAMALGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1903",
      "college_name": "DERAI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1904",
      "college_name": "CHHATAK MAHABIDDYALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1905",
      "college_name": "GOBINDOGANJ ABDUL HAQUE SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1906",
      "college_name": "DIGENDRA BARMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1907",
      "college_name": "DHARMA PASHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1908",
      "college_name": "BADSHAGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1909",
      "college_name": "JAGANNATHPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1910",
      "college_name": "JAWA BAZAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1911",
      "college_name": "JANATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1912",
      "college_name": "BADAGHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1913",
      "college_name": "SUNAMGANJ GOVT. WOMENS COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1914",
      "college_name": "DUARABAZAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1915",
      "college_name": "BIBIANA MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1916",
      "college_name": "ISLAMGONJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1917",
      "college_name": "SULLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2001",
      "college_name": "MOULVIBAZAR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2002",
      "college_name": "BARALEKHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2003",
      "college_name": "MOULVIBAZAR MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2004",
      "college_name": "RAJNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2005",
      "college_name": "KOMOLGANJ GANO COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2006",
      "college_name": "SREEMANGAL GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2007",
      "college_name": "KULAURA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2008",
      "college_name": "TAIBUNNESSA KHANOM ACADEMY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2009",
      "college_name": "YAKUB TAJUL MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2010",
      "college_name": "DWARIKA PAUL MOHILA COLLEGE, SRIMANGAL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2011",
      "college_name": "NARI SHIKKA ACADEMY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2012",
      "college_name": "LUNGLA ADHUNIK DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2013",
      "college_name": "MOULANA MOFAZZAL HOSSAIN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2014",
      "college_name": "SYED SHAH MOSTAFA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2015",
      "college_name": "ALHAJ MD MOKLISUR RAHMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2101",
      "college_name": "GOVT. EDWARD COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2102",
      "college_name": "SHAHID BULBUL GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2103",
      "college_name": "BASHER BADA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2104",
      "college_name": "PABNA COLLEGE (DAY\/NIGHT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2105",
      "college_name": "PABNA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2106",
      "college_name": "HAJI JAMALUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2107",
      "college_name": "MD. YASIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2108",
      "college_name": "BERA COLLEGE, PABNA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2109",
      "college_name": "SANTHIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2110",
      "college_name": "SHAHEED NURUL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2111",
      "college_name": "MADHPUR AMENA KHATUN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2112",
      "college_name": "GOVERNMENT ISWARDI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2113",
      "college_name": "PAKSHI RAILWAY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2114",
      "college_name": "CHATMOHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2115",
      "college_name": "ISWARDI MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2116",
      "college_name": "DASHURIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2117",
      "college_name": "MIRZAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2118",
      "college_name": "MANJUR KADER MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2119",
      "college_name": "DEBOTTAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2120",
      "college_name": "HAJI JASHIMUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2121",
      "college_name": "CHAIKOLA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2122",
      "college_name": "SAMSUL HUDA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2123",
      "college_name": "DR. ZAHURUL KAMAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2124",
      "college_name": "PROFESSOR BOYEN UDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2125",
      "college_name": "KHIDIRPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2126",
      "college_name": "SHAHID M. MANSUR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2127",
      "college_name": "PARKHIDIR PUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2128",
      "college_name": "CHATMOHAR WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2129",
      "college_name": "PABNA ISLAMIA (DEGREE) COLLEGE, PABNA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2130",
      "college_name": "SANTHIA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2131",
      "college_name": "SHAHID AMINUDDIN LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2132",
      "college_name": "PABNA B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2133",
      "college_name": "PABNA ADARSHA B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2134",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2135",
      "college_name": "PAKSHI COLLEGE OF PHYSICAL EDUCATION, PAKSHI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2136",
      "college_name": "SELIM REZA HABIB DEGREE COLLEGE, MALIFA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2137",
      "college_name":
          "PABNA AL-AMANA ADARSHA LIBRARY AND INFORMATION SCIENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2138",
      "college_name": "DULAURI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2139",
      "college_name": "CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2140",
      "college_name": "EUNUS ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2141",
      "college_name": "ATGHORIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2142",
      "college_name": "DENGERGRAM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2143",
      "college_name": "MASHUNDIA BHAWANIPUR K. J. B. DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2144",
      "college_name": "NIZAMUDDIN ASGAR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2145",
      "college_name": "JORGACHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2146",
      "college_name": "KASHINATHPUR WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2147",
      "college_name": "NAKALIA MONJUR KADER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2148",
      "college_name": "SUJANAGAR WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2149",
      "college_name": "MOHILA COLLEGE BHANGOORA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2150",
      "college_name": "SATBARIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "PABNA",
      "college_code": "2151",
      "college_name": "SALIMPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2201",
      "college_name": "SIRAJGANJ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2202",
      "college_name": "ISLAMIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2203",
      "college_name": "RASHIDAZZOHA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2204",
      "college_name": "MAULANA BHASANI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2205",
      "college_name": "HAJI KORAP ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2206",
      "college_name": "CHOWHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2207",
      "college_name": "KAZIPUR MANSUR ALI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2208",
      "college_name": "ABDULLAH AL MAHMUD DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2209",
      "college_name": "R. I. M. COLLEGE, TENGLAHATA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2210",
      "college_name": "GOVT. AKBAR ALI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2211",
      "college_name": "HAJI WAHED MARIAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2212",
      "college_name": "SALONGA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2213",
      "college_name": "TARASH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2214",
      "college_name": "SHAHJADPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2215",
      "college_name": "JAMIRTA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2216",
      "college_name": "BELKUCHI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2217",
      "college_name": "NURUNNAHAR TARKABAGISH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2219",
      "college_name": "SATBARIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2220",
      "college_name": "GHORASAL SAHITTIK BARKAT ULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2221",
      "college_name": "AFZAL HOSSAIN MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2222",
      "college_name": "JAMUNA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2223",
      "college_name": "NATUARPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2224",
      "college_name": "MOWLANA SAIFUDDIN YAHIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2225",
      "college_name": "CHOWBARI DR. SALAM JAHANARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2226",
      "college_name": "KONABARI SHAHIDUL BULBUL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2227",
      "college_name": "TARASH MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2228",
      "college_name": "GULTA BAZAR SHAHID M. MANSUR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2229",
      "college_name": "NEEM GACHHI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2230",
      "college_name": "ZINDANI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2231",
      "college_name": "DOBILA ISLAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2232",
      "college_name": "AMINA MANSUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2233",
      "college_name": "SHIMLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2234",
      "college_name": "KAMARKHAND WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2235",
      "college_name": "ALHAJ FORHAD ALI MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2236",
      "college_name": "JATIYO TARUN SANGO BARA PANGASHI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2237",
      "college_name": "FULJORE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2238",
      "college_name": "SIMANTA BAZAR MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2239",
      "college_name": "SHAHZADPUR WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2240",
      "college_name": "CHALITADANGA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2241",
      "college_name": "GANDHAIL IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2242",
      "college_name": "DOWLATPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2243",
      "college_name": "BANGABONDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2244",
      "college_name": "ULLAPARA BIGGAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2245",
      "college_name": "UDGARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2246",
      "college_name": "SIRAJGONJ LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2247",
      "college_name": "SIRAJGONJ B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2248",
      "college_name": "RAJAB ALI MEMORIAL BIGGAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2249",
      "college_name": "RAJAPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2250",
      "college_name": "BELKUCHI BAHUMUKHI WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2251",
      "college_name": "H.T. IMAM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2252",
      "college_name": "BANGABANDHU MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2253",
      "college_name": "KARATOA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2254",
      "college_name": "PRINCIPAL ABUL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2255",
      "college_name": "D.K.B.U COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2256",
      "college_name": "GAZAIL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2257",
      "college_name": "SALAP COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2258",
      "college_name": "RAIGONJ UPAZILA SADAR DHANGRARA WOMENS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2259",
      "college_name": "GHONA KUCHIAMARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2260",
      "college_name": "KHAMARGRAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2261",
      "college_name": "DADPUR G R COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2262",
      "college_name": "RAJMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2263",
      "college_name": "GRAMPANGASHI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2301",
      "college_name": "N. S. GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2302",
      "college_name": "KHUBJIPUR MOZAMMEL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2303",
      "college_name": "RANI BHAWANI GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2304",
      "college_name": "DIGHAPATIA M. K. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2305",
      "college_name": "GOL-E-AFROZ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2306",
      "college_name": "BONPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2307",
      "college_name": "BAGATIPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2308",
      "college_name": "GURUDASPUR BILCHALAN SHAHID SHAMSUZZOHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2309",
      "college_name": "ABDULPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2310",
      "college_name": "GOPALPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2311",
      "college_name": "BARAIGRAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2312",
      "college_name": "SHAHID NAZMUL HAQUE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2313",
      "college_name": "KALAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2314",
      "college_name": "MOHORKOYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2315",
      "college_name": "TAMALTALA KRISHI &amp; KARIGARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2316",
      "college_name": "JAMNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2317",
      "college_name": "BANSHBARIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2318",
      "college_name": "GOPALPUR WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2319",
      "college_name": "ROHMOT IQBAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2320",
      "college_name": "MOUKHARA ISLAMIA WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2321",
      "college_name": "RAZAPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2322",
      "college_name": "SHEIKH FAZILATUNNESA MUZIB WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2323",
      "college_name": "BAGATIPARA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2324",
      "college_name": "DATTAPARA MODEL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2325",
      "college_name": "BILL HALTI TRIMOHONI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2326",
      "college_name": "NAZIRPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2327",
      "college_name": "MADHNAGAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2328",
      "college_name": "ROSEY MOZAMMEL WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2329",
      "college_name": "AHAMMEDPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2330",
      "college_name": "ZONAIL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2331",
      "college_name": "NATORE CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2332",
      "college_name": "SAILKONA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2333",
      "college_name": "NATORE TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2334",
      "college_name": "NATORE MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2335",
      "college_name": "SINGRA CHALANBIL WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2336",
      "college_name": "KHALISHA DANGA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2337",
      "college_name": "KAFURIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2338",
      "college_name": "LALPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2339",
      "college_name": "AHAMEDPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2340",
      "college_name": "QADIRABAD CANTONMENT SAPPER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2401",
      "college_name": "NAOGAON GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2402",
      "college_name": "NAZIPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2403",
      "college_name": "BANGABANDHU GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2404",
      "college_name": "NAOGAON GOVT. B. M. C. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2405",
      "college_name": "MOLLAH AZAD MEMO. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2406",
      "college_name": "SAPAHAR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2407",
      "college_name": "MANDA MOMEN SAHANA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2408",
      "college_name": "NEAMATPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2409",
      "college_name": "JAHANGIRPUR COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2410",
      "college_name": "PORSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2411",
      "college_name": "DHAMOIRHAT M. M. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2412",
      "college_name": "GANGURIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2413",
      "college_name": "UTTARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2414",
      "college_name": "CHOWDHURY CHAND MOHAMMAD MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2415",
      "college_name": "CHAKULI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2416",
      "college_name": "RANINAGHAR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2417",
      "college_name": "BANDAIKHARA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2418",
      "college_name": "BALIHAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2419",
      "college_name": "CHANDASH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2420",
      "college_name": "FOYEZ UDDIN MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2421",
      "college_name": "CHOWRAT SHIBPUR BARANDRA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2422",
      "college_name": "NAOGAON LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2423",
      "college_name": "BALATOIR SIDDIQUE HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2424",
      "college_name": "DHAMOIRHAT WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2425",
      "college_name": "BADALGACHI MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2426",
      "college_name": "DASHPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2427",
      "college_name": "SHER-E-BANGLA MAHAVIDYALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2428",
      "college_name": "NAOGAON ASTAN MOLLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2429",
      "college_name": "ATRAI WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2430",
      "college_name": "GOBAR CHAPAHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2431",
      "college_name": "RAIGOAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2432",
      "college_name": "KOLA ADORSHO COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2433",
      "college_name": "NAZIPUR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2434",
      "college_name": "TILNA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2435",
      "college_name": "KRISHNAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2436",
      "college_name": "DIGHIRHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2501",
      "college_name": "RAJSHAHI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2502",
      "college_name": "RAJSHAHI GOVT. CITY COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2503",
      "college_name": "SHAH MAKHDUM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2504",
      "college_name": "ADARSHA COLLEGE, SHYAMPOR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2505",
      "college_name": "RAJSHAHI COURT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2506",
      "college_name": "RAJSHAHI NEW GOVT. DEGREE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2507",
      "college_name": "RAJSHAHI GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2508",
      "college_name": "MADARBAKSH HOME ECONOMICS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2509",
      "college_name": "BHABANIGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2510",
      "college_name": "TAHERPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2511",
      "college_name": "DURGAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2512",
      "college_name": "DAOKANDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2513",
      "college_name": "TANOR ABDUL KARIM SARKAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2514",
      "college_name": "LALIT MOHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2515",
      "college_name": "GODAGARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2516",
      "college_name": "MOHANPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2517",
      "college_name": "BANESWAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2518",
      "college_name": "SHAHDOWLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2519",
      "college_name": "PUTHIA LASKARPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2520",
      "college_name": "ARANI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2521",
      "college_name": "SARDAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2522",
      "college_name": "PRAMTALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2523",
      "college_name": "NOWHATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2524",
      "college_name": "CHARGHAT M. A. HADI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2525",
      "college_name": "TANOR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2526",
      "college_name": "MACHMAIL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2527",
      "college_name": "PANIA NARDASH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2528",
      "college_name": "GODAGARI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2529",
      "college_name": "DHOKRAKUL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2530",
      "college_name": "PUTHIA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2531",
      "college_name": "IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2532",
      "college_name": "PUTHIA ISLAMIA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2533",
      "college_name": "HATKANPARA JOBEDA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2534",
      "college_name": "SHOLUA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2535",
      "college_name": "KESHARHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2536",
      "college_name": "METROPOLITAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2537",
      "college_name": "ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2538",
      "college_name": "BANGABANDHU COLLEGE, BOALIA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2539",
      "college_name": "INSTITUTE OF BUSINESS ADMINSTRATION (IBA)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2540",
      "college_name": "HATGANGOPARA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2541",
      "college_name": "SREEPUR RAMNAGAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2542",
      "college_name": "MOHONGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2543",
      "college_name": "MATIKATA ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2544",
      "college_name": "KALIGONJ HAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2545",
      "college_name": "NAOHATA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2546",
      "college_name": "HAT RAMCHANDRAPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2547",
      "college_name": "ATRAI AGRANI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2548",
      "college_name": "POCHAMARIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2549",
      "college_name": "BAKTIARPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2550",
      "college_name": "NANDANGACHHI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2551",
      "college_name": "SARANJAI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2552",
      "college_name": "DHOPAGHATA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2553",
      "college_name": "BHBANIGONJ WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2554",
      "college_name": "MOZAHAR HOSSAIN MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2555",
      "college_name": "DAKRA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2556",
      "college_name": "KAMELA HAQUE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2557",
      "college_name": "MOHANPUR GIRL'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2558",
      "college_name": "AKIJ INSTITUTE OF TECHNOLOGY RAJSHAHI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2559",
      "college_name": "DURGAPUR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2560",
      "college_name": "MOHABBATPUR KHANPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2561",
      "college_name": "SHYAMPUR HAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2562",
      "college_name": "YOUSUFPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2563",
      "college_name": "RAJSHAHI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2564",
      "college_name": "CENTRAL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2565",
      "college_name": "PUNGU SHISU NIKATON SHAMONNITO ABOYTONIK COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2567",
      "college_name": "HAJI JAMIR UDDIN SHAFINA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2568",
      "college_name": "AL-HAJ ERSHAD ALI WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2569",
      "college_name": "ADARSHA SHIKKHAK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2570",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2571",
      "college_name": "PROGRESSIVE TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2572",
      "college_name": "UTTARBANGA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2573",
      "college_name": "CHARGHAT WOMENS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2574",
      "college_name": "SAGRAM MAJHI MEMORIAL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2575",
      "college_name": "GOVT. PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2576",
      "college_name": "ALI IMAM PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2577",
      "college_name": "SHAHID ZIAUR RAHMAN PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2578",
      "college_name":
          "INSTITUTE FOR LIBRARY AND INFORMATION STUDIES (ILIS), RAJSHAHI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2579",
      "college_name":
          "BANGLADESH COLLEGE OF TECHNOLOGY AND EDUCATION, RAJSHAHI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2580",
      "college_name": "RAJSHAHI ART COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2581",
      "college_name": "DHOPAPARA MEMOREAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2582",
      "college_name": "PARAGON INSTITUTE OF BUSINESS &amp; ARTS (PIBA)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2583",
      "college_name": "RAJABARI DEGREE MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2584",
      "college_name": "SHAHID A.H.M. KAMARUZZAMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2585",
      "college_name": "MONDUMALA WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2586",
      "college_name": "SALEHA-EMARAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2587",
      "college_name": "KAKONHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2588",
      "college_name": "FAZAR ALI MOLLA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2589",
      "college_name": "ALHAZ SUJAUDDAWLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2590",
      "college_name": "BAGMARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2591",
      "college_name": "NASIRGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2592",
      "college_name": "SAYEDPUR MOCHMOIL WOMENS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2593",
      "college_name": "KRISHNAPUR ADARSHA WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2594",
      "college_name": "HAROGRAM MODEL BUSINESS INSTITUTE (HMBI)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2595",
      "college_name": "MOHANPUR MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2596",
      "college_name": "JHALUKA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2597",
      "college_name": "KOYEL ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2601",
      "college_name": "NAWABGANJ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2602",
      "college_name": "SHAH NEAMATULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2603",
      "college_name": "CHAPAI NAWABGANJ MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2604",
      "college_name": "NACHOLE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2605",
      "college_name": "ADINA FAZLUL HAQUE GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2606",
      "college_name": "BINODPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2607",
      "college_name": "SHIBGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2608",
      "college_name": "KANSAT SOLEMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2609",
      "college_name": "SHIBGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2610",
      "college_name": "KRISHNA GOBINDAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2611",
      "college_name": "ALLAHBAKSH MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2612",
      "college_name": "ROHANPUR YUSUF ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2613",
      "college_name": "MAHIPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2614",
      "college_name": "GOMOSTAPUR SOLEMAN MIAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2615",
      "college_name": "BHOLAHAT MOHBULLAH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2616",
      "college_name": "SHAHBAJPUR SONAMASHJID DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2617",
      "college_name": "BALUGRAM ADORSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2618",
      "college_name": "BIRSHERSTHA CAPTAIN MOHIUDDIN JAHANGIR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2619",
      "college_name": "BHOLAHAT MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2620",
      "college_name": "RADHAKANTAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2621",
      "college_name": "NACHOLE WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2622",
      "college_name": "NAMOSONKARBATI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2623",
      "college_name": "NAWABGONJ LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2624",
      "college_name": "ROHANPUR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2625",
      "college_name": "SHYAMPUR HAZI MOMTAJ MIAH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2626",
      "college_name": "NAWABGANJ CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2627",
      "college_name": "ALHAJ ABDUS SAMAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2628",
      "college_name": "RANIHATI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2629",
      "college_name": "SHAHID SRETI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2630",
      "college_name": "JAMBARIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2701",
      "college_name": "GOVT. AZIZUL HAQUE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2702",
      "college_name": "GABTALI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2703",
      "college_name": "GOVT. NAZIR AKHTER COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2704",
      "college_name": "ADAM DIGHI RAHIMUDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2705",
      "college_name": "BOGRA GOVT. MUJIBUR RAHMAN MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2706",
      "college_name": "CANTT. PUBLIC COLLEGE, BOGRA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2707",
      "college_name": "GOVT. SHAH SULTAN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2708",
      "college_name": "SHIBGANJ M. H. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2709",
      "college_name": "MAHASTHAN MAHISAWAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2710",
      "college_name": "NAMUJA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2711",
      "college_name": "SHERPUR COLLEGE, BOGRA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2712",
      "college_name": "SYED AHMED COLLEGE, SUKHANPUKUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2713",
      "college_name": "SANTAHAR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2714",
      "college_name": "NASRATPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2715",
      "college_name": "KAHALU DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2716",
      "college_name": "DHUNAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2717",
      "college_name": "SARIAKANDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2718",
      "college_name": "CHANDAN BAISHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2719",
      "college_name": "DUP CHANCHIA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2720",
      "college_name": "BOGRA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2721",
      "college_name": "TOWN CLUB PUB. LIB. MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2722",
      "college_name": "MANSUR HOSSAIN COLLEGE, NANDIGRAM",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2723",
      "college_name": "JOYLAJUAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2724",
      "college_name": "GOSHAIBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2725",
      "college_name": "SHAHID AHSANUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2726",
      "college_name": "ADARSHA COLLEGE, BOGRA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2727",
      "college_name": "DARGAHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2728",
      "college_name": "MOKAMTALA MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2729",
      "college_name": "SHAHID M. MANSUR ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2730",
      "college_name": "COMPUTER SCIENCE AND BUSINESS STUDIES INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2731",
      "college_name": "NOONGOLA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2732",
      "college_name": "SHAHID ZIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2733",
      "college_name": "AZIZUL HOQUE MEMORIAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2734",
      "college_name": "KAHALU ADARSHA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2735",
      "college_name": "BALUAHAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2736",
      "college_name": "DHUNAT MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2737",
      "college_name": "G. M. C. DEGREE COLLEGE, MOTHURAPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2738",
      "college_name": "DURGAHATTA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2739",
      "college_name": "CHHAIHATA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2740",
      "college_name": "HATKARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2741",
      "college_name": "PIROB UNITED DEGREE COLLEGE, SHIHALI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2742",
      "college_name": "NANDIGRAM MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2743",
      "college_name": "ZAHIDUR RAHMAN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2744",
      "college_name": "BOGRA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2745",
      "college_name": "RAHIMA-NAWSHER ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2746",
      "college_name": "SHAHID MOSTAFIZUR RAHMAN B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2747",
      "college_name": "SHAHID MUNAYEM HOSSAIN B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2748",
      "college_name": "BOGRA B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2749",
      "college_name": "SHAHID MOSTAFIZUR RAHMAN B. P. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2750",
      "college_name": "BOGRA T. H. B. P. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2751",
      "college_name": "BOGRA B. P. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2752",
      "college_name": "S. B. SCIENCE AND TECHNOLOGY COLLEGE, BOGRA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2753",
      "college_name": "BOGRA ART COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2754",
      "college_name": "BOGRA LIBRARY SCIENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2755",
      "college_name": "INSTITUTE OF NORTH BENGAL B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2756",
      "college_name": "DUP CHANCHIA J. K. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2757",
      "college_name": "TASLIM UDDIN TARAFDER DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2758",
      "college_name": "SONAHATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2759",
      "college_name": "JALSUKA HABIBUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2760",
      "college_name": "DUBLAGARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2761",
      "college_name": "TARANIRHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2762",
      "college_name": "KAMAR UDDIN ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2763",
      "college_name": "NORTH INSTITUTE OF BUSINESS &amp; SCIENCE (NIBS)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2764",
      "college_name": "DR. ENAMUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2765",
      "college_name": "JANATA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2766",
      "college_name": "CHOWDHURI ADARSHA WOMENS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2767",
      "college_name": "SONATOLA BEGUM FOJILATUNNECHHA MUJIB MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2768",
      "college_name": "PROFESSIONAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2801",
      "college_name": "JOYPURHAT GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2802",
      "college_name": "MAHIPUR HAJI MOHSIN GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2803",
      "college_name": "JOYPURHAT GOVT. MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2804",
      "college_name": "SAYEED ALTAFUNNESA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2805",
      "college_name": "AKKELPUR M. R. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2806",
      "college_name": "MONGOLBARI M. M. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2807",
      "college_name": "KALAI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2808",
      "college_name": "AMDOI UNITED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2809",
      "college_name": "KALAI MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2810",
      "college_name": "PANCHBIBI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2811",
      "college_name": "NURNAGAR UNITED DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2812",
      "college_name": "JOYPURHAT LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2813",
      "college_name": "CONFIDENCE TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2814",
      "college_name": "JOYPURHAT B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2815",
      "college_name": "JOYPURHAT MOHABIDYALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2816",
      "college_name": "AKKELPUR WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2817",
      "college_name": "JAMALGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2818",
      "college_name": "JAIPURHAT WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2819",
      "college_name": "TILAKPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2820",
      "college_name": "SARAIL ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "JOYPURHAT",
      "college_code": "2821",
      "college_name": "MODERN INSTITUTE OF LIBRARY &amp; INFORMATION SCIENCE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2901",
      "college_name": "LALMONIRHAT GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2902",
      "college_name": "MAJIDA KHATUN MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2903",
      "college_name": "ADITMARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2904",
      "college_name": "KARIMUDDIN PUBLIC COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2905",
      "college_name": "JASUMUDDIN KAZI A. GHANI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2906",
      "college_name": "HATIBANDHA ALIMUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2907",
      "college_name": "UTTAR BANGLA COLLEGE, KAKINA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2908",
      "college_name": "SHAMSUDDIN KAMARUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2909",
      "college_name": "SAPTIBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2910",
      "college_name": "TEESTA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2911",
      "college_name": "HATIBANDHA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2912",
      "college_name": "LALMONIRHAT ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2913",
      "college_name": "PATGRAM ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2914",
      "college_name": "PATGRAM WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2915",
      "college_name": "LALMONIRHAT LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2916",
      "college_name": "SHAHED ABUL KASHEM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2917",
      "college_name": "BEGUM KAMRUNNESSA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2918",
      "college_name": "DAIKHAWA ADERSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2919",
      "college_name": "BARAKHATA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2920",
      "college_name": "UTTRAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "LALMONIRHAT",
      "college_code": "2921",
      "college_name": "TUSHBHANDAR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3001",
      "college_name": "KURIGRAM GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3002",
      "college_name": "ULIPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3003",
      "college_name": "RAJIBPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3004",
      "college_name": "ULIPUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3005",
      "college_name": "KURIGRAM GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3006",
      "college_name": "MIR ISMAIL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3007",
      "college_name": "NAGESWARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3008",
      "college_name": "NAGESWARI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3009",
      "college_name": "BHURUNGAMARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3010",
      "college_name": "ROWMARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3011",
      "college_name": "CHILMARI COLLEGE, KURIGRAM",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3012",
      "college_name": "PHOOLBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3013",
      "college_name": "MAJIDA ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3014",
      "college_name": "BHETERBANDH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3015",
      "college_name": "CHILMARI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3016",
      "college_name": "GOLAM HABIB MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3017",
      "college_name": "KOTCHAKATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3018",
      "college_name": "PULLBARI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3019",
      "college_name": "RAIGONJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3020",
      "college_name": "PANCHPIR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3021",
      "college_name": "BHURUNGAMARI MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3022",
      "college_name": "RAJARHAT MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3023",
      "college_name": "KURIGRAM LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3024",
      "college_name": "KANTHAL BARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3025",
      "college_name": "KURIGRAM TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3026",
      "college_name": "ROWMARI WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3027",
      "college_name": "KASHIPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3028",
      "college_name": "SHONAHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3029",
      "college_name": "CHARSHOULMARI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3030",
      "college_name": "GUNAIGACHH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3031",
      "college_name": "BOZRA L K AMIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3032",
      "college_name": "JADURCHAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3101",
      "college_name": "NILPHAMARI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3102",
      "college_name": "CHILAHATI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3103",
      "college_name": "NILPHAMARI GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3104",
      "college_name": "DOMAR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3105",
      "college_name": "JOLDHAKA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3106",
      "college_name": "SAIDPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3107",
      "college_name": "DIMLA ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3108",
      "college_name": "MASHIUR RAHMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3109",
      "college_name": "SHIMUL BARI BANGA BANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3110",
      "college_name": "CHANDERHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3111",
      "college_name": "SONAROY SONGOLSHI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3112",
      "college_name": "DOMAR WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3113",
      "college_name": "KAMARPUKUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3114",
      "college_name": "DIMLA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3115",
      "college_name": "JANATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3116",
      "college_name": "SAIDPUR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3117",
      "college_name": "RABEYA CHAWDHURY WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3118",
      "college_name": "KISORIGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3119",
      "college_name": "NILPHAMARI TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3120",
      "college_name": "TISTA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3121",
      "college_name": "MIRGONJ HAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3122",
      "college_name": "PALASHBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3123",
      "college_name": "TENGONMARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3124",
      "college_name": "RADHARANI MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3125",
      "college_name": "GOMNATI MOHABIDDALAY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3126",
      "college_name": "ANORMARI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3201",
      "college_name": "CARMICHAEL COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3202",
      "college_name": "SHYAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3203",
      "college_name": "GANGACHARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3204",
      "college_name": "DHAPERHAT MONIKRISHNA SEN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3205",
      "college_name": "CANTT. PUBLIC COLLEGE, RANGPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3206",
      "college_name": "GOVT. BEGUM ROKEYA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3207",
      "college_name": "RANGPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3208",
      "college_name": "MAHIGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3209",
      "college_name": "ANONDALOK COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3210",
      "college_name": "SHAH ABDUR ROUF COLLEGE, PEERGANJ",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3211",
      "college_name": "BADARGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3212",
      "college_name": "KAUNIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3213",
      "college_name": "PEERGACHHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3214",
      "college_name": "TARAGANJ W. E. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3215",
      "college_name": "MITHAPUKUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3216",
      "college_name": "HARAGACHH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3217",
      "college_name": "SATHIBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3218",
      "college_name": "KAUNIA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3219",
      "college_name": "PEERGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3220",
      "college_name": "BADARGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3221",
      "college_name": "RANGPUR MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3222",
      "college_name": "MAWLANA KERAMAT ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3223",
      "college_name": "SHUKURERHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3224",
      "college_name": "MIRZAPUR BASIRUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3225",
      "college_name": "CHAWKESABPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3226",
      "college_name": "BHENDA BARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3227",
      "college_name": "PAIRABANDH BEGUM ROKEYA SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3228",
      "college_name": "CHATRA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3229",
      "college_name": "RADHAKRISHNAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3230",
      "college_name": "KUTUBPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3231",
      "college_name": "PEERGACHHA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3232",
      "college_name": "BALARHAT ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3233",
      "college_name": "MIRBAGH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3234",
      "college_name": "DEVI CHOWDHURANI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3235",
      "college_name": "BAKSHIGANJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3236",
      "college_name": "BAIRATI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3237",
      "college_name": "KHALASHPIR BANGABANDHU DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3238",
      "college_name": "AKHIRAHAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3239",
      "college_name": "DELTA COMPUTER SCIENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3240",
      "college_name": "GANGACHARA WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3241",
      "college_name": "EKARCHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3242",
      "college_name": "RANGPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3243",
      "college_name": "RANGPUR ADARSHA B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3244",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3245",
      "college_name": "RANGPUR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3246",
      "college_name": "RANGPUR B. P. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3247",
      "college_name": "PAKURIA SHARIF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3248",
      "college_name": "HARAGACH MODEL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3249",
      "college_name": "RAHIM UDDIN BHARASA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3250",
      "college_name": "CHHARAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3251",
      "college_name": "LALDIGHI PIRPAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3252",
      "college_name": "NORTHBENGAL INSTITUTE OF DEVELOPMENT STUDIES (NIDS)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3253",
      "college_name": "UPOMA INSTITUTE OF SCIENCE AND TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3301",
      "college_name": "GAIBANDHA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3302",
      "college_name": "GAIBANDHA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3303",
      "college_name": "GAIBANDHA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3304",
      "college_name": "BONARPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3305",
      "college_name": "SUNDARGANJ D. W. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3306",
      "college_name": "KAMDIA NURUL HAQUE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3307",
      "college_name": "GOVINDAGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3308",
      "college_name": "GOVINDAGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3309",
      "college_name": "SADULLAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3310",
      "college_name": "NOLDANGA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3311",
      "college_name": "PALASHBARI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3312",
      "college_name": "POLASH BARI ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3313",
      "college_name": "SHAH AJGAR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3314",
      "college_name": "SUNDARGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3315",
      "college_name": "DHARMAPUR ABDUL JABBAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3316",
      "college_name": "BELKA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3317",
      "college_name": "SAGHATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3318",
      "college_name": "PHOOLCHHARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3319",
      "college_name": "SHAHARGACHI ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3320",
      "college_name": "TULSHI GHAT SHAMSOL HAQUE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3321",
      "college_name": "SOBHAGANJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3322",
      "college_name": "KONCHIPARA MAHABIDYALAY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3323",
      "college_name": "GAIBANDHA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3324",
      "college_name": "SADULLAPUR GIRL'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3325",
      "college_name": "GOBINDAGANJ SHIKKHAK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3326",
      "college_name":
          "SAFIA-ASAB B. P. ED. &amp; LIBRARY &amp; INFORMATION SCIENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3327",
      "college_name": "FAKIRHAT SHAHID SMRITI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3328",
      "college_name": "HAJI OSMAN GANI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3329",
      "college_name": "MOHIMAGONJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3330",
      "college_name": "DHUBNI KANCHIBARI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3331",
      "college_name": "BAMANDANGA ABDUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3332",
      "college_name": "MOHIPUR BAZAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3333",
      "college_name": "UDAYAN WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3334",
      "college_name": "PALASHBARI WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3401",
      "college_name": "DINAJPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3402",
      "college_name": "PARBATIPUR ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3403",
      "college_name": "DINAJPUR GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3404",
      "college_name": "NAWABGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3405",
      "college_name": "K. B. M. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3406",
      "college_name": "ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3407",
      "college_name": "DAUDPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3408",
      "college_name": "PARBATIPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3409",
      "college_name": "BIROL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3410",
      "college_name": "PHOOLBARI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3411",
      "college_name": "BIRAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3412",
      "college_name": "AFTABGANJ DEGREE COLLEGE, NAWABGANJ",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3413",
      "college_name": "NAWABGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3414",
      "college_name": "HAKIMPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3415",
      "college_name": "GHORAGHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3416",
      "college_name": "RANIGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3417",
      "college_name": "BIRGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3418",
      "college_name": "SETABGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3419",
      "college_name": "ICHHAMATI COLLEGE, RANIRBANDAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3420",
      "college_name": "CHIRIBANDER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3421",
      "college_name": "PAKERHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3422",
      "college_name": "BHABANIPUR COLLEGE, PARBATIPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3423",
      "college_name": "AMBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3424",
      "college_name": "MOGARPARA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3425",
      "college_name": "BIRAMPUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3426",
      "college_name": "GHORAGHAT MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3427",
      "college_name": "PANCHBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3428",
      "college_name": "PHOOLBARI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3429",
      "college_name": "SHAHID SMRITI ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3430",
      "college_name": "MAINUL HASSAN MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3431",
      "college_name": "KHOLAHATI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3432",
      "college_name": "PARBATIPUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3433",
      "college_name": "HAKIMPUR WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3434",
      "college_name": "JOYNANDA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3435",
      "college_name": "DINAJPUR SANGEET COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3436",
      "college_name": "MONMATHPUR IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3437",
      "college_name": "ICHHAMOTI WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3438",
      "college_name": "KAHAROL WOMENS DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3439",
      "college_name": "KATLA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3440",
      "college_name": "HOSENPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3441",
      "college_name": "DINAJPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3442",
      "college_name": "PARBATIPUR B.ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3443",
      "college_name": "DINAJPUR SHIKKHAK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3444",
      "college_name": "CHANDGANG DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3445",
      "college_name": "KHANSAMA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3446",
      "college_name": "KAHAROL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3447",
      "college_name": "BIRGONJ MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3448",
      "college_name": "BIRAL MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3449",
      "college_name": "GOLAPGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3450",
      "college_name": "KARENTHAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3451",
      "college_name": "DEOGAON BOKULTALA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3452",
      "college_name": "KHANSAMA WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3453",
      "college_name": "PURBA MOLLIKPUR WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3454",
      "college_name": "KANCHAN NEW MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3455",
      "college_name": "JAGATPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3456",
      "college_name": "AFTABGANJ MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3457",
      "college_name": "BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3458",
      "college_name": "HATRAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3459",
      "college_name": "DAXMIN KOTOALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3501",
      "college_name": "SHIBGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3502",
      "college_name": "THAKURGAON GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3503",
      "college_name": "THAKURGAON GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3504",
      "college_name": "RUHEA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3506",
      "college_name": "RANISANKAIL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3507",
      "college_name": "GAREYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3508",
      "college_name": "SALONDER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3509",
      "college_name": "PIRGANJ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3510",
      "college_name": "BHULLI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3511",
      "college_name": "ABDUR RASHID DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3512",
      "college_name": "D. N. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3513",
      "college_name": "LAHIRI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3514",
      "college_name": "RANISANKAIL WOMEN'S DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3515",
      "college_name": "CHANDARIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3516",
      "college_name": "K. B. COLLEGE, HORIPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3517",
      "college_name": "GAZIRHAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3518",
      "college_name": "THAKURGAON SHIKKHAK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3519",
      "college_name": "JABARHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3520",
      "college_name": "THAKURGAON LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3521",
      "college_name": "SAMIRUDDIN SMRITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3522",
      "college_name": "THAKURGAON ROAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3523",
      "college_name": "NEKMARAD BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3524",
      "college_name": "MOSLEMUDDIN DEGREE MOHABIDDALOY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3525",
      "college_name": "PIRGONJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3526",
      "college_name": "LOHAGARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3527",
      "college_name": "ABUL HOSSAIN SARKER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3601",
      "college_name": "MOQBULAR RAHMAN GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3602",
      "college_name": "PANCHAGARH GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3603",
      "college_name": "BHAJANPUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3604",
      "college_name": "PATHRAJ COLLEGE, BODA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3605",
      "college_name": "DEBIGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3606",
      "college_name": "MIRZA GOLAM HAFIZ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3607",
      "college_name": "AMLAHAR COLLEGE, PANCHAGARH",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3608",
      "college_name": "SHAHID ZIAUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3609",
      "college_name": "SAKEYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3610",
      "college_name": "BODA WOMEN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3611",
      "college_name": "BALARAMPUR ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3612",
      "college_name": "BARRISTER JAMIR UDDIN SIRCAR INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3613",
      "college_name": "TETULIA MAHABIDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3614",
      "college_name": "MAIDANDIGHI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3615",
      "college_name": "JAGDAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3616",
      "college_name": "MAJHIPARA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3617",
      "college_name": "BAGDAHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3618",
      "college_name": "DEBIGANJ MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3619",
      "college_name": "ATWARI ADARSHA WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "PANCHAGARH",
      "college_code": "3620",
      "college_name": "BHAULAGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3701",
      "college_name": "VICTORIA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3702",
      "college_name": "COMILLA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3703",
      "college_name": "COMILLA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3704",
      "college_name": "CHIORA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3705",
      "college_name": "SHAHEBABAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3706",
      "college_name": "BURICHANG ERSHAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3707",
      "college_name": "NAWAB FOYJUNNESA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3708",
      "college_name": "HASANPUR S. N. GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3709",
      "college_name": "DOLLAI NAWABPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3710",
      "college_name": "AKBAR ALI KHAN KARIGARI &amp; BANIJJA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3711",
      "college_name": "POYALGACHHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3712",
      "college_name": "BORURA SHAHID SMRITI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3713",
      "college_name": "DEBIDDAR S. A. GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3714",
      "college_name": "DEBIDDAR ALHAJ JOBEDA KHATUN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3715",
      "college_name": "HOMNA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3716",
      "college_name": "BADIUL ALAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3717",
      "college_name": "CHOWDDAGRAM GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3718",
      "college_name": "GUNABATI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3719",
      "college_name": "GOURIPUR MUNSHI FAZLUR RAHAMAN GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3720",
      "college_name": "KAZI NOMAN AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3721",
      "college_name": "JURANPUR ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3722",
      "college_name": "REDOWAN AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3723",
      "college_name": "AJITGUHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3724",
      "college_name": "NIMSAR JUNAB ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3725",
      "college_name": "NANGALCOURT HASAN MEMORIAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3726",
      "college_name": "HYDARABAD BEGUM JAHANARA HOQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3727",
      "college_name": "SREEKAIL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3728",
      "college_name": "CHOWARA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3729",
      "college_name": "LALMAI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3730",
      "college_name": "ADDA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3731",
      "college_name": "ISPAHANI PUBLIC SCHOOL AND COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3732",
      "college_name": "CHAND MIAH MOLLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3733",
      "college_name": "SHAH SHARIF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3734",
      "college_name": "NILKANTA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3735",
      "college_name": "KASHINAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3736",
      "college_name": "DHANUAKHALA ADARSHA PUBLIC DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3737",
      "college_name": "CHANDINA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3738",
      "college_name": "SANKUCHAIL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3739",
      "college_name": "ANANDAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3740",
      "college_name": "BANSKAIT BARRISTER RAFIQUL ISLAM MIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3741",
      "college_name": "ADDHAPAK ABDUL MAJID COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3742",
      "college_name": "NURUL AMIN MAZUMDER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3743",
      "college_name": "AGANAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3744",
      "college_name": "NATHER PETUA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3745",
      "college_name": "KALIKAPUR ABDUL MOTIN KHASRU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3746",
      "college_name": "FARIDUDDIN SARKAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3747",
      "college_name": "REHANA KARIGARY &amp; BANIJJYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3748",
      "college_name": "KURERPAR ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3749",
      "college_name": "MUNSHIRHAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3750",
      "college_name": "COMILLA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3751",
      "college_name": "BANGABANDHU LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3752",
      "college_name": "EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3753",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE, KOTBARI",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3754",
      "college_name": "COMILLA COLLEGE OF PHYSICAL EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3755",
      "college_name": "AL-AMIN PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3756",
      "college_name": "AL-HAJ NOOR MIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3757",
      "college_name": "DR. KHANDAKER MOSHARRAF HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3758",
      "college_name": "COMILLA MODEL EDUCATION RESEARCH CENTER",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3759",
      "college_name": "COMILLA TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3760",
      "college_name": "COMILLA B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3761",
      "college_name": "MAINAMATI B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3762",
      "college_name":
          "BANGLADESH INSTITUTE OF TEACHERS TRAINING &amp; RESEARCH (BITTAR)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3763",
      "college_name": "MEAH BAZAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3764",
      "college_name": "AMIR HOSSAIN ZOBEDA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3765",
      "college_name": "MOSHARROF HOSSAIN KHAN CHOWDHURY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3766",
      "college_name": "CHOTA SHARIFPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3767",
      "college_name": "CANTONMENT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3768",
      "college_name": "MANIKARCHAR BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3769",
      "college_name": "MSB INSTITUTE OF FASHION DESIGN &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3770",
      "college_name": "BORASHALGOHAR ADORSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3771",
      "college_name": "RAMKRISHNAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3772",
      "college_name": "SONAR BANGLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3773",
      "college_name": "MADHAIYA MUKTIJUDDHA SMRITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3774",
      "college_name": "DIGIRPAR T.I.K MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3801",
      "college_name": "B-BARIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3802",
      "college_name": "ASHUGANJ SAR KARKHANA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3803",
      "college_name": "B-BARIA POURO COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3804",
      "college_name": "B-BARIA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3805",
      "college_name": "KASBA T ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3806",
      "college_name": "CHARGACHH N. I. BHUIYAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3807",
      "college_name": "ADARSHA COLLEGE, SYEDABAD",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3808",
      "college_name": "AKHAURA SHAHID SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3809",
      "college_name": "NASIRNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3810",
      "college_name": "BANCHARAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3811",
      "college_name": "NABINAGAR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3812",
      "college_name": "SARIAL DEGREE COLLEGE, B-BARIA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3813",
      "college_name": "SALIMGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3814",
      "college_name": "FEROZ MIAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3815",
      "college_name": "KAZI MOHAMMAD SHAFIQUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3816",
      "college_name": "ABDUS SATTAR COLLEGE, SARAIL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3817",
      "college_name": "GOPINATHPUR AL-HAJ SHAH ALAM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3818",
      "college_name": "MIA ABDULLAH WAZED WOMEN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3819",
      "college_name": "BRAHMANBARIA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3820",
      "college_name": "BRAHMANBARIA SHIKKHOK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3821",
      "college_name": "KASBA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3822",
      "college_name": "CHATALPAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3823",
      "college_name": "CHINAIR BANGABANDHU SHEIKH MUJIB DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3824",
      "college_name": "KALSER NAYEEMA ALAM MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3825",
      "college_name": "ALIMUDDIN ZUBEDA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3826",
      "college_name": "SUHILPUR ALHAJ HARUN AL RASHID COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3827",
      "college_name": "NABINAGAR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3828",
      "college_name": "SUR SAMRAT ALAUDDIN KHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3901",
      "college_name": "CHANDPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3902",
      "college_name": "CHANDPUR GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3903",
      "college_name": "PURANBAZAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3904",
      "college_name": "MATLOB DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3905",
      "college_name": "NARAYANPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3906",
      "college_name": "ROYMONENNESSA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3907",
      "college_name": "HAJIGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3908",
      "college_name": "FARIDGONJ BANGABANDHU DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3909",
      "college_name": "MEHER DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3910",
      "college_name": "CHITOSHEE MAHABIDDYALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3911",
      "college_name": "KOCHUA BANGABANDU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3912",
      "college_name": "SHEIKH MOJIBUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3913",
      "college_name": "BALAKHAL MAQBUL AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3914",
      "college_name": "SACHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3915",
      "college_name": "GRIDKALINDIA HAJERA HASMAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3916",
      "college_name": "CHANGER CHAR POURO COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3917",
      "college_name": "DHADDA MOAZZEM HOSSAIN CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3918",
      "college_name": "DESHGAON COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3919",
      "college_name": "PALAKHAL ROSTAM ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3920",
      "college_name": "SUCHIPARA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3921",
      "college_name": "CHANDPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3922",
      "college_name": "HAJIGONJ MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3923",
      "college_name": "SEKANDAR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3924",
      "college_name": "HAJIGONJ IDEAL COLLEGE OF EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3925",
      "college_name": "NISCHINTAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3926",
      "college_name": "NASIRKOT SAHID SMRITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3927",
      "college_name": "FARAKKABAD DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3928",
      "college_name": "KARFULENNESSA WOMEN'S COLLEGE (RESIDENTIAL)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3929",
      "college_name": "HAIMCHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3930",
      "college_name": "GALLAK ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3931",
      "college_name": "SUJATPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4001",
      "college_name": "LUXMIPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4002",
      "college_name": "A. S. M. ABDUR ROB GOVT COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4003",
      "college_name": "RAIPUR DEGREE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4004",
      "college_name": "LUXMIPUR MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4005",
      "college_name": "DATTAPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4006",
      "college_name": "RAMGANJ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4007",
      "college_name": "KAFIL UDDIN DEGREE COLLEGE, CHANDAGONJ",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4008",
      "college_name": "DALAL BAZAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4009",
      "college_name": "RAIPUR RUSTAM ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4010",
      "college_name": "JANATA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4011",
      "college_name": "RAMGONJ MODEL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4012",
      "college_name": "LUXMIPUR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4013",
      "college_name": "LUXMIPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4014",
      "college_name": "LUXMIPUR B. P. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4015",
      "college_name": "LAKSHMIPUR IDEAL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4016",
      "college_name": "HAZIRHAT UPAKUL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4017",
      "college_name": "DALTA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4018",
      "college_name": "BHABANIGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4101",
      "college_name": "FENI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4102",
      "college_name": "BAKTAR MUNSI SHEIKH SHAHIDUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4103",
      "college_name": "GOVT. ZIA MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4104",
      "college_name": "FULGAJI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4105",
      "college_name": "SONAGAJI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4106",
      "college_name": "FENI SOUTH-EAST COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4107",
      "college_name": "PARSURAM GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4108",
      "college_name": "CHHAGALNAIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4109",
      "college_name": "IQBAL MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4110",
      "college_name": "ALHAJ ABDUL HAQUE CHOWDURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4111",
      "college_name": "JOYNAL HAZARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4112",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4113",
      "college_name": "FENI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4114",
      "college_name": "HAJEE MONIR AHAMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4115",
      "college_name": "FULGAZI MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "FENI",
      "college_code": "4116",
      "college_name": "RAMPUR NASIR MEMORIAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4201",
      "college_name": "NOAKHALI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4202",
      "college_name": "KABIRHAT GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4203",
      "college_name": "HATIA COLLEGE, NOAKHALI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4204",
      "college_name": "NOAKHALI GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4205",
      "college_name": "SONAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4206",
      "college_name": "KHALILUR RAHMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4207",
      "college_name": "CHOWMOHANI GOVT. S. A. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4208",
      "college_name": "SONAIMURI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4209",
      "college_name": "CHATKHIL PANCHGAON MAHABUB GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4210",
      "college_name": "GOVT. MUJIB COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4211",
      "college_name": "HATIADIP GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4212",
      "college_name": "SENBAG GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4213",
      "college_name": "SAIKAT DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4214",
      "college_name": "CHAR JABBAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4215",
      "college_name":
          "NANDIAPARA BIR SHRESTHA SHAHID MOHAMMAD RUHUL AMIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4216",
      "college_name": "BHULUA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4217",
      "college_name": "BALIAKANDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4218",
      "college_name": "M. A. HASHEM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4219",
      "college_name": "ISLAMIC INSTITUTE OF BUSINESS AND TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4220",
      "college_name": "ABDUL WAHAB COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4221",
      "college_name": "NOAKHALI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4222",
      "college_name": "NOAKHALI TEACHERS' TRAINING COLLEGE, MIGHDY COURT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4223",
      "college_name": "ZIA EDUCATION OF DEVELOPMENT INSTITUTE (ZEDI)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4224",
      "college_name": "BANDHERHAT ABDUL MALEK COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4225",
      "college_name": "HATIYA ADARSHA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4226",
      "college_name": "CHAPRASHIRHAT ISMAIL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4227",
      "college_name": "BAMNI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4228",
      "college_name": "JALAL UDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4229",
      "college_name": "KANKIRHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4230",
      "college_name": "CHOWDHURYHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4231",
      "college_name": "CHARMATUA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4232",
      "college_name": "CHATKHIL WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4301",
      "college_name": "CHITTAGONG COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4302",
      "college_name": "CHITTAGONG GOVT. WOMEN'S COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4303",
      "college_name": "HAZERA-TAJU DEGREE COLLEGE, CHANDGAON",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4304",
      "college_name": "GOVT. CITY COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4305",
      "college_name": "GOVT. HAZI MOHAMMAD MOHSIN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4306",
      "college_name": "GOVT. COMMERCE COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4307",
      "college_name": "OMARGANI M. E. S. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4308",
      "college_name": "MAHILA COLLEGE, ENAYET BAZAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4309",
      "college_name": "AGRABAD MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4310",
      "college_name": "ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4311",
      "college_name": "CHITTAGONG CANTONMENT PUBLIC COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4312",
      "college_name": "HATHAZARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4313",
      "college_name":
          "QUAISH BURISCHAR SHEIKH MOHAMMED CITY CORPORATION DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4314",
      "college_name": "RAOZAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4315",
      "college_name": "GAHIRA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4316",
      "college_name": "KUNDESWARI BALIKA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4317",
      "college_name": "NOAPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4318",
      "college_name": "AGRASAR BALIKA MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4319",
      "college_name": "IMAM GAZZALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4320",
      "college_name": "NAZIRHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4321",
      "college_name": "RANGUNIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4322",
      "college_name": "DAKSIN RANGUNIA PADUA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4323",
      "college_name": "M. SHAH ALAM CHOWDHURY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4324",
      "college_name": "UTTAR RANGUNIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4325",
      "college_name": "SIR ASHUTOSH COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4326",
      "college_name": "BOALKHALI SIRAJUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4327",
      "college_name": "BOALKHALI HAZI MD. NURUL HOQUE DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4328",
      "college_name": "ALAOL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4329",
      "college_name": "BANSHKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4330",
      "college_name": "ANOWARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4331",
      "college_name": "BARAMA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4332",
      "college_name": "SHAH MOHSEN AULIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4333",
      "college_name": "PATIYA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4334",
      "college_name": "SATKANIYA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4335",
      "college_name": "SITAKUNDA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4336",
      "college_name": "LATIFA SIDDIQI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4337",
      "college_name": "NIZAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4338",
      "college_name": "GOVT. HAZI A. B. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4339",
      "college_name": "MUSTAFIZUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4340",
      "college_name": "BARA AULIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4341",
      "college_name": "FATICKCHHARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4342",
      "college_name": "PAHARTALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4343",
      "college_name": "BARIAR HAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4344",
      "college_name": "HULAIN SALEH NOOR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4345",
      "college_name": "NANUPUR LAILA KABIR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4346",
      "college_name": "GACHHBARIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4347",
      "college_name": "UTTAR SATKANYA JAFAR AHMED CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4348",
      "college_name": "RAZANAGAR RANIRHAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4349",
      "college_name": "UTTAR KATTALI AL-HAZ MUSTAFA HAKIM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4350",
      "college_name": "MIRSARAI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4351",
      "college_name": "DR. FAZLUL HAZERA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4352",
      "college_name": "BARRISTAR SULTAN AHMED CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4353",
      "college_name": "HEYAKO BANANI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4354",
      "college_name": "NARAYANHAT ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4355",
      "college_name": "ALHAZ MOSTAFIZUR RAHMAN COLLEGE, LOHAGARA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4356",
      "college_name": "AMANAT SAFA BADRUNNESA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4357",
      "college_name": "AL-HELAL ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4358",
      "college_name": "INSTITUTE OF BUSINESS STUDIES",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4359",
      "college_name": "MUZAFFARABAD JOSHODA NAGENDRA NANDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4360",
      "college_name": "KHALILUR RAHMAN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4361",
      "college_name": "CHUNTI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4362",
      "college_name": "PASCHIM PATIYA A. J. CHOWDHURI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4363",
      "college_name": "ASHEKAN AULIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4364",
      "college_name": "KATIRHAT MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4365",
      "college_name": "BIJOY SWARANI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4366",
      "college_name": "PASHCHIM BANSKHALI UPAKULIO COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4367",
      "college_name": "ISAPUR B. M. C. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4368",
      "college_name": "KHALILMIR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4369",
      "college_name": "RANGUNIA HASINA JAMAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4370",
      "college_name": "HAJEE M. A. KALAM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4371",
      "college_name": "GLOBAL COLLEGE OF MULTIMEDIA &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4372",
      "college_name": "ACADEMY OF SCIENCE &amp;TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4373",
      "college_name": "EDUCATION AND RESEARCH ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4374",
      "college_name": "AKIJ INSTITUTE OF TECHNOLOGY, CHITTAGONG",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4375",
      "college_name":
          "NEURAL INSTITUTE OF SCIENCE &amp; TECHNOLOGY, CHITTAGONG",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4376",
      "college_name": "BANGABANDHU LAW TEMPLE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4377",
      "college_name": "CHITTAGONG LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4378",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4379",
      "college_name":
          "RESEARCH FOR EDUCATION AND MANAGEMENT ACADEMY, CHAKBAZAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4380",
      "college_name": "NATIONAL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4381",
      "college_name": "CITY TEACHERS' TRAINING COLLEGE CHATTAGRAM",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4382",
      "college_name": "MODERN TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4383",
      "college_name": "CHITTAGONG COLLEGE OF EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4384",
      "college_name":
          "DIVISIONAL GOVT. COLLEGE OF PHYSICAL EDUCATION, CHITTAGONG",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4385",
      "college_name":
          "INSTITUTE OF LIBRARY AND INFORMATION SCIENCE (ILIS), CHITTAGONG",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4386",
      "college_name":
          "INSTITUTE OF LIBRARY AND INFORMATION TECHNOLOGY, CHITTAGONG",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4387",
      "college_name": "GOVERMENT ART COLLEGE, CHITTAGONG",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4388",
      "college_name": "BANGLADESH MILITARY ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4389",
      "college_name": "BANGLADESH NAVAL ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4390",
      "college_name": "MARINE FISHERIES ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4391",
      "college_name": "MARINE ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4392",
      "college_name": "SCHOOL OF ARTILLERY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4393",
      "college_name": "KAPASGOLA CITY CORPORATION MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4394",
      "college_name": "PARASH PATHOR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4395",
      "college_name": "INSTITUTE OF GLOBAL MANAGEMENT AND INFORMATION SYSTEM",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4396",
      "college_name": "CHITTAGONG PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4397",
      "college_name": "JARINA-MAFZAL CITY CORPORATION DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4398",
      "college_name": "COLONEL (RTD.) OLI AHMED BIR BIKROM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "4399",
      "college_name": "KULGAON CITY CORPORATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4401",
      "college_name": "COX'S BAZAR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4402",
      "college_name": "COX'S BAZAR GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4403",
      "college_name": "CHAKARIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4404",
      "college_name": "RAMU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4405",
      "college_name": "UKHIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4406",
      "college_name": "TEKNAF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4407",
      "college_name": "COX'S BAZAR CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4408",
      "college_name": "HOANK COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4409",
      "college_name": "COX'S BAZAR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4410",
      "college_name": "COX'S BAZAR TEACHERS' TRAINNING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4411",
      "college_name": "MOHESH KHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4412",
      "college_name": "EIDGAH FARID AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4413",
      "college_name": "CHAKARIA ABASHIK MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "BANDARBAN",
      "college_code": "4501",
      "college_name": "BANDERBAN GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "BANDARBAN",
      "college_code": "4502",
      "college_name": "HAJI M. A. KALAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "BANDARBAN",
      "college_code": "4503",
      "college_name": "MATAMUHURI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "RANGAMATI",
      "college_code": "4601",
      "college_name": "RANGAMATI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "RANGAMATI",
      "college_code": "4602",
      "college_name": "KACHALONG COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "RANGAMATI",
      "college_code": "4603",
      "college_name": "KARNAPHULI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "RANGAMATI",
      "college_code": "4604",
      "college_name": "RANGAMATI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "RANGAMATI",
      "college_code": "4605",
      "college_name": "KAWKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "RANGAMATI",
      "college_code": "4606",
      "college_name": "RANGAMATI GOVT. MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4701",
      "college_name": "KHAGRACHHARI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4702",
      "college_name": "MATIRANGA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4703",
      "college_name": "RAMGARH GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4704",
      "college_name": "MANIKCHARI GIRI MOITRI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4705",
      "college_name": "DIGHINALA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4706",
      "college_name": "KHAGRACHHARI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4707",
      "college_name": "PANCHARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "KHAGRACHHARI",
      "college_code": "4708",
      "college_name": "MOHALCHARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4801",
      "college_name": "NETRAKONA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4802",
      "college_name": "HAFEZ ZIAUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4803",
      "college_name": "SHAH SULTAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4804",
      "college_name": "NETRAKONA GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4805",
      "college_name": "KENDUA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4807",
      "college_name": "KRISHNAPUR HAZI ALI AKBAR PUBLIC DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4808",
      "college_name": "TELIGATI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4809",
      "college_name": "PURBODHALA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4810",
      "college_name": "SUSANG GOVT. COLLEGE, DURGAPUR",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4811",
      "college_name": "ABU ABBAS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4812",
      "college_name": "MOHANGONJ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4813",
      "college_name": "BARHATTA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4814",
      "college_name": "KALMAKANDA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4815",
      "college_name": "RABEYA ALI MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4816",
      "college_name": "NETROKONA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4817",
      "college_name": "KHAN SHAHEB ABDUL AZIZ TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4818",
      "college_name": "DURGAPUR MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4819",
      "college_name": "HAJI ABDUL AZIZ KHAN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4820",
      "college_name": "MOHANGONJ MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4821",
      "college_name": "CHANDRANATH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4822",
      "college_name": "FAQUIR ASHRAF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4823",
      "college_name": "NETROVISION INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4824",
      "college_name": "JOBAIDA RAHMAN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4901",
      "college_name": "GOVT. GURUDAYAL COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4902",
      "college_name": "KARIMGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4903",
      "college_name": "KISHOREGANJ GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4904",
      "college_name": "WALI NEWAZ KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4905",
      "college_name": "KATHIADI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4906",
      "college_name": "HAZI ASMAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4907",
      "college_name": "BAJITPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4908",
      "college_name": "KULIARCHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4909",
      "college_name": "PAKUNDIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4910",
      "college_name": "HOSSAINPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4911",
      "college_name": "ROTARY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4912",
      "college_name": "DR. ABDUL MANNAN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4913",
      "college_name": "MUKTIJODDHA ABDUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4914",
      "college_name": "GOVT. ZILLUR RAHMAN MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4915",
      "college_name": "HAJI ZAFAR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4916",
      "college_name": "Syed Ashraful Islam Poura Mohila College",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4917",
      "college_name": "PAKUNDIA ADARSHA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4918",
      "college_name": "INSTITUTE OF BUSINESS AND INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4919",
      "college_name": "TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4920",
      "college_name": "BHAIRAB TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4921",
      "college_name": "RAFIQUL ISLAM WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4922",
      "college_name": "HOSSAINPUR ADARSHA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4923",
      "college_name": "R. S. IDEAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4924",
      "college_name": "HOSSAINDI ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4925",
      "college_name": "MUKTI JODDHA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4926",
      "college_name": "RASHTRAPATI ABDUL HAMID COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4927",
      "college_name": "TARAIL MUKTIZUDHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "KISHOREGANJ",
      "college_code": "4928",
      "college_name": "SHIMULKANDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5001",
      "college_name": "GOVT. ASHEK MAHMUD COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5002",
      "college_name": "MADARGANJ A. H. Z. GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5003",
      "college_name": "MELANDAH GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5004",
      "college_name": "JAHEDA SAFIR MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5005",
      "college_name": "NANDINA SK. ANOWER HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5006",
      "college_name": "A. K. MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5007",
      "college_name": "SANONDABARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5008",
      "college_name": "ISLAMPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5009",
      "college_name": "MAHMUDA SALAM MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5010",
      "college_name": "SUJAT ALI COLLEGE, PINGNA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5011",
      "college_name": "SARISHABARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5012",
      "college_name": "BAKSHIGANJ KEAMATULLAH GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5013",
      "college_name": "NURUNNAHAR MIRZA KASEM MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5014",
      "college_name": "JAHANARA LATIF MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5015",
      "college_name": "JHOWLA GUPALPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5016",
      "college_name": "HAZRABARI SERAJUL HUQ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5017",
      "college_name":
          "ISLAMPUR M. A. SAMAD-PERVEZ MEMORIAL MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5018",
      "college_name": "DIGPAIT SHAMSUL HAQ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5019",
      "college_name": "JAMALPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5020",
      "college_name": "MIRZA AZAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5021",
      "college_name": "KHATEMOON MOIN MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5022",
      "college_name": "RENAISSANCE TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5023",
      "college_name": "INSTITUTE OF BUSINESS ADMINISTRATION JAMALPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5024",
      "college_name": "SHAHID ZIAUR RAHMAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5025",
      "college_name": "HABIBUR RAHAMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5026",
      "college_name": "DR. ABDUL MAZID TALUKDER DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5027",
      "college_name": "POGALDIGHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5028",
      "college_name": "KHAWJA SHAH SUFI YUNUS ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5029",
      "college_name": "BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5030",
      "college_name": "M M MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5031",
      "college_name": "TULSHIPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "JAMALPUR",
      "college_code": "5032",
      "college_name": "JINNATON AFSOR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5101",
      "college_name": "SHERPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5102",
      "college_name": "NAZMUL SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5103",
      "college_name": "HAZI JAL MAHMUD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5104",
      "college_name": "SHERPUR MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5105",
      "college_name": "SRIBORDI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5106",
      "college_name": "CHOWDHURY SABRUNNESSA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5107",
      "college_name": "NALITABARI SHAHID ABDUR RASHID MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5108",
      "college_name": "ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5109",
      "college_name": "JAMSHED ALI MEMORIAL (DEGREE) COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5110",
      "college_name": "CHANDRAKONA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5111",
      "college_name": "JHENAIGATI MAHILA ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5112",
      "college_name": "DR. SEKANDER ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5113",
      "college_name": "ALHAZ SHAFIUDDIN AHMED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5201",
      "college_name": "ANANDAMOHAN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5202",
      "college_name": "GOVT. MOMINUNNESSA MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5203",
      "college_name": "MYMENSINGH MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5204",
      "college_name": "NASIRABAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5205",
      "college_name": "MYMENSINGH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5206",
      "college_name": "A. M. M. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5207",
      "college_name": "GAFARGAON GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5208",
      "college_name": "ABDUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5209",
      "college_name": "PHULPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5210",
      "college_name": "DHOBAURA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5211",
      "college_name": "HALUAGHAT SHAHID SMRITI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5212",
      "college_name": "GOURIPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5213",
      "college_name": "GOURIPUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5214",
      "college_name": "NAZRUL COLLEGE, TRISHAL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5215",
      "college_name": "PULBARIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5216",
      "college_name": "SHAHID SMRITI GOVT. COLLEGE, MUKTAGACHHA",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5217",
      "college_name": "SHAHID SMRITI ADARSHA COLLEGE, NANDAIL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5218",
      "college_name": "ISWARGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5219",
      "college_name": "BHALUKA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5220",
      "college_name": "BANGABANDU DEGREE COLLEGE, MYMENSINGH",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5221",
      "college_name": "ATHAROBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5222",
      "college_name": "TRISHAL MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5223",
      "college_name": "HAZI KASHEM ALI MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5224",
      "college_name": "ALTAF GOLONDAJ MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5225",
      "college_name": "SONAR BANGLA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5226",
      "college_name": "GABTOLI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5227",
      "college_name":
          "STATE INSTITUTE OF BUSINESS ADMINISTRATION AND COMPUTER SCIENCE (SIBACS)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5228",
      "college_name": "COLLEGE OF BUSINESS, SCIENCE &amp; TECHNOLOGY (CBST)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5229",
      "college_name": "PHULPUR MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5230",
      "college_name": "MOMENSHAHI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5231",
      "college_name": "TEACHERS' EDUCATION COMPLEX, MUKTAGACHA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5232",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE (MOHILA)",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5233",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5234",
      "college_name": "MOMENSHAHI TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5235",
      "college_name":
          "INSTITUTE OF LIBRARY AND INFORMATION SCIENCE, MYMENSINGH",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5236",
      "college_name": "SHILPACHARYA ZAINUL ABEDIN FINE ART INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5237",
      "college_name": "DHARA ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5238",
      "college_name": "GAFARGAON MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5239",
      "college_name": "GOVT. PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5240",
      "college_name": "SHAHABUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5241",
      "college_name": "SHOMURTA JAHAN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5242",
      "college_name": "DHOBAURA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5243",
      "college_name": "FULBARIA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5244",
      "college_name": "KHURRAM KHAN CHOWDHURY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5245",
      "college_name": "CITY INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5246",
      "college_name": "SHAMBHUGONJ GKP COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5247",
      "college_name": "BOWLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5248",
      "college_name": "HAJI CHERAG ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5249",
      "college_name": "HALUAGHAT ADARSHA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5250",
      "college_name": "SUPREME LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5251",
      "college_name": "BHALUKA TRISHAL MAITRY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5252",
      "college_name": "KESHORGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5301",
      "college_name": "GOVT. SAADAT COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5302",
      "college_name": "GOVT. M. M. ALI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5303",
      "college_name": "SYED MOHABBAT ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5304",
      "college_name": "LION NAZRUL ISLAM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5306",
      "college_name": "SHAMSHER FAKIR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5307",
      "college_name": "GOVT. KUMUDINI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5308",
      "college_name": "G. B. G. COLLEGE, GHATAIL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5309",
      "college_name": "NAGARPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5310",
      "college_name": "GOPALPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5311",
      "college_name": "HEMNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5312",
      "college_name": "KALIHATI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5313",
      "college_name": "SHAMSUL HAQUE COLLEGE, ELENGA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5314",
      "college_name": "MIRZAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5315",
      "college_name": "ALAUDDIN SIDDIQUI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5316",
      "college_name": "MADHUPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5317",
      "college_name": "DHANBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5318",
      "college_name": "ASYA HASAN ALI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5319",
      "college_name": "BASAIL EMDAD HAMIDA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5320",
      "college_name": "IBRAHIM KHAN GOVT. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5321",
      "college_name": "GOVT. MUJIB COLLEGE, SAKHIPUR",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5322",
      "college_name": "MAJ. GEN. MAHMUDUL HASAN ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5323",
      "college_name": "NAGARPUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5324",
      "college_name": "MOWLANA ABDUL HAMID KHAN BHASANI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5325",
      "college_name": "MAJ. GEN. MAHMUDUL HASAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5326",
      "college_name": "SHAKHIPUR RESIDENTIAL MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5327",
      "college_name": "LOKMAN FAKIR MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5328",
      "college_name": "GLOBAL INSTITUTE OF INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5329",
      "college_name": "MAHERUNNESHA MOHILA COLLEGE, GOPALPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5330",
      "college_name": "SHAHID ZIA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5331",
      "college_name": "HAJI ABUL HOSSAIN INSTITUTE OF TECHNOLOGY (HABHIT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5332",
      "college_name": "TANGAIL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5333",
      "college_name": "TANGAIL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5334",
      "college_name": "B. C. R. G. COLLEGE, PAKUTIA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5335",
      "college_name": "SHEHAB UDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5336",
      "college_name": "PANCHPOTAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5337",
      "college_name": "ARFAN KHAN MEMORIAL COLLEGE, LOWHATI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5338",
      "college_name": "GOVT. SHEIKH FAZILATUN NESA MUJIB MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5339",
      "college_name": "KHANDAKER FAZLUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5340",
      "college_name": "KHALILUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5341",
      "college_name": "UKHARIABARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5342",
      "college_name": "HATIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5343",
      "college_name": "SHAHID RAUSHAN ALI KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5344",
      "college_name": "JANATA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5345",
      "college_name": "LUTFOR RAHMAN MATIN MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5401",
      "college_name": "NARSINGDI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5402",
      "college_name": "NARSINGDI GOVT. MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5403",
      "college_name": "MADHABDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5404",
      "college_name": "SHAHID ASAD GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5405",
      "college_name": "MONOHARDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5406",
      "college_name": "RAIPURA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5407",
      "college_name": "PORADIA WASIM UDDIN KHAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5408",
      "college_name": "NARAYANPUR RABEYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5409",
      "college_name": "PALASH SHILPANCHAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5410",
      "college_name": "HATIRDIA RAZIUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5411",
      "college_name": "JOYNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5412",
      "college_name": "AFAZUDDIN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5413",
      "college_name": "BARA CHAPA UNION ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5414",
      "college_name": "PANCHKANDI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5415",
      "college_name": "GHORASHAL MUSA BIN HAKIM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5416",
      "college_name": "NARSINGDI SHIKKHAK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5417",
      "college_name": "NARSINGDI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5418",
      "college_name": "NATIONAL COLLEGE OF EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5419",
      "college_name": "ABDUL MANNAN BHUIYAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5420",
      "college_name": "SHAHID SMRITY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5421",
      "college_name": "BAROICHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5422",
      "college_name": "SARDAR ASMAT ALI MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5423",
      "college_name": "SABUJ PAHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5424",
      "college_name": "HAZI ABED ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5425",
      "college_name": "BARACHAPA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5426",
      "college_name": "KHIDIRPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARSINGDI",
      "college_code": "5427",
      "college_name": "HOSSAIN ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5501",
      "college_name": "BHAWAL BADRE ALAM GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5502",
      "college_name": "BHAWAL MIRZAPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5503",
      "college_name": "PEAR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5504",
      "college_name": "ROVAR POLLY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5505",
      "college_name": "KAZI AZIMUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5506",
      "college_name": "KAPASIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5507",
      "college_name": "SREEPUR MUKTIJODDHA RAHMOT ALI  COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5508",
      "college_name": "KALIAKOIR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5509",
      "college_name": "KALIGANJ SRAMIK COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5510",
      "college_name": "JAMALPUR COLLEGE, GAZIPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5511",
      "college_name": "TONGI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5512",
      "college_name": "GAZIPUR CANTONMENT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5513",
      "college_name": "MODEL INSTITUTE OF SCIENCE &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5514",
      "college_name": "SHAHID TAJUDDIN AHMAD DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5515",
      "college_name": "BORMI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5516",
      "college_name": "MIZANUR RAHMAN KHAN DEGREE MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5517",
      "college_name": "SAID ALI INSTITUTE OF SCIENCE &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5518",
      "college_name": "JATIR PITA BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5519",
      "college_name": "GAZIPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5520",
      "college_name": "PUBAIL ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5521",
      "college_name": "GAZIPUR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5522",
      "college_name": "GAZIPUR PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5523",
      "college_name": "GAZIPUR GOVT. MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5524",
      "college_name": "BARAIBARI ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5525",
      "college_name": "ABDUL AWAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5526",
      "college_name": "BGIFT INSTITUTE OF SCIENCE AND TECHNOLOGY (BIST)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5527",
      "college_name": "GAZIPUR CENTRAL PUBLIC MANAGEMENT INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5528",
      "college_name": "KONABARI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5529",
      "college_name": "BANGATAJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5530",
      "college_name": "BANGLADESH MADRASA TEACHER'S TRAINING INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5531",
      "college_name": "SHARIF MOMTAJ UDDIN AHMED DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5532",
      "college_name": "MUKTIJODDHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5533",
      "college_name": "DHALADIA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5534",
      "college_name": "KALIGONJ MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5535",
      "college_name": "GAZIPUR LIBRARY SCIENCE &amp; PROFESSIONAL INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5601",
      "college_name": "GOVT. TOLARAM COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5602",
      "college_name": "NARAYANGANJ MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5603",
      "college_name": "NARAYANGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5604",
      "college_name": "GOVT. SAFAR ALI COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5605",
      "college_name": "SONARGAON COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5606",
      "college_name": "MURAPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5607",
      "college_name": "SONARGAON KAZI FAZLUL HAQUE WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5608",
      "college_name": "SALIMUDDIN CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5609",
      "college_name": "HAJEE BALAYET HOSSION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5610",
      "college_name": "ROKANUDDIN MOLLA GIRLS' COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5611",
      "college_name": "HAZI MISIR ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5612",
      "college_name": "NAZIMUDDIN BHUIYAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5613",
      "college_name": "NARAYANGANJ LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5614",
      "college_name": "BANGLADESH COLLEGE OF PHYSICAL EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5615",
      "college_name": "NARAYANGANJ FINE ART INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5616",
      "college_name": "KADAM RASUL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5617",
      "college_name": "FATIMA RAHMAN TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5618",
      "college_name": "HOSSAINPUR S.P. UNION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5619",
      "college_name":
          "BANGLADESH INSTITUTE OF BUSINESS &amp; TECHNOLOGY (BIBT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5620",
      "college_name": "COLLEGE OF TECHNOLOGY (COT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5621",
      "college_name": "PANCHRUKHI BEGUM ANOWARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5701",
      "college_name": "GOVT. HARAGANGA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5702",
      "college_name": "GOVT. SREENAGAR COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5703",
      "college_name": "BIKRAMPUR K. B. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5704",
      "college_name": "GAJARIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5705",
      "college_name": "BIKRAMPUR ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5706",
      "college_name": "ADARSHA MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5707",
      "college_name": "MUNSHIGANJ LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5708",
      "college_name": "LOHAJANG MAHABIDHALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5709",
      "college_name": "RAMPAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5710",
      "college_name": "GAZARIA KALIMULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5711",
      "college_name": "MIRKADIM HAJI AMJAD ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5712",
      "college_name": "MALKHANAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5713",
      "college_name": "BIKRAMPUR TONGIBARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MUNSHIGANJ",
      "college_code": "5714",
      "college_name": "ALI ASGAR AND ABDULLAH DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5801",
      "college_name": "GOVT. DEBENDRA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5802",
      "college_name": "MANIKGANJ MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5803",
      "college_name": "MOTILAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5804",
      "college_name": "TALUKNAGAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5805",
      "college_name": "SINGAIR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5806",
      "college_name": "GHIOR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5807",
      "college_name": "TEROSREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5808",
      "college_name": "M. A. RAUF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5809",
      "college_name": "MAHADEBPUR UNION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5810",
      "college_name": "VIKU MEMO. GOVT. COLLEGE, DARGRAM",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5812",
      "college_name": "KHAN BAHADUR AWLAD HOSSAIN KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5813",
      "college_name": "GARPARA HAFIZUDDIN MEMORIAL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5814",
      "college_name": "ADARSHA MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5815",
      "college_name": "JITKA KHAJA RAHMOT ALI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5816",
      "college_name": "BEGUM JARINA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5817",
      "college_name": "SATURIA SYED KALU SHAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5818",
      "college_name": "KHONDOKAR NURUL HOSSAIN LAW ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5819",
      "college_name": "IDEAL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5820",
      "college_name": "BICHARPATI NURUL ISLAM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5821",
      "college_name": "SHIBALAYA SADARUDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5901",
      "college_name": "RAJBARI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5902",
      "college_name": "GOALONDA KAMRUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5903",
      "college_name": "RAJBARI GOVT. ADARSHA MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5904",
      "college_name": "BALIAKANDI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5905",
      "college_name": "PANGSHA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5906",
      "college_name": "MACHHPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5907",
      "college_name": "MRIGI SHAHEED DIANAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5908",
      "college_name": "KALUKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5909",
      "college_name": "MIR MOSHAROF HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5910",
      "college_name": "MAJHBARI JAHANARA BEGUM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5911",
      "college_name": "MUNSUR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5912",
      "college_name": "DR. ABUL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5913",
      "college_name": "RAJBARI TEACHERS'TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5914",
      "college_name": "MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5915",
      "college_name": "RABEYA IDRIS MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5916",
      "college_name": "DR. KAZI MOTAHAR HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5917",
      "college_name": "ALHAZ AMZAD HOSSAIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5920",
      "college_name": "JAMALPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5921",
      "college_name": "BAHARPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "RAJBARI",
      "college_code": "5922",
      "college_name": "BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6001",
      "college_name": "GOVT. RAJENDRA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6002",
      "college_name": "GOVT. SARDA SUNDARI MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6003",
      "college_name": "GOVT. YASIN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6004",
      "college_name": "CHARBHADRASAN GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6005",
      "college_name": "K. M. COLLEGE, BHANGA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6006",
      "college_name": "NAGARKANDA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6007",
      "college_name": "BOALMARI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6008",
      "college_name": "KADIRDI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6009",
      "college_name": "ALFADANGA ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6010",
      "college_name": "ALFADANGA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6011",
      "college_name": "BIRSRESTHA ABDUR ROUF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6012",
      "college_name": "GOVT. AINUDDIN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6013",
      "college_name": "SADARPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6014",
      "college_name": "KAZI SHIRAJUL ISLAM MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6015",
      "college_name": "NABOKAM PALLY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6016",
      "college_name": "BHANGA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6017",
      "college_name": "FARIDPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6018",
      "college_name": "FARIDPUR CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6019",
      "college_name": "J. M. MODEL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6020",
      "college_name": "SUNFLOWER TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6021",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6022",
      "college_name": "FARIDPUR MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6023",
      "college_name": "HAZI ABDUR RAHMAN ABDUL KARIM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6024",
      "college_name": "AKHCHASI MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6025",
      "college_name": "BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6101",
      "college_name": "GOVT. BANGABANDHU COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6102",
      "college_name": "SK. FAZILATUNNESSA MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6103",
      "college_name": "GOVT. NAZRUL COLLEGE, SATPAR",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6104",
      "college_name": "BANGA RATNA COLLEGE, GOPALGANJ",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6105",
      "college_name": "MUKSUDPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6106",
      "college_name": "SK. LUTFAR RAHMAN ADARSHA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6107",
      "college_name": "KAZI MANTU COLLEGE, BHANGARHAT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6108",
      "college_name": "M. A. KHALEQ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6109",
      "college_name": "JOYNAGAR YAR ALI KHAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6110",
      "college_name": "GOVT. S. K. COLLEGE, RAMDIA",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6111",
      "college_name": "SK. MUJIBUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6112",
      "college_name": "KAZI MANTU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6113",
      "college_name": "RAJPAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6114",
      "college_name": "LALMIA CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6115",
      "college_name": "M. H. KHAN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6116",
      "college_name": "SHEIKH FAZLUL KARIM SELIM LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6117",
      "college_name": "M A ROUF TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6118",
      "college_name": "SABIRA ROUF PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6119",
      "college_name": "DR. IMDADUL HUQ MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6120",
      "college_name": "N. HAQUE COLLEGE OF BUSINESS &amp; TECHNOLOGY (NCBT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6121",
      "college_name": "SHEIKH RASEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6122",
      "college_name": "RAMSHIL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GOPALGONJ",
      "college_code": "6123",
      "college_name": "UJANI B.K.B UNION DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6201",
      "college_name": "SHARIATPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6202",
      "college_name": "NARIA GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6203",
      "college_name": "M. A. REZA COLLEGE, BHEDERGANJ",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6204",
      "college_name": "PURBO MADARIPUR COLLEGE, DAMUDYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6205",
      "college_name": "JAZIRA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6206",
      "college_name": "HAZI SHARIATULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6207",
      "college_name": "DR. MOSLEM UDDIN KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6208",
      "college_name": "BHOJESWAR UPASY MAHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6209",
      "college_name": "SHAMSUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6210",
      "college_name": "B.K. NAGAR BANGABANDHU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6211",
      "college_name": "SIRAJ SIKDER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHARIATPUR",
      "college_code": "6212",
      "college_name": "GOVT. GOLAM HAIDER KHAN MOHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6301",
      "college_name": "MADARIPUR GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6302",
      "college_name": "MADARIPUR GOVT. SUFIA MAHILA COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6303",
      "college_name": "CHARMUGURIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6304",
      "college_name": "BORHAMGANJ GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6305",
      "college_name": "SYED ABUL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6306",
      "college_name": "SHAHID SMRITI COLLEGE, SASHIKAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6307",
      "college_name": "RAJOIR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6308",
      "college_name": "RIZIA BEGUM MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6309",
      "college_name": "NURUL AMIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6310",
      "college_name": "BANGABANDHU LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6311",
      "college_name": "MADARIPUR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6312",
      "college_name": "SHAHEBRAMPUR KABI NAZRUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6313",
      "college_name": "ABCK SYED ABUL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6314",
      "college_name": "ELIAS AHMED CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6315",
      "college_name": "SHEIKH HASINA ACADEMY &amp; WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6316",
      "college_name": "SYED ABUL HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6317",
      "college_name": "D.K. IDEAL SYED ATAHAR ALI ACADEMY AND COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6318",
      "college_name": "KABIRAJPUR SAIFUDDIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6319",
      "college_name": "ELIAS AHMED CHOWDHURY DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6320",
      "college_name": "CHILARCHAR BALIKANDI SHEIKH FAZILATUNNESA MUJIB COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6321",
      "college_name": "SHEIKH RASEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MADARIPUR",
      "college_code": "6322",
      "college_name": "INSTITUTE OF LIBRARY  AND INFORMATION SCIENCE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6401",
      "college_name": "SAVAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6402",
      "college_name": "DHAMRAI GOVT. COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6403",
      "college_name": "NABOJUG COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6404",
      "college_name": "JOYPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6405",
      "college_name": "DOHAR NAWABGANJ COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6406",
      "college_name": "ISPAHANI COLLEGE, RAMERKANDA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6407",
      "college_name": "KERANIGANJ MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6408",
      "college_name": "DHAKA CITY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6409",
      "college_name": "MIRPUR GIRLS IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6410",
      "college_name": "NEW MODEL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6411",
      "college_name": "GOVT. MUSIC COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6412",
      "college_name": "B. A. F. SHAHEEN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6413",
      "college_name": "ADAMJEE CANTONMENT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6414",
      "college_name": "DR. MALEKA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6415",
      "college_name": "SHAHID ZIA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6416",
      "college_name": "SIDDHESWARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6417",
      "college_name": "UTTARA ANWARA MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6418",
      "college_name": "GOVT. BIGGYAN COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6421",
      "college_name": "IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6422",
      "college_name": "TEJGAON COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6424",
      "college_name":
          "AHSANULLAH INSTITUTE OF INFORMATION &amp; COMMUNICATION TECH.",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6425",
      "college_name": "SK. BORHANUDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6427",
      "college_name": "UNITED COLLEGE OF BUSINESS &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6428",
      "college_name": "RAMPURA EKRAMUNNESSA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6429",
      "college_name": "MICRO INSTITUTE OF TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6430",
      "college_name": "R. K. CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6431",
      "college_name": "T &amp; T COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6432",
      "college_name": "NOTRE DAME COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6433",
      "college_name": "KHILGAON MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6434",
      "college_name": "SALIMULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6437",
      "college_name": "INTERGLOBAL BUSINESS SYSTEM INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6438",
      "college_name": "DHAKA COMMERCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6439",
      "college_name": "ABU JAR GIFARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6440",
      "college_name": "DR. SHAHIDULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6442",
      "college_name": "TEJGAON MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6443",
      "college_name": "CENTRAL WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6444",
      "college_name": "UNIVERSITY WOMENS FED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6445",
      "college_name": "PURANA PALTON GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6446",
      "college_name": "MOHAMMADPUR MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6447",
      "college_name": "LALMATIA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6448",
      "college_name": "SIDDHESWARI GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6449",
      "college_name": "SKEIKH FAZILATUNNESSA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6450",
      "college_name": "MIRZA ABBAS MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6451",
      "college_name": "DHAKA WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6452",
      "college_name": "TECHNO HAVEN INSTITUTE OF BUSINESS &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6453",
      "college_name": "SYNERGY INSTITUTE OF BUSINESS",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6454",
      "college_name":
          "BANGLADESH INSTITUTE OF BUSINESS EDUCATION &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6455",
      "college_name": "FAZLUL HAQUE MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6456",
      "college_name": "DANIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6457",
      "college_name": "MIRPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6458",
      "college_name": "MOHAMMADPUR KENDRIYA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6459",
      "college_name": "HABIBULLAH BAHAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6460",
      "college_name": "HAZI SALIM DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6462",
      "college_name": "KOLATIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6463",
      "college_name": "BHALUM ATAUR RAHMAN KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6464",
      "college_name": "DHAKA MOHANAGAR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6465",
      "college_name": "B. D. R. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6466",
      "college_name": "SARDAR SURUZZAMAN MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6467",
      "college_name": "KANCHKURA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6468",
      "college_name": "T &amp; T ADARSHA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6469",
      "college_name": "INSTITUTE OF SCIENCE &amp; TECHNOLOGY, DHANMONDI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6470",
      "college_name": "INSTITUTE OF INFORMATION &amp; TECHNOLOGY, UTTARA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6471",
      "college_name": "INSTITUTE OF SCIENCE TRADE &amp; TECHNOLOGY, PANTHAPATH",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6472",
      "college_name": "MICROLAND (IICE), DHANMONDI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6473",
      "college_name": "CENTRE FOR COMPUTER STUDIES, DHANMONDI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6474",
      "college_name": "COLLEGE OF TECHNOLOGY, DHANMONDI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6475",
      "college_name": "NATIONAL ACADEMY OF SCIENCE &amp; TECHNOLOGY, LALBAG",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6476",
      "college_name": "BHUIYAN ACADEMY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6477",
      "college_name": "A. K. M. RAHMATULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6478",
      "college_name": "INSTITUTE OF MANAGMENT &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6479",
      "college_name": "BANGLADESH INSTITUTE OF SCIENCE &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6480",
      "college_name": "B. K. S. P. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6481",
      "college_name": "BCIC COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6482",
      "college_name": "ASIAN INSTITUTE OF BUSINESS &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6483",
      "college_name":
          "BANGLADESH INSTITUTE OF BUSINESS ADMINISTRATION &amp; INFORMATION SYSTEM",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6484",
      "college_name": "DAFFODIL INSTITUTE OF INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6485",
      "college_name": "GOVT. BANGA BANDHU COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6486",
      "college_name": "ALHAJ MOCKBUL HOSSAIN DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6487",
      "college_name": "DHAKA IMPERIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6488",
      "college_name": "INSTITUTE OF LIFESKILLS AND INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6489",
      "college_name": "PALLABI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6490",
      "college_name": "HAZRAT SHAH ALI MAHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6491",
      "college_name": "INSTITUTE OF SCIENCE AND INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6492",
      "college_name": "INSTITUTE OF INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6493",
      "college_name":
          "INSTITUTE OF BUSINESS ADMINISTRATION &amp; INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6494",
      "college_name": "ACCESS INSTITUTE OF BUSINESS AND INFORMATICS",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6495",
      "college_name": "DHAKA STATE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6496",
      "college_name": "PRAFMASYS INSATITUTE OF INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6497",
      "college_name": "NORTHERN COLLEGE BANGLADESH (NCB)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6498",
      "college_name": "COLLEGE OF TECHNOLOGY (COT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6499",
      "college_name": "NEURAL INSTITUTE OF SCIENCE &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6501",
      "college_name": "NELCO INSTITUTE OF BANGLADESH",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6502",
      "college_name": "BITL COLLEGE OF INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6503",
      "college_name":
          "MOTIJHIL INSTITUTE OF SCIENCE BUSINESS ADMINISTRATION &amp; INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6504",
      "college_name": "IDEAL INSTITUTE OF SCIENCE &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6505",
      "college_name": "UTTARA TOWN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6506",
      "college_name":
          "BANGLADESH INSTITUTE OF INFORMATION SCIENCE &amp; TECHNOLOGY (BIIST)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6507",
      "college_name": "NIT INSTITUTION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6508",
      "college_name":
          "MANAGEMENT &amp; INFORMATION TECHNOLOGY EDUCATIONAL CAMPUS (MITEC)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6509",
      "college_name": "BGMEA INSTITUTE OF FASHION &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6510",
      "college_name": "ALHAJ ABDUL MANNAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6511",
      "college_name": "TOFAZZAL HOSSAIN CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6512",
      "college_name": "CENTRAL LAW COLLEGE, BIJOYNAGOR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6513",
      "college_name": "DHAKA LAW COLLEGE, MOTIJHEEL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6514",
      "college_name": "CITY LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6515",
      "college_name": "MIRPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6516",
      "college_name": "JATIYA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6517",
      "college_name": "GREEN VIEW LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6518",
      "college_name": "MOHAMMADPUR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6519",
      "college_name": "FATEMA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6520",
      "college_name": "METTROPOLIS IDEAL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6521",
      "college_name": "BANGABANDHU LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6522",
      "college_name": "DEMRA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6523",
      "college_name": "JAN-E-ALAM SARKAR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6524",
      "college_name": "RUPNAGAR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6525",
      "college_name": "EIDELKHANI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6526",
      "college_name": "DHANMONDI LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6527",
      "college_name": "MAHANAGAR LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6528",
      "college_name": "BANGLADESH LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6529",
      "college_name": "IDEAL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6530",
      "college_name": "SHAHEED RAMIZ UDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6531",
      "college_name": "DHAKA MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6532",
      "college_name": "EDUCATION AND DEVELOPMENT INSTITUTE, UTTARA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6533",
      "college_name": "SHER-E-BANGLA TEACHERS TRAINING COLLEGE, MIRPUR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6534",
      "college_name": "IDEAL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6535",
      "college_name": "GOVT. TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6536",
      "college_name": "DHAKA MODERN TEACHERS' TRAINING COLLEGE, MOWCHAK",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6537",
      "college_name": "BANGLADESH TEACHERS' TRAINING COLLEGE, FIRMGATE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6538",
      "college_name":
          "KHAN BAHADUR AHSAN ULLAH TEACHERS' TRAINING COLLEGE, SHAMOLY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6539",
      "college_name": "UNIVERSAL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6540",
      "college_name": "COLLEGE OF EDUCATION AND DEVELOPMENT STUDIES, KALABAGAN",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6541",
      "college_name": "COLLEGE OF EDUCATION RESEARCH AND TRAINING",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6542",
      "college_name": "SHEIKH JAMAL TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6543",
      "college_name": "SAVAR TEACHERS' TRAINING INSTITUTE, SAVAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6544",
      "college_name": "NEW RAJDHANI TEACHERS' TRAINING COLLEGE, NILKHET",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6545",
      "college_name":
          "SHEIKH FAZILATUNNESSA TEACHERS' TRAINING COLLEGE, 627 KAZIPARA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6546",
      "college_name": "DHAKA METROPOLITAN TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6547",
      "college_name": "MAHANAGAR TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6548",
      "college_name": "VICTORIA TEACHERS' TRAINING COLLEGE, LUXMIBAZAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6549",
      "college_name": "BIAM TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6550",
      "college_name": "SAIC TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6551",
      "college_name": "SHIKKHOK PROSHIKHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6552",
      "college_name": "NATIONAL TEACHERS' TRAINING INSTITUTE, KHILKHAT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6553",
      "college_name": "LIBERTY LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6554",
      "college_name": "DEWAN IDRIS LAW COLLEGE, SAVAR",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6555",
      "college_name": "CAPITAL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6556",
      "college_name": "NOBEL LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6557",
      "college_name": "GOVT. PHYSICAL EDUCATION COLLEGE",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6558",
      "college_name": "OLYMPIA INSTITUTE OF PHYSICAL EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6559",
      "college_name": "DEMRA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6560",
      "college_name":
          "INSTITUTE OF LIBRARY AND INFORMATION SCIENCE (ILIS), NILKHET, DHAKA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6561",
      "college_name":
          "INSTITUTE FOR LIBRARY AND INFORMATION MANAGEMENT (ILIM), DHAKA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6562",
      "college_name":
          "ESTEEM INSTITUTE OF BUSINESS SCIENCE &amp; INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6563",
      "college_name": "SAVAR PHYSICAL EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6564",
      "college_name": "NATIONAL DEFENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6565",
      "college_name": "DEFENCE SERVICES COMMAND AND STAFF COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6566",
      "college_name": "BANGLADESH INSTITUTE OF SPECIAL EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6567",
      "college_name": "TEACHERS TRAINING COLLEGE FOR SPECIAL EDUCATION",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6568",
      "college_name": "BANGLADESH PRESS INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6569",
      "college_name":
          "BANGLADESH INSTITUTE OF COMMUNICATION STUDIES AND PUBLIC RELATIONS",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6570",
      "college_name": "BANGLADESH INSTITUTE OF BANK MANAGEMENT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6571",
      "college_name": "ICHAMOTI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6572",
      "college_name": "PADMA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6573",
      "college_name": "SWID SPECIAL EDUCATION TEACHER'S TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6574",
      "college_name": "PRIME TEACHERS' TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6575",
      "college_name": "PIONEER COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6576",
      "college_name":
          "SHYAMOLI IDEAL LIBRARY AND INFORMATION SCIENCE INSTITUTE (SILISI)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6577",
      "college_name": "INTERNATIONAL EDUCATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6578",
      "college_name": "HASHEM UDDIN B. ED. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6579",
      "college_name": "NEW ERA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6580",
      "college_name": "DHAKA ART COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6581",
      "college_name": "CENTER FOR EXECUTIVE DEVELOPMENT STUDIES (CEDS)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6582",
      "college_name": "SAFS BUSINESS INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6583",
      "college_name": "BUSINESS EDUCATION AND MANAGEMENT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6584",
      "college_name": "DHAKA BUSINESS INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6585",
      "college_name": "ARCHBISHOP T. A. GANGULY TEACHERS TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6586",
      "college_name": "NATIONAL INSTITUTE OF FASHION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6587",
      "college_name": "INSTITUTE OF PROGRESSIVE MERITOCRACY (IPM)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6588",
      "college_name": "POLICE STAFF COLLEGE, BANGLADESH",
      "govt_stat": "Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6589",
      "college_name": "SIKDER COLLEGE OF TEXTILE AND FASHION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6590",
      "college_name": "COLLEGE OF FASHION TECHNOLOGY &amp; MANAGEMENT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6591",
      "college_name": "SHER-E-BANGLA NAGAR ADARSHA MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6592",
      "college_name": "NAYABAZAR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6593",
      "college_name": "DCCI BUSINESS INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6594",
      "college_name":
          "PROFESSIONAL INSTITUTE OF SCIENCE AND FASHION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6595",
      "college_name": "BANGLADESH INSTITUTE OF MANAGEMENT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6596",
      "college_name": "NATIONAL INSTITUTE OF DESIGN",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6597",
      "college_name": "UNITED COLLEGE OF AVIATION SCIENCE &amp; MANAGEMENT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6598",
      "college_name": "MATUAIL HAZI ABDUL LATIF BHUIYAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6599",
      "college_name": "IDEAL INSTITUTE OF BUSINESS &amp; SCIENCE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6601",
      "college_name": "STAMFORD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6602",
      "college_name": "DHAKA MOHILA (DEGREE) COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6603",
      "college_name": "DHAKA INSTITUTE OF FASHION AND TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6604",
      "college_name": "INSTITUTE OF BUSINESS &amp; TECHNOLOGY (IBT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6605",
      "college_name": "UTTARA INSTITUTE OF BUSINESS AND TECHNOLOGY. (UIBT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6606",
      "college_name": "CROWN INSTITUTE OF BUSINESS AND TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6607",
      "college_name": "SHYAMOLI IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6608",
      "college_name": "SHAHEED PRESIDENT ZIAUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6609",
      "college_name": "GULSHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6610",
      "college_name": "SHURER DHARA COLLEGE OF MUSIC",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6611",
      "college_name": "DR. M. MIZANUR RAHMAN PROFESSIONAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6612",
      "college_name": "BHALUM ATAUR RAHMAN KHAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6613",
      "college_name": "EMINENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6614",
      "college_name": "HAJI ABDUL AWAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6615",
      "college_name": "UPDATE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6616",
      "college_name": "UTTARA ADHUNIK LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7001",
      "college_name": "PATENGA CITY CORPORATION WOMENS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7002",
      "college_name": "SITAKUND MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7003",
      "college_name": "UTTAR SANDWIP DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7004",
      "college_name": "SARAIPARA CITY CORPORATION COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7005",
      "college_name": "SYEDA SELIMA QUADER CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7006",
      "college_name": "SOUTH SANDWIP COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7007",
      "college_name":
          "CHITTAGONG BGMEA INSTITUTE OF FASHION &amp; TECHNOLOGY (CBIFT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7008",
      "college_name": "K.C. SHAHEED ZIAUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7009",
      "college_name": "BAKALIA SHAHID N.M.M.J COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7010",
      "college_name": "MASTER NAZIR AHMAD DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7011",
      "college_name": "POSTARPAR ASMA KHATUN CITY CORPORATION MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7012",
      "college_name": "G A M  CHARTERED COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7013",
      "college_name": "DAFFODIL INSTITUTE OF IT",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7014",
      "college_name": "PATIYA LAW COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7015",
      "college_name": "FATEYABAD COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6617",
      "college_name": "ABDULLAH AL MAMUN THEATRE SCHOOL",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6618",
      "college_name": "APPARELS INSTITUTE OF FASHION &amp; TECHNOLOGY (AIFT)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4414",
      "college_name": "DULAHAZARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5346",
      "college_name": "BARACHOWNA KUTUBPUR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COXS BAZAR",
      "college_code": "4415",
      "college_name": "BADARKHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2598",
      "college_name": "ORIENTAL INSTITUTE OF BUSINESS ADMINISTRATION (OIBA)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0131",
      "college_name": "MATREEBHASHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0367",
      "college_name": "CHITTRA MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2631",
      "college_name": "RADHANAGAR BARENDRA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3775",
      "college_name": "PRINCIPAL ABUL KALAM MAZUMDER MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6619",
      "college_name": "INSPIRATION INSTITUTE OF DESIGN &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6620",
      "college_name": "COLLEGE OF AVIATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5347",
      "college_name": "BHAIGHAT IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5253",
      "college_name": "BRITISH BANGLA INSTITUTE OF MANAGEMENT &amp; TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1743",
      "college_name": "KUSHIARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4825",
      "college_name": "ATPARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2264",
      "college_name": "JANNAT ARA HENRY SCIENCE &amp; TECHNOLOGY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1228",
      "college_name": "BANGAMATA BEGUM FAZILATUNNESA MUJIB WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7016",
      "college_name": "BANSKHALI GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1538",
      "college_name": "HAZI HAMEJUDDIN MRIDHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6621",
      "college_name": "ROKEYA AHSAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3776",
      "college_name": "PARUARA ABDUL MATIN KHASRU COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5348",
      "college_name": "RAZABARI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "B.BARIA",
      "college_code": "3829",
      "college_name": "TAJUL ISLAM ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5349",
      "college_name": "MIRZAPUR MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1426",
      "college_name": "ABDULLAH AL ISLAM JAKOB COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2769",
      "college_name": "SARIAKANDI ABDUL MANNAN MOHILA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1427",
      "college_name": "PRINCIPAL NAZRUL ISLAM COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1159",
      "college_name": "ABDUR RAB SERNIABAT COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "BAGERHAT",
      "college_code": "0132",
      "college_name": "MA BABAR RHIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BARISAL",
      "college_code": "1160",
      "college_name": "PURBO HOSNABAD MOHABIDDALAYA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JESSORE",
      "college_code": "0569",
      "college_name": "BHOYRAB ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "2599",
      "college_name": "BASANTOKEDAR COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "7301",
      "college_name": "ABDUL GONI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "TANGAIL",
      "college_code": "5350",
      "college_name": "BOALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3254",
      "college_name": "MADARGONJ DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3127",
      "college_name": "SHAHID ZIAUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "MOULVIBAZAR",
      "college_code": "2016",
      "college_name": "SHAH- NIMATRA SAGORNAL- FULTOLA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "MAGURA",
      "college_code": "0720",
      "college_name": "HAZIPUR SHAMMILONI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0640",
      "college_name": "SHAHID NUR ALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3033",
      "college_name": "JADUR CHAR MODEL DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "GAIBANDHA",
      "college_code": "3335",
      "college_name": "JUMARBARI ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1744",
      "college_name": "UTTAR BISHWANATH AMJOD ULLAH COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "MANIKGANJ",
      "college_code": "5822",
      "college_name": "BACHAMARA BAGUTIA CHARKATARY ( B B C) COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NETROKONA",
      "college_code": "4826",
      "college_name": "GONDA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "NILPHAMARI",
      "college_code": "3128",
      "college_name": "IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "JENAIDHA",
      "college_code": "0641",
      "college_name": "A &amp; J COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PEROJPUR",
      "college_code": "1229",
      "college_name": "ALHAJ ABDUR RAHMAN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3777",
      "college_name": "JAFARGONJ MIR ABDUL GAFUR DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3778",
      "college_name": "HOMNABAD ADARSHA DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2770",
      "college_name": "GABTOLI MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "SIRAJGONJ",
      "college_code": "2265",
      "college_name": "BELKUCHI MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHANDPUR",
      "college_code": "3932",
      "college_name": "NAORI ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7017",
      "college_name": "SATKANIA ADARSHA MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2771",
      "college_name": "KOHINOOR BEGUM LIBRARY SCIENCE AND DIPLOMA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5536",
      "college_name": "GAZIPUR CITY INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2772",
      "college_name": "POPULAR LIBRARY AND INFORMATION SCIENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "NOAKHALI",
      "college_code": "4233",
      "college_name": "NOAKHALI MODERN INSTITUTE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "DINAJPUR",
      "college_code": "3460",
      "college_name": "S. F LIBRARY &amp; INFORMATION SCIENCE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6622",
      "college_name": "COUNTER FOTO A CENTER FOR VISUAL ARTS",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "RANGPUR",
      "college_code": "3255",
      "college_name": "RANGPUR INSTITUTE OF INFORMATION TECHNOLOGY",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6623",
      "college_name": "DHAKA PROFESSIONALS COLLEGE (DPC)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1745",
      "college_name": "ZAKIGONJ GOVT. COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2341",
      "college_name": "RAHIM UDDIN AHMED MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CHITTAGONG",
      "college_code": "7018",
      "college_name": "PROFESSOR KAMAL UDDIN CHOWDHURY COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1918",
      "college_name": "MOINUL HAQUE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1315",
      "college_name": "AKLIMA MOAZZEM HOSSAIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "FARIDPUR",
      "college_code": "6026",
      "college_name": "MAHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2342",
      "college_name": "BANGABANDHU SHAIKH MUJIB COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAOGAON",
      "college_code": "2437",
      "college_name": "PANIAL ADARSHA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2773",
      "college_name": "BOGRA WOMEN'S COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NATORE",
      "college_code": "2343",
      "college_name": "CHAMARI DEGREE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3779",
      "college_name": "ABDUL MATIN KHASRU MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SUNAMGANJ",
      "college_code": "1919",
      "college_name": "SUNAMGANJ POURA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6624",
      "college_name":
          "SHAHID S. A. MEMORIAL FASHION DESIGN &amp; TEXTILE COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "NARAYANGANJ",
      "college_code": "5622",
      "college_name": "SHANARPAR ROWSHAN ARA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "BHOLA",
      "college_code": "1428",
      "college_name": "NILIMA JAKOB COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "THAKURGAON",
      "college_code": "3528",
      "college_name": "THAKURGAON SPECIAL TEACHERS TRAINING COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KHULNA",
      "college_code": "0368",
      "college_name": "SYED ARSHAD ALI AND SABURUNNESSA GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "NAWABGONJ",
      "college_code": "2632",
      "college_name": "ROHANPUR P.M. IDEAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RANGPUR",
      "DIST_NAME": "KURIGRAM",
      "college_code": "3034",
      "college_name": "BALDIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "LUXMIPUR",
      "college_code": "4019",
      "college_name": "RAMGOTI AHMADIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "PATUAKHALI",
      "college_code": "1539",
      "college_name": "ALHAZ JALAL UDDIN COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "BARISAL",
      "DIST_NAME": "JHALOKATHI",
      "college_code": "1316",
      "college_name": "HEMAYET UDDIN COLLEGE, GUATON",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5114",
      "college_name": "MODEL GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "SHERPUR",
      "college_code": "5115",
      "college_name": "BEER MUKTIJUDDHA ATIUR RAHMAN MODEL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "SYLHET",
      "DIST_NAME": "SYLHET",
      "college_code": "1746",
      "college_name": "MALIK NAHAR MEMORIAL COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "CHUADANGA",
      "college_code": "0816",
      "college_name": "UTHALI COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "CUMILLA",
      "college_code": "3781",
      "college_name": "NANGALKOT MODEL MOHILA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6441",
      "college_name": "BEGUM BADRUNNESSA GOVT. GIRLS COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "DHAKA",
      "DIST_NAME": "DHAKA",
      "college_code": "6627",
      "college_name": "NATIONAL INSTITUTE OF SCIENCE AND TECHNOLOGY (NIST)",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "RAJSHAHI",
      "college_code": "7302",
      "college_name": "VARENDRA COLLEGE, RAJSHAHI",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "CHITTAGONG",
      "DIST_NAME": "COMILLA",
      "college_code": "3782",
      "college_name": "Institute of Professional Education",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "GAZIPUR",
      "DIST_NAME": "GAZIPUR",
      "college_code": "5537",
      "college_name": "GAZIPUR MATROPOLITAN INSTITUTE ",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "RAJSHAHI",
      "DIST_NAME": "BOGRA",
      "college_code": "2774",
      "college_name": "JAMUR ISLAMIA COLLEGE",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "KHULNA",
      "DIST_NAME": "KUSTIA",
      "college_code": "1043",
      "college_name": "GARAI MOHILA COLLEGE, KUSHTIA",
      "govt_stat": "Non-Government college"
    },
    {
      "DIVI_NAME": "MYMENSINGH",
      "DIST_NAME": "MYMENSINGH",
      "college_code": "5255",
      "college_name": "METROPOLITAN COLLEGE, MYMENSING",
      "govt_stat": "Non-Government college"
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
                user["college_name"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["college_code"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["DIST_NAME"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["DIVI_NAME"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) ||
                user["govt_stat"]
                    .toLowerCase()
                    .contains(enteredKeyword.toLowerCase()) )
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
        title: const Text("Search COLLEGE"),
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
                    title: Text(_foundUsers[index]["college_name"]),
                    subtitle: Text(_foundUsers[index]["DIST_NAME"]),
                    onTap: () {
                      // launch(_foundUsers[index]['Mobile_no']);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('' + _foundUsers[index]['college_name'] ?? ''),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('college Code:  ' +
                                        _foundUsers[index]['college_code'] ??
                                    ''),
                                Text(
                                    'District Name: ' + _foundUsers[index]['DIST_NAME'] ?? ''),
                                Text('Division Name: ' +
                                        _foundUsers[index]['DIVI_NAME'] ??
                                    ''),
                                Text('Government Status: '+
                                        _foundUsers[index]['govt_stat'] ??
                                    ''),

                                SizedBox(height: 10), // add some spacing
                              /*  Text('Department: ' +
                                        _foundUsers[index]['DEPT_NAME'] ??
                                    ''), */
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: Text('Call'),
                                onPressed: () {
                                  // Add your code here to call the mobile number
                                 // launch('tel:${_foundUsers[index]['Mobile_no']}');
                                      
                                },
                              ),

                              TextButton(
                                child: Text('SMS'),
                                onPressed: () {
                                  // Add your code here to send an SMS to the mobile number
                                 // launch('sms:${_foundUsers[index]['Mobile_no']}');
                                      
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