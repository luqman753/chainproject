
import 'package:flutter/material.dart';
import 'package:flutter_final_build/components/title_text.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/balanceController.dart';
import '../screens/Balance/balance_history.dart';
import '../screens/Balance/card.dart';
import '../screens/utils/size_config.dart';
import '../sharedPrefrence/SharedPref.dart';

class BalanceCard extends StatefulWidget {
  const   BalanceCard({ Key? key }) : super(key: key);

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
   Future ?futureChart;
  List<SalesData> chartData = [];

  @override
    void initState() {
      super.initState();
      _tooltipBehavior = TooltipBehavior(enable: true);
        futureChart=getProgressData();
        chartData = [
        SalesData("Jan", 30),
        SalesData("Feb", 20),
        SalesData("Mar", 80),
        SalesData("April", 90),
        SalesData("May", 100),
        SalesData("Jun", 130),
        SalesData("July", 20),
        SalesData("Aug", 10),
        SalesData("Sept", 39),
        SalesData("Oct", 87),
        SalesData("Nov", 22),
        SalesData("Dec", 17),
      ];
    }    

   getProgressData() async {
    // quickQuote = 0;
    // curl();
    String? token = await getToken();
    // var url = Uri.parse(
    //     "https://devapi.aquaticxpressshipping.com/api/shipmentorder/getmonthlyreport/" +
    //         formatted);
    // var response = await http.get(
    //   url,
    //   headers: {
    //     "Authorization": "Bearer $token",
    //   },
    // );


    // if (response.statusCode == 200) {
    //   results = json.decode(response.body);

    //   print("Progress Report " + results.toString());
    //   chartData = [
    //     SalesData("Jan", results!["jan"]),
    //     SalesData("Feb", results!["feb"]),
    //     SalesData("Mar", results!["mar"]),
    //     SalesData("April", results!["apr"]),
    //     SalesData("May", results!["may"]),
    //     SalesData("Jun", results!["jun"]),
    //     SalesData("July", results!["jul"]),
    //     SalesData("Aug", results!["aug"]),
    //     SalesData("Sept", results!["sep"]),
    //     SalesData("Oct", results!["oct"]),
    //     SalesData("Nov", results!["nov"]),
    //     SalesData("Dec", results!["dec"]),
    //   ];
    // }
    // if (ptpResponse.statusCode == 200) {
    //   profitResults = json.decode(ptpResponse.body);

    //   profitData = [
    //     TotalProfit("Jan", profitResults[2]["Value"][0].toDouble()),
    //     TotalProfit("Feb", profitResults[2]["Value"][1].toDouble()),
    //     TotalProfit("Mar", profitResults[2]["Value"][2].toDouble()),
    //     TotalProfit("Apr", profitResults[2]["Value"][3].toDouble()),
    //     TotalProfit("May", profitResults[2]["Value"][4].toDouble()),
    //     TotalProfit("Jun", profitResults[2]["Value"][5].toDouble()),
    //     TotalProfit("July", profitResults[2]["Value"][6].toDouble()),
    //     TotalProfit("Aug", profitResults[2]["Value"][7].toDouble()),
    //     TotalProfit("Sept", profitResults[2]["Value"][8].toDouble()),
    //     TotalProfit("Oct", profitResults[2]["Value"][9].toDouble()),
    //     TotalProfit("Nov", profitResults[2]["Value"][10].toDouble()),
    //     TotalProfit("Dec", profitResults[2]["Value"][11].toDouble()),
    //   ];


  }
   TooltipBehavior ?_tooltipBehavior;

 
    final BalanceController balanceController = Get.put(BalanceController());
  @override
  Widget build(BuildContext context) {
   double? defaultSize = SizeConfig.defaultSize;
    return  Container(
      color: Colors.white,
      child: Padding(
      padding: const EdgeInsets.only(left: 7,top:7, right:7),
      child: Column(
        children: [

          
          InkWell(onTap: (){Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) =>const BalanceHisoty()),  
  );  },
            
            child: card(context,
              width: MediaQuery.of(context).size.width - 25,
              height: 190,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Material(
                          color: Colors.black87,
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 56,
                                height: 56,
                                child: Icon(
                                  Icons.account_balance_wallet,
                                  color: Colors.white,
                                  size: 25.0,
                                )),
                            onTap: () {},
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text('Total Wallet Balance',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: [Text('PKR'), ],
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black87),
                      ),
                     Obx(() {
                        if (balanceController.isLoading.value)
                        return Center(child: Image.asset('assets/spinner.gif', height: defaultSize!*5, ));
                          else   
                        return Text(" "+balanceController.balanceList.value.data!.balance!.toStringAsFixed(0), style: TextStyle(fontSize: 45),);
                         }),
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      //   decoration: BoxDecoration(
                      //       // color: precent >= 0 ? Colors.green : Colors.pink,
                      //       borderRadius: BorderRadius.all(Radius.circular(30))),
                      //   child: Image.asset("assets/money.gif", height: defaultSize!*5,),
                      //     // precent >= 0 ? '+ $precent %' : '$precent %',
                          
                      //   ),
                      
                    ],
                  ),
                  SizedBox(height: 10),
                  
                ],
              ),
            ),
          ),
       const SizedBox( height: 20,),
       const TitleText(title: "Yearly Wallet Chart",),
              const SizedBox( height: 20,),
        Padding(
          padding:  const EdgeInsets.only(left:7),
          child: Column(
                                  children: [
                                    // FutureBuilder(
                                      // future: futureChart,
                                      // builder: (BuildContext context, snapshot) {
                                        // if (snapshot.connectionState ==
                                            // ConnectionState.done) {
                                          // return 
                                          Container(

                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,

                                                decoration: BoxDecoration(
                          color: kSecondaryColor,
                          borderRadius: BorderRadius.circular(15.0)),
                                            child: SfCartesianChart(
plotAreaBorderColor:kSecondaryColor,    
plotAreaBackgroundColor: kSecondaryColor,  
                                          // title: ChartTitle(text: 'Yearly Wallet Chart'),
                                                legend: Legend(isVisible: true, backgroundColor:kSecondaryColor),
                                                tooltipBehavior: _tooltipBehavior,
                                                series: <LineSeries>[
                                                  LineSeries<SalesData, String>(
                                                    name: 'Prog Report',

                                                    dataSource: chartData,
                                                    xValueMapper:
                                                        (SalesData year, _) =>
                                                            year.year,
                                                    yValueMapper:
                                                        (SalesData sales,  _) =>
                                                            sales.sales,
                                                    dataLabelSettings:
                                                       const DataLabelSettings(
                                                            isVisible: true),
                                                    enableTooltip: false,
                                                    color: kPrimaryColor,
                                                    width: 2,
                                                    opacity: 1,
                                                    // dashArray: <double>[5,5],
                                                    // splineType: SplineType.cardinal,
                                                    // cardinalSplineTension: 0.9))
                                                  )
                                                ],
                                                primaryXAxis: CategoryAxis()
                                                //   edgeLabelPlacement: EdgeLabelPlacement.shift,
                                                // ),
                                                ),
                                          // );
                                        // }

                                        // return LinearProgressIndicator();
                                      // },
                                    )
                                  ],
                                ),
        ),
                            
                          
          
          
          
        ],
      ),
      ),
    );
  }

}
class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}

class TotalProfit {
  TotalProfit(this.year, this.profit);
  final String year;
  final double profit;
}

//  Column(
//                                 children: [
//                                   // FutureBuilder(
//                                     // future: futureChart,
//                                     // builder: (BuildContext context, snapshot) {
//                                       // if (snapshot.connectionState ==
//                                           // ConnectionState.done) {
//                                         // return 
//                                         Container(
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               .23,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               1,
//                                           child: SfCartesianChart(
                                          
//                                               //title: ChartTitle(text: 'Yearly sales analysis'),
//                                               legend: Legend(isVisible: true),
//                                               tooltipBehavior: _tooltipBehavior,
//                                               series: <LineSeries>[
//                                                 LineSeries<SalesData, String>(
//                                                   name: 'Prog Report',

//                                                   dataSource: chartData,
//                                                   xValueMapper:
//                                                       (SalesData year, _) =>
//                                                           year.year,
//                                                   yValueMapper:
//                                                       (SalesData sales,  _) =>
//                                                           sales.sales,
//                                                   dataLabelSettings:
//                                                       DataLabelSettings(
//                                                           isVisible: true),
//                                                   enableTooltip: true,
//                                                   color: kPrimaryColor,
//                                                   width: 2,
//                                                   opacity: 1,
//                                                   // dashArray: <double>[5,5],
//                                                   // splineType: SplineType.cardinal,
//                                                   // cardinalSplineTension: 0.9))
//                                                 )
//                                               ],
//                                               primaryXAxis: CategoryAxis()
//                                               //   edgeLabelPlacement: EdgeLabelPlacement.shift,
//                                               // ),
//                                               ),
//                                         // );
//                                       // }

//                                       // return LinearProgressIndicator();
//                                     // },
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
          
//           ),