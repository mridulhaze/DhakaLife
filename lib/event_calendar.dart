import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class EventCalendarScreen extends StatefulWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventCalendarScreen> createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;

    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-03-13": [
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2023-03-30": [
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2023-03-20": [
        {"eventTitle": "ss", "eventDescp": "ss"}
      ],
      "2023-04-14": [
        {"eventTitle": "পহেলা বৈশাখ", "eventDescp": "BANGLA NOBOBORSO"}
      ],
      "2023-04-19": [
        {
          "eventTitle": "শবে কদর",
          "eventDescp":
              "শবে কদর  এর অর্থ -অতিশয় সম্মানিত ও মহিমান্বিত রাত- বা পবিত্র রজনী। ফার্সি ভাষায় -শাব ও আরবি ভাষায় - লাইলাতুল অর্থ হলো রাত্রি বা রজনী, অন্যদিকে ‘কদর’ শব্দের অর্থ সম্মান, মর্যাদা, মহাসম্মান। এ ছাড়া এর অন্য অর্থ হল ভাগ্য, পরিমাণ ও তাকদির নির্ধারণ করা।[২] ইসলাম ধর্ম অনুসারে, এ রাতে ইসলাম ধর্মের ধর্মপ্রচারক মহানবী হযরত মোহাম্মদ (সঃ)-এর অনুসারীদের সম্মান বৃদ্ধি করা হয় এবং মানবজাতির ভাগ্য পুনর্নির্ধারণ করা হয়। তাই মুসলমানদের কাছে এই রাত অত্যন্ত পুণ্যময় ও মহাসম্মানিত হিসেবে পরিগণিত। কুরআনের বর্ণনা অনুসারে, আল্লাহ এই রাত্রিকে অনন্য মর্যাদা দিয়েছেন এবং এই একটি মাত্র রজনীর ইবাদত হাজার মাসের ইবাদতের চেয়েও অধিক সওয়াব অর্জিত হওয়ার প্রতিশ্রুতি দেওয়া হয়েছে। প্রতিবছর মাহে রমজানে এই মহিমান্বিত রজনী লাইলাতুল কদর মুসলিমদের জন্য সৌভাগ্য বয়ে আনে বলে তারা বিশ্বাস করে।"
        }
      ],
      "2023-04-21": [
        {
          "eventTitle": "জুমাতুল বিদা",
          "eventDescp":
              "জুমাতুল বিদা (আরবি: جمعة الوداع যার অর্থ বিদায় শুক্রবার, যাকে আল-জুমুআ আল-ইয়াতিমাহ আরবি: الجمعة اليتيمة বা আল-উইদা জুমা আরবি: الوداع جمعة-ও বলা হয়) হচ্ছে ঈদুল ফিতরের পূর্বে রমজান মাসের শেষ শুক্রবার।"
        }
      ],
      "2023-04-20": [
        {
          "eventTitle": "ইদ উল-ফিতর",
          "eventDescp":
              "ইদ উল-ফিতর কথাটির অর্থ উপবাস ভঙ্গের উত্‍সব। রমজান মাসের উপবাস ভঙ্গ করা হয় ইদের দিনে। চাঁদ দেখার ওপর নির্ভর করে, রমজান মাস কখনও ২৯ দিন তো কখনও ৩০ দিন হয়। এরপর চাঁদ দেখে পালন নয় খুশির ইদ।"
        }
      ],
      "2023-04-22": [
        {
          "eventTitle": "ইদ উল-ফিতর",
          "eventDescp":
              "ইদ উল-ফিতর কথাটির অর্থ উপবাস ভঙ্গের উত্‍সব। রমজান মাসের উপবাস ভঙ্গ করা হয় ইদের দিনে। চাঁদ দেখার ওপর নির্ভর করে, রমজান মাস কখনও ২৯ দিন তো কখনও ৩০ দিন হয়। এরপর চাঁদ দেখে পালন নয় খুশির ইদ।"
        }
      ],
      "2023-04-23": [
        {
          "eventTitle": "ইদ উল-ফিতর",
          "eventDescp":
              "ইদ উল-ফিতর কথাটির অর্থ উপবাস ভঙ্গের উত্‍সব। রমজান মাসের উপবাস ভঙ্গ করা হয় ইদের দিনে। চাঁদ দেখার ওপর নির্ভর করে, রমজান মাস কখনও ২৯ দিন তো কখনও ৩০ দিন হয়। এরপর চাঁদ দেখে পালন নয় খুশির ইদ।"
        }
      ],
      "2023-04-24": [
        {
          "eventTitle": "ইদ উল-ফিতর",
          "eventDescp":
              "ইদ উল-ফিতর কথাটির অর্থ উপবাস ভঙ্গের উত্‍সব। রমজান মাসের উপবাস ভঙ্গ করা হয় ইদের দিনে। চাঁদ দেখার ওপর নির্ভর করে, রমজান মাস কখনও ২৯ দিন তো কখনও ৩০ দিন হয়। এরপর চাঁদ দেখে পালন নয় খুশির ইদ।"
        }
      ],
      "2023-04-25": [
        {
          "eventTitle": "ইদ উল-ফিতর",
          "eventDescp":
              "ইদ উল-ফিতর কথাটির অর্থ উপবাস ভঙ্গের উত্‍সব। রমজান মাসের উপবাস ভঙ্গ করা হয় ইদের দিনে। চাঁদ দেখার ওপর নির্ভর করে, রমজান মাস কখনও ২৯ দিন তো কখনও ৩০ দিন হয়। এরপর চাঁদ দেখে পালন নয় খুশির ইদ।"
        }
      ],
      "2023-05-1": [
        {
          "eventTitle": "মে দিবস",
          "eventDescp":
              "মে দিবস, শ্রমিক দিবস বা বিশ্ব শ্রমিক দিবস—যে নামেই ডাকা হোক না কেন, দিনটি বিশ্বব্যাপী শ্রমিকদের প্রতি শ্রদ্ধা-সম্মান-সংহতি জানানোর দিন হিসেবেই পালিত হয়ে আসছে ১৯০৪ সাল থেকে.১৮৮৬ সালের ১ মে আমেরিকার শ্রমিকেরা দৈনিক শ্রমঘণ্টা ১২ থেকে কমিয়ে ৮ ঘণ্টা করার দাবিতে একটি ধর্মঘটের ডাক দিয়েছিলেন। মে মাসের ৪ তারিখ শিকাগো শহরের হে মার্কেট স্কয়ারে পুলিশের উপস্থিতিতে শ্রমিক সমাবেশ অনুষ্ঠিত হয়। সমাবেশে অজ্ঞাতনামা কেউ বোমার বিস্ফোরণ ঘটালে একজন পুলিশ অফিসারের মৃত্যু হয়। এ সময় পুলিশ গুলি চালালে অনেক শ্রমিক নিহত হন। পরের বিভিন্ন ঘটনার প্রেক্ষাপটে আমেরিকান সরকার শ্রমিকদের দাবি মেনে নিতে বাধ্য হয়। দৈনিক ৮ ঘণ্টা কাজ করার দাবি পূরণ, শ্রমিকদের মৃত্যুর ঘটনাকে স্মরণ এবং তাঁদের প্রতি সংহতি জানাতে ১ মে শ্রমিক দিবস হিসেবে পালন করা হয়"
        }
      ],
      "2023-05-4": [
        {
          "eventTitle": "বুদ্ধ পূর্ণিমা",
          "eventDescp":
              "বুদ্ধ পূর্ণিমা বা বৈশাখী পূর্ণিমা হল বৌদ্ধ ধর্মাবলম্বীদের পবিত্রতম উৎসব। এই পুণ্যোৎসব বৈশাখ মাসের পূর্ণিমা তিথিতে উদযাপিত হয়। বৈশাখী পূর্ণিমা দিনটি বুদ্ধের ত্রিস্মৃতি বিজড়িত। এই পবিত্র তিথিতে বুদ্ধ জন্মগ্রহণ করেছিলেন, বোধি বা সিদ্ধিলাভ করেছিলেন এবং মহাপরিনির্বাণ লাভ করেছিলেন।"
        }
      ],
      "2023-05-5": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-05-6": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি।"}
      ],
      "2023-05-12": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-05-13": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-05-19": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-05-20": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-05-26": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-05-27": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-06-16": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-06-17": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-06-23": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-06-24": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-06-27": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-06-28": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-06-29": [
        {
          "eventTitle": "ঈদুল আযহা",
          "eventDescp":
              "ঈদ উল আযহা সারা বিশ্বের মুসলমানদের মধ্যে পালিত হয়। এটি একটি উৎসব যা হযরত ইব্রাহীম (আ.) আল্লাহর প্রতি তার দৃঢ় বিশ্বাসের জন্য যে আত্মত্যাগ করেছিলেন তার স্মরণে।ইব্রাহিম (আঃ) তার পুত্র হযরত ইসমাইল (আঃ) কে কোরবানি করার ইচ্ছা প্রকাশ করেছিলেন কিন্তু আল্লাহ তার পুত্রকে একটি দুম্বা  দিয়ে প্রতিস্থাপন করেছিলেন। আল্লাহ ইব্রাহিম (আঃ)-এর আত্মসমর্পণে আল্লাহ তাআলা  এতটাই সন্তুষ্ট হয়েছিলেন যে, তিনি হযরত ইব্রাহিম (আঃ) এর  এই প্রদর্শনকে একজন মুসলমানের জীবনের একটি স্থায়ী অংশ বানিয়েছিলেন। এই ঘটনাটি কুরআনে উল্লেখ করা হয়েছে - সূরা আস-সাফফাত (37:102)।"
        }
      ],
      "2023-06-30": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-06-31": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-07-01": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-07-02": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-07-03": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-07-04": [
        {"eventTitle": "ঈদুল আযহার ছুটি", "eventDescp": "ঈদুল আযহার ছুটি"}
      ],
      "2023-07-07": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-07-08": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-07-14": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-07-15": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-07-21": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-07-22": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-07-28": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-07-29": [
        {
          "eventTitle": "মহরমের ছুটি ",
          "eventDescp":
              " প্রতি বছর মহররম মাসের ১০ তারিখ ইসলাম ধর্মে আশুরা পালন করা হয়ে থাকে। এই দিনে হযরত মুসা আলাইহিস সালাম ফেরাউন ও তার সৈন্যদের হাত থেকে মুক্তি পায়। অন্যদিকে এই দিনে আল্লাহ তায়ালা ফেরাউন ও তার সৈন্যদেরকে দরিয়ায় ডুবিয়ে ধ্বংস করেন। তাই হযরত মুসা আলাইহি ওয়াসাল্লাম এই বিজয় উপলক্ষে আশুরার দিনে রোজা রাখতেন।  "
        }
      ],
      "2023-08-04": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-08-05": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-08-11": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-08-12": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-08-15": [
        {
          "eventTitle": "জাতীয় শোক দিবস ছুটি",
          "eventDescp":
              "প্রতিবছরের ১৫ আগস্ট জাতীয় ও রাষ্ট্রীয়ভাবে এ দিবসটি শোকের সাথে পালন করা হয়। এ দিবসে কালো পতাকা উত্তোলন ও বাংলাদেশের জাতীয় পতাকা অর্ধনিমিত রাখা হয়। ১৯৭৫ সালের ১৫ আগস্ট তারিখে বাংলাদেশ ও স্বাধীনতার স্থপতি শেখ মুজিবুর রহমানকে সপরিবারে হত্যা করা হয়।"
        }
      ],
      "2023-08-25": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-08-26": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-01": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-02": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-06": [
        {
          "eventTitle": "শুভ জন্মাষ্টমী ছুটি",
          "eventDescp":
              "ভগবান শ্রীকৃষ্ণের জন্মতিথি উদযাপন উপলক্ষে পালিত হয় জন্মাষ্টমী। হিন্দু ধর্মের মহা গুরুত্বপূর্ণ এই অনুষ্ঠানটি ব্যাপক উৎসবে মধ্য দিয়ে পালিত হয়ে থাকে।ভাদ্রমাসের কৃষ্ণপক্ষের অষ্টমী তিথিতে শ্রীকৃষ্ণের জন্মদিন পালন করা হয়। কথিত আছে ভগবান বিষ্ণু শ্রীকৃষ্ণ রূপে দ্বাপর যুগে অবতীর্ণ হয়েছিলেন। "
        }
      ],
      "2023-09-08": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-09": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-13": [
        {
          "eventTitle": "আখেরি চাহার সোম্বা ছুটি",
          "eventDescp":
              "‘আখেরি চাহার শোম্বা’ মানে শেষ বুধবার। ‘আখেরি চাহার শোম্বা’ কথাটি ফারসি। ইসলামের ইতিহাসে সফর মাসের শেষ বুধবার ‘আখেরি চাহার শোম্বা’ নামে পরিচিত। প্রসিদ্ধ মতে, দিনটি ছিল সফর মাসের ২৬ তারিখ।বর্ণিত আছে, হজরত নবী করিম (সা.) ইহজগৎ থেকে বিদায় নেওয়ার পূর্ববর্তী সফর মাসের শেষ সপ্তাহে ভীষণ অসুস্থ হয়ে পড়েছিলেন। অতঃপর তিনি এই মাসের শেষ বুধবার কিছুটা সুস্থ হয়ে গোসল করে, কিছু পানাহার করে মসজিদে নববিতে গিয়ে নামাজের ইমামতি করেছিলেন। এতে উপস্থিত সাহাবিরা অত্যন্ত আনন্দিত হয়েছিলেন।"
        }
      ],
      "2023-09-15": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-16": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-22": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-23": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-28": [
        {
          "eventTitle": "ঈদ-এ-মিলাদুন্নবী ছুটি",
          "eventDescp":
              "নবী পাক সাল্লাল্লাহু আলাইহি ওয়া সাল্লাম এর আগমন উপলক্ষে আল্লাহর শুকরিয়ার্থে শরীয়ত সম্মতভাবে খুশি উদযাপন করাই হলো ঈদে মিলাদুন্নবী (সা :)। নবী রাসূল প্রেরণের ক্রমধারায় শেষ নবী হযরত মোহাম্মদ মোস্তফা (সা:) এর আর্বিভাব ছিল একটি বিস্ময়কর ব্যাপার।"
        }
      ],
      "2023-09-29": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-09-30": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-10-06": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-10-07": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-10-13": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-10-14": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-10-20": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-10-21": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-10-23": [
        {
          "eventTitle": "দুর্গাপূজা ছুটি",
          "eventDescp":
              "দুর্গাপূজা বা দুর্গোৎসব হল দেবী দুর্গার পূজাকে কেন্দ্র করে ভারত উপমহাদেশে প্রচলিত একটি হিন্দু উৎসব।এটি সারা বিশ্বে হিন্দু সম্প্রদায়ের দ্বারা পালিত হয়, তবে ভারতের পশ্চিমবঙ্গ, বিহার, আসাম, ত্রিপুরা, ওড়িশা, ঝাড়খন্ড, উত্তর প্রদেশ (পূর্বাঞ্চল) এবং বাংলাদেশে ঐতিহ্যগত বিশেষভাবে উদযাপিত হয়। এটি বাংলা বর্ষপঞ্জির আশ্বিন মাসের শুক্লপক্ষে অনুষ্ঠিত হয়।দুর্গাপূজা মূলত দশ দিনের উৎসব,যার মধ্যে শেষ পাঁচটি সবচেয়ে তাৎপর্যপূর্ণ। আশ্বিনের নবরাত্রির পূজা শারদীয় পূজা এবং বসন্তের নবরাত্রির পূজা বাসন্তিক বা বসন্তকালীন দুর্গাপূজা নামে পরিচিত। ২০২১ সালের ডিসেম্বরে কলকাতার দুর্গাপূজা ইউনেস্কোর অধরা সাংস্কৃতিক ঐতিহ্যের তালিকায় যুক্ত করা হয়।"
        }
      ],
      "2023-10-24": [
        {
          "eventTitle": "দুর্গাপূজা ছুটি",
          "eventDescp":
              "দুর্গাপূজা বা দুর্গোৎসব হল দেবী দুর্গার পূজাকে কেন্দ্র করে ভারত উপমহাদেশে প্রচলিত একটি হিন্দু উৎসব।এটি সারা বিশ্বে হিন্দু সম্প্রদায়ের দ্বারা পালিত হয়, তবে ভারতের পশ্চিমবঙ্গ, বিহার, আসাম, ত্রিপুরা, ওড়িশা, ঝাড়খন্ড, উত্তর প্রদেশ (পূর্বাঞ্চল) এবং বাংলাদেশে ঐতিহ্যগত বিশেষভাবে উদযাপিত হয়। এটি বাংলা বর্ষপঞ্জির আশ্বিন মাসের শুক্লপক্ষে অনুষ্ঠিত হয়।দুর্গাপূজা মূলত দশ দিনের উৎসব,যার মধ্যে শেষ পাঁচটি সবচেয়ে তাৎপর্যপূর্ণ। আশ্বিনের নবরাত্রির পূজা শারদীয় পূজা এবং বসন্তের নবরাত্রির পূজা বাসন্তিক বা বসন্তকালীন দুর্গাপূজা নামে পরিচিত। ২০২১ সালের ডিসেম্বরে কলকাতার দুর্গাপূজা ইউনেস্কোর অধরা সাংস্কৃতিক ঐতিহ্যের তালিকায় যুক্ত করা হয়।"
        }
      ],
      "2023-10-27": [
        {
          "eventTitle": "ফাতেহা-ই-ইয়াজদহম ছুটি",
          "eventDescp":
              "ফাতেহা-ই-ইয়াজদাহাম হলো বড় পীর হজরত আবদুল কাদির জিলানী রহ. এর ওফাত দিবস। হিজরি ৫৬১ সনের ১১ রবিউস সানি তিনি ইন্তিকাল করেন।"
        }
      ],
      "2023-10-28": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-03": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-04": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-10": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-11": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-17": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-18": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-24": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-11-25": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-01": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-02": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-08": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-09": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-14": [
        {
          "eventTitle": "শহীদ বুদ্ধিজীবী দিবস ছুটি",
          "eventDescp":
              "১৪ ডিসেম্বর শহীদ বুদ্ধিজীবী দিবস। এদিন জাতি মহান মুক্তিযুদ্ধে ঘৃণ্য হত্যাকাণ্ডের শিকার তার শ্রেষ্ঠ সন্তানদের শ্রদ্ধাভরে স্মরণ করবে। মহান মুক্তিযুদ্ধে পরাজয় নিশ্চিত জেনে পাকিস্তানি হানাদার বাহিনী বাঙালি জাতিকে মেধাশূন্য করার ঘৃণ্য চক্রান্ত করে।"
        }
      ],
      "2023-12-15": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-16": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-22": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-23": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-24": [
        {"eventTitle": "শীতকালীন ছুটি", "eventDescp": "শীতকালীন ছুটি"}
      ],
      "2023-12-25": [
        {
          "eventTitle": "বড়দিন ছুটি",
          "eventDescp":
              "বড়দিন বা ক্রিসমাস একটি বাৎসরিক খ্রিস্টীয় উৎসব। ২৫ ডিসেম্বর তারিখে যিশু খ্রিস্টের জন্মদিন উপলক্ষে এই উৎসব পালিত হয়।"
        }
      ],
      "2023-12-26": [
        {"eventTitle": "শীতকালীন ছুটি", "eventDescp": "শীতকালীন ছুটি"}
      ],
      "2023-12-27": [
        {"eventTitle": "শীতকালীন ছুটি", "eventDescp": "শীতকালীন ছুটি"}
      ],
      "2023-12-28": [
        {"eventTitle": "শীতকালীন ছুটি", "eventDescp": "শীতকালীন ছুটি"}
      ],
      "2023-12-29": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
      "2023-12-30": [
        {"eventTitle": "সাপ্তাহিক ছুটি", "eventDescp": "সাপ্তাহিক ছুটি"}
      ],
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                //Navigator.pop(context);
                return;
              } else {
                print(titleController.text);
                print(descpController.text);

                setState(() {
                  if (mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                      null) {
                    mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                        ?.add({
                      "eventTitle": titleController.text,
                      "eventDescp": descpController.text,
                    });
                  } else {
                    mySelectedEvents[
                        DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                      {
                        "eventTitle": titleController.text,
                        "eventDescp": descpController.text,
                      }
                    ];
                  }
                });

                print(
                    "New Event for backend developer ${json.encode(mySelectedEvents)}");
                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event Calendar Example'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2020),
            lastDay: DateTime(2035),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDate, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
            eventLoader: _listOfDayEvents,
          ),
          ..._listOfDayEvents(_selectedDate!).map(
            (myEvents) => ListTile(
              leading: const Icon(
                Icons.done,
                color: Colors.red,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Event Title:   ${myEvents['eventTitle']}'),
              ),
              subtitle: Text('Description:   ${myEvents['eventDescp']}'),
            ),
          ),
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        label: const Text('Add Event'),
      ),
    );
  }
}
