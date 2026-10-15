# DhakaLife (ঢাকা লাইফ)

> **Dhaka's Hyperlocal Smart City Super App & Everyday Living Companion**  
> Built with Flutter (Material 3), GetX, Phosphor Icons, Open-Meteo API, SQLite & Firebase.

---

## 📱 About DhakaLife

**DhakaLife (ঢাকা লাইফ)** is a modern, responsive, Bangla-first mobile application built for residents, daily commuters, and professionals in Dhaka, Bangladesh. It provides instant access to critical urban services, real-time civic resources, verified hyperlocal technicians, and National University services through one cohesive, battery-efficient interface.

### ✨ Key Features

1. **ডাইনামিক সময় সচেতন ব্যানার (Time-Aware Hero Dashboard)**:
   - স্বয়ংক্রিয় সকাল (`morning.jpeg`), দুপুর (`noon.jpeg`) ও রাত (`night.jpeg`) দৃশ্যপট।
   - রিয়েল-টাইম ঢাকা আবহাওয়া (Open-Meteo লাইভ তাপমাত্রা, অনুভূত তাপমাত্রা ও আর্দ্রতা)।
   - দ্রুত অ্যাকশন পিলস (জরুরি ৯৯৯, মেট্রোরেল গাইড, লাইভ বাজার দর, জাতীয় বিশ্ববিদ্যালয়)।

2. **নিকটবর্তী প্রয়োজনীয় কারিগর ও সেবা (Hyperlocal Mistri & Services Network)**:
   - যাচাইকৃত স্থানীয় কারিগর (প্লাম্বার, ইলেকট্রিশিয়ান, এসি ও ফ্রিজ, গ্যাসের চুলা, মেকানিক, কাঠমিস্ত্রি, ক্লিনিং)।
   - ২৪ ঘণ্টা জরুরি ফার্মেসি, ক্লিনিক ও ফাস্টট্র্যাক এটিএম বুথ।
   - **Haversine Geodesic Distance Engine**: ইউজারের থানা/এলাকা অনুযায়ী রিয়েলটাইম দূরত্ব গণনা (যেমন: ৪৫০ মিটার, ৮০০ মিটার, ১.২ কিমি)।
   - সরাসরি ওয়ান-ট্যাপ ফোন ডায়ালার (`tel:`) এবং হোয়াটসঅ্যাপ চ্যাট ইন্টিগ্রেশন।
   - স্বচ্ছ মূল্য তালিকা সহ সার্ভিস মার্কেটপ্লেস ও ইনস্ট্যান্ট বুকিং রিকোয়েস্ট (Emergency / Schedule / Quote)।
   - ক্রাউডসোর্সিং সুবিধা ("নতুন কারিগর যুক্ত করুন")।

3. **জরুরি ৯৯৯ ও নাগরিক ডিরেক্টরি (Emergency Services)**:
   - জাতীয় জরুরি সেবা (পুলিশ, অ্যাম্বুলেন্স, ফায়ার সার্ভিস - ৯৯৯)।
   - স্বাস্থ্য বাতায়ন (১৬২৬৩), নারী ও শিশু সুরক্ষা (১০৯), তথ্য বাতায়ন (৩৩৩), দুদক (১০৬)।
   - ফায়ার সার্ভিস সেন্ট্রাল কন্ট্রোল ও ঢাকা মেডিকেল জরুরি বিভাগ।

4. **মেট্রোরেল (MRT Line-6) ও বাস রুট গাইড**:
   - উত্তরা উত্তর থেকে মতিঝিল পর্যন্ত ১৬টি স্টেশনের সঠিক ভাড়া তালিকা ও সময়।
   - ঢাকার প্রধান প্রধান বাস রুট ও ভাড়া তালিকা।

5. **দৈনিক বাজার দর (Live Indicative Prices)**:
   - ঢাকার কাঁচাবাজার ও পাইকারি বাজারের চাল, ডাল, তেল, ডিম, মুরগি, সবজির হালনাগাদ দর।

6. **জাতীয় বিশ্ববিদ্যালয় সার্ভিসেস (NU Academic & Admin Hub)**:
   - শিক্ষক, কর্মকর্তা ও কর্মচারীদের যোগাযোগ তালিকা।
   - অধিভুক্ত কলেজ তালিকা ও একাডেমিক নোটিশ বোর্ড।
   - লোকেশন ও ট্যুর ডিস্ট্যান্স ক্যালকুলেটর।

7. **ডেভেলপার ও অ্যাপ পরিচিতি**:
   - [Mridul Roy](https://mridulhaze.github.io/) (Assistant Programmer, ICT Department, National University of Bangladesh).

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (v3.19+ or v3.22+)
- Dart 3+
- Android Studio / Android SDK (Platform 34 / 35)

### Run Locally
```bash
# Clone the repository
git clone https://github.com/mridulhaze/DhakaLife.git

# Navigate to project
cd DhakaLife

# Get Flutter dependencies
flutter pub get

# Run on connected device or emulator
flutter run
```

### Build Signed Release APK
```bash
flutter build apk --release
```
The output APK will be placed in `build/app/outputs/flutter-apk/app-release.apk`.

---

## 📄 License & Credits
© 2026 **Mridul Roy**. সর্বস্বত্ব সংরক্ষিত।
Website: [mridulhaze.github.io](https://mridulhaze.github.io/)
