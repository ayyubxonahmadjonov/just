
import '../../core/imports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: maxWidth,
            height: maxHeight * 0.37,
            decoration: BoxDecoration(
              color:AppColors.primaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(40)
              ),
            ),
            padding: EdgeInsets.only(left: 24, right: 24, top: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Salom, SAYDULLO",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Image.asset('assets/images/app_logo.png'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Jami sarmoya",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "\$50,000",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: maxWidth*0.18),
                  child: Divider(color: AppColors.white1),
                ),
                Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,    children: [
                  Column(children: [
                    Text("25,000",style: TextStyle(color: AppColors.white1,fontWeight: FontWeight.w800,fontSize: 20),),
                    Text("PHP invest",style: TextStyle(color: AppColors.white1,fontWeight: FontWeight.w500,fontSize: 13),),
                  ],),
                  Column(children: [
                    Text("25,000",style: TextStyle(color: AppColors.white1,fontWeight: FontWeight.w800,fontSize: 20),),
                    Text("Prime capital",style: TextStyle(color: AppColors.white1,fontWeight: FontWeight.w500,fontSize: 13),),
                  ],),
                ],)
              ],
            ),
          ),
           SizedBox(height: 30),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              BuildIconButton(icon: "invest.png",label: "Invest",),
              BuildIconButton(icon: "history.png",label: "Tarix",),
                  BuildIconButton(icon: "contact.png",label: "Aloqa",),

            ],),
            Container(
              width: maxWidth*0.85,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,spreadRadius: 4,
                    blurRadius: 4

                  ),
                ]
              ),
              child:Column(
         crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Row(
                      children: [

                        Image.asset('assets/images/rectangular1.png'),
                        SizedBox(width: 10),
                        Text("PHP invest")
                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset('assets/images/rectangular2.png'),
                        SizedBox(width: 10),
                        Text("Prime Capital"),
                      ]
                      ),
                  ),
                  Center(child: Image.asset("assets/images/Statistic.png",width: maxWidth*0.85,))
           ,   SizedBox(height: 10,),
                ],
              )
            ),
          ],)
        ],
      ),
    );
  }

  Widget _buildInvestCard(String title, String amount) {
    return Container(
      width: 160,
      height: 90,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(amount,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 4),
          Text(title, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}
