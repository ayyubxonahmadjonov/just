import '../../core/constants/app_imports.dart';

class OfferDialog extends StatefulWidget {
  final VoidCallback onAccepted;
  const OfferDialog({super.key, required this.onAccepted});

  @override
  State<OfferDialog> createState() => _OfferDialogState();
}

class _OfferDialogState extends State<OfferDialog> {
  bool localAccept = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Ommaviy oferta shartlari"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "OMMAVIY OFFERTA\n"
              "Ko‘p yo‘nalishli investitsiya portfeli asosida",
            ),
            SizedBox(height: 10),
            Text(
              "1. Fond Tafsilotlari\n\n"
              "Ushbu hujjat ommaviy oferta (keyingi o‘rinlarda – “Oferta”) hisoblanadi va kompaniya daromadiga sheriklik bo‘yicha investitsiya platformasi xizmatlarini taqdim etish shartlarini, shuningdek, shaxsiy ma’lumotlarni himoya qilish to‘g‘risidagi qonunchilik talablariga rioya etish shartlarini belgilaydi.\n"
              "• Fond nomi: Prime capital\n"
              "• Turi: Diversifikatsiyalashgan ko’chmas mulk, va servis bizneslar\n"
              "• Yurisdiksiya: Business bay, Dubay\n"
              "• Regulyator: Dubai Economic Department\n"
              "• Boshqaruvchi: Prime Haven Properties LLC,\n",
            ),
            Divider(thickness: 1),
            Text(
              "2.  Atamalar va ta’riflar\n\n"
              "2.1. Prime capital investitsion platformasi (keyingi o‘rinlarda — “Platforma”) — foydalanuvchilarga (keyingi o‘rinlarda — “Investorlar”) kompaniya daromadlariga sheriklik qilish imkoniyatini beruvchi onlayn xizmat. \n"
              "2.2. Foydalanuvchi — Platformada ro‘yxatdan o‘tgan jismoniy yoki yuridik shaxs.  \n"
              "2.3. Shaxsiy ma’lumotlar — ma’lum yoki aniqlanadigan jismoniy shaxsga (shaxsiy ma’lumot sub’yektiga) tegishli har qanday ma’lumot.\n"
              "Mazkur REIT fondi yuqori darajadagi passiv daromad, kapital o‘sish va xavfni tarqatishga qaratilgan diversifikatsiyalashgan investitsiya portfelini taqdim etadi. Investorlar quyidagi sohalardagi loyihalardan ulush sotib olish orqali ishtirok etadilar.\n",
            ),
            Divider(thickness: 1),

            Text(
              "3. Oferani qabul qilish tartibi\n\n"
              "3.1. Ushbu Oferani qabul qilish – bu Foydalanuvchining Platformada ro‘yxatdan o‘tishi va Ofertaning shartlariga rozilik bildirishidir.  \n"
              "3.2. Platformada ro‘yxatdan o‘tish avtomatik tarzda Oferaning barcha shartlarini qabul qilish deb hisoblanadi.\n",
            ),
            Divider(thickness: 1),

            Text(
              "4. Shaxsiy ma’lumotlar va ularni himoya qilish \n\n"
              "4.1. Platforma shaxsiy ma’lumotlar himoyasi to‘g‘risidagi qonunchilikka, shu jumladan Birlashgan Arab Amirligining Federal Decree Law No. 45 of 2021 on the Protection of Personal Data (PDPL) (Shaxsiy ma’lumotlarni himoya qilish to‘g‘risidagi 2021-yildagi 45-sonli Farmon-qonun) ga rioya qilishga majbur.  \n"
              "4.2. Foydalanuvchi Platformaga o‘z shaxsiy ma’lumotlarini xizmat ko‘rsatish maqsadida qayta ishlashga rozilik beradi.  \n"
              "4.3. Platforma Foydalanuvchining shaxsiy ma’lumotlarini himoya qilish uchun zarur tashkiliy va texnik choralarni ko‘rishga majburdir.  \n",
            ),
            Text(
              "5. Investitsiya Yo‘nalishlari \n\n"
              "Prime capital quyidagi barqaror va daromadli biznes segmentlariga sarmoya kiritadi:\n"
              "Yo‘nalish"
              "Tavsif"
              "Ko‘chmas mulk ijarasi "
              "Dubay va boshqa shaharlaridagi premium turar va tijorat ob’ektlarini ijaraga berish\n"
              "Rent a Car biznesi "
              "Supercar, SUV va biznes klassdagi avtomobillarni ijaraga berish\n"
              "Qurilish loyihalari "
              "Yer sotib olish, yangi binolar qurish, sotish yoki ijaraga topshirish\n"
              "Ta’mirlash xizmati "
              "Kvartira va ofislar uchun ta’mirlash, dizayn va obodonlashtirish xizmatlari\n"
              "Turizm va hospitality "
              "Sayyohlar uchun premium turar joy, xizmatlar va paketlarni taklif etish\n"
              "AQSH fond bozori "
              "Apple,Tesla, S&P 500 kabi barqaror aksiyalarga sarmoya kiritish orqali kapital o‘sish\n",
            ),
            Divider(thickness: 1),

            Text(
              "6.  Investitsiya Shartlari \n\n"
              "Band Tafsilot\n\n"
              "Minimal sarmoya  USD 500\n"
              "Maqsadli yillik daromad  10% – 60% (loyihaga qarab)\n"
              "Dividend to‘lovi  Har chorakda (aprel, iyul, oktabr, yanvar)\n"
              "Likvidlik  Yillik chiqish oynasi (12 oyda 1 marta)\n"
              "Valyuta   USD (asosiy), AED (qo‘shimcha)\n",
            ),
            Divider(thickness: 1),

            Text(
              "7. To‘lov Tafsilotlari\n\n"
              "• To‘lov usuli: SWIFT bank o‘tkazmasi\n"
              "• Bank: Mashreq\n"
              "• Hisob raqami: 019101\n"
              "• To‘lov izohi: “PRIME REIT – Investor Ismi\n",
            ),
            Divider(thickness: 1),

            Text(
              "8.  Investor Talablari\n\n"
              "• 18 yoshdan katta jismoniy yoki yuridik shaxs\n"
              "• Investitsiya xavflarini tushunadigan va rozilik bildirgan shaxs\n"
              "• PEP emasligi va qonuniy daromad manbai mavjudligi.  PEP (Politically Exposed Person) – bu siyosiy ta’sirga ega shaxs degani. Masalan: vazirlar, deputatlar, sudyalar, davlat korxonalari rahbarlari yoki ularning yaqin qarindoshlari.\n"
              "Agar siz PEP bo‘lsangiz, fond sizga nisbatan alohida tekshiruv o‘tkazishi mumkin. Agar siz PEP bo’lmasangiz bu talablar  taalluqli emas.\n",
            ),
            Divider(thickness: 1),

            Text(
              "9. Tomonlarning huquq va majburiyatlari\n\n"
              "7.1. Platforma ushbu Oferada belgilangan shartlarga muvofiq xizmat ko‘rsatishga majburdir. \n"
              "7.2. Foydalanuvchi ishonchli ma’lumotlarni taqdim etishi va ularning dolzarbligiga javobgar bo‘ladi.\n",
            ),
            Divider(thickness: 1),

            Text(
              "10. Tomonlarning javobgarligi\n\n"
              "10.1. Platforma uchinchi shaxslarning harakatlari natijasida Foydalanuvchida yuzaga kelgan zararlar uchun javobgar emas.  \n"
              "10.2. Foydalanuvchi ushbu Oferaning shartlariga  rioya qilmaganlik uchun javobgar hisoblanadi.\n",
            ),
            Text(
              "  11. Risklar Haqida Ogohlantirish \n\n"
              "PRIME CAPITAL kapital yo‘qotish xavfini istisno etmaydi. Ko‘chmas mulk bozori, avtomobil ijarasi, aksiyalar narxi va turizm sektori o‘zgaruvchan bo‘lishi mumkin. Hech qanday daromad kafolatlanmaydi. Investorlar mustaqil moliyaviy maslahat olishi tavsiya etiladi. \n",
            ),
            Divider(thickness: 1),

            Text(
              "12.  Dividend Siyosati\n"
              "• Har chorakda fond daromadidan investor ulushi proporsional tarzda to‘lanadi\n"
              "• To‘lovlar USD, UZS yoki AEDda amalga oshiriladi\n"
              "• Dividendlar fondning operatsion foydasiga qarab farqlanadi\n",
            ),
            Divider(thickness: 1),

            Text(
              " 13. Yakuniy qoidalar  \n\n"
              "8.1. Platforma ushbu Oferaga o‘zgartirishlar kiritish huquqiga ega. O‘zgartirishlar Platformada e’lon qilingan paytdan boshlab kuchga kiradi. \n"
              " 8.2. Foydalanuvchi Ofertadagi o‘zgarishlarni mustaqil tarzda kuzatib borishga majburdir\n",
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(AppColors.primaryColor),

                  value: localAccept,
                  onChanged: (value) {
                    setState(() {
                      localAccept = value!;
                    });
                  },
                ),
                Expanded(child: Text("Men ommaviy oferta shartlariga roziman")),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed:
              localAccept
                  ? () {
                    widget.onAccepted();
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(55.r),
            ),
            backgroundColor: AppColors.primaryColor,
          ),

          child: Text("Tasdiqlash", style: TextStyle(color: AppColors.white2)),
        ),
      ],
    );
  }
}
