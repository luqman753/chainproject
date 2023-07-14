import 'package:flutter/material.dart';
import 'package:flutter_final_build/api/pdf_api.dart';
import 'package:flutter_final_build/model/customer.dart';
import 'package:flutter_final_build/pdfviewer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import '../../page/pdf_page.dart';
import '../../api/pdf_invoice_api.dart';
import '../../model/invoice.dart';
import '../../model/supplier.dart';
import '../../page/pdf_page.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';


class BalanceHisoty extends StatefulWidget {
  const BalanceHisoty({Key? key}) : super(key: key);

  @override
  _BalanceHisotyState createState() => _BalanceHisotyState();
}

class _BalanceHisotyState extends State<BalanceHisoty> {
   String _selectedDate = '';
     String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
bool ?value;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    value=false;
  }
void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
appBar: AppBar(
          title: const Text('Payment History',style: TextStyle(color:kTextColor),
          ),
          centerTitle: true,
    leading: IconButton(
        icon: SvgPicture.asset("assets/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
        icon: const Icon(Icons.picture_as_pdf_sharp, color: kTextColor,),
        onPressed: (){
Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) =>PdfViewer()),  
  );
},
        // onPressed: () async {
        //   // Navigator.push(context, MaterialPageRoute(builder: (context)=> PdfPage()
        //   // ));
        //   final date = DateTime.now();
        //             final dueDate = date.add(Duration(days: 7));

        //             final invoice = Invoice(
        //               supplier: Supplier(
        //                 name: 'Sarah Field',
        //                 address: 'Sarah Street 9, Beijing, China',
        //                 paymentInfo: 'https://paypal.me/sarahfieldzz',
        //               ),
        //               customer: Customer(
        //                 name: 'Apple Inc.',
        //                 address: 'Apple Street, Cupertino, CA 95014',
        //               ),
        //               info: InvoiceInfo(
        //                 date: date,
        //                 dueDate: dueDate,
        //                 description: 'My description...',
        //                 number: '${DateTime.now().year}-9999',
        //               ),
        //               items: [
        //                 InvoiceItem(
        //                   description: 'Coffee',
        //                   date: DateTime.now(),
        //                   quantity: 3,
        //                   vat: 0.19,
        //                   unitPrice: 5.99,
        //                 ),
        //                 InvoiceItem(
        //                   description: 'Water',
        //                   date: DateTime.now(),
        //                   quantity: 8,
        //                   vat: 0.19,
        //                   unitPrice: 0.99,
        //                 ),
        //                 InvoiceItem(
        //                   description: 'Orange',
        //                   date: DateTime.now(),
        //                   quantity: 3,
        //                   vat: 0.19,
        //                   unitPrice: 2.99,
        //                 ),
        //                 InvoiceItem(
        //                   description: 'Apple',
        //                   date: DateTime.now(),
        //                   quantity: 8,
        //                   vat: 0.19,
        //                   unitPrice: 3.99,
        //                 ),
        //                 InvoiceItem(
        //                   description: 'Mango',
        //                   date: DateTime.now(),
        //                   quantity: 1,
        //                   vat: 0.19,
        //                   unitPrice: 1.59,
        //                 ),
        //                 InvoiceItem(
        //                   description: 'Blue Berries',
        //                   date: DateTime.now(),
        //                   quantity: 5,
        //                   vat: 0.19,
        //                   unitPrice: 0.99,
        //                 ),
        //                 InvoiceItem(
        //                   description: 'Lemon',
        //                   date: DateTime.now(),
        //                   quantity: 4,
        //                   vat: 0.19,
        //                   unitPrice: 1.29,
        //                 ),
        //               ],
        //             );

        //             final pdfFile = await PdfInvoiceApi.generate(invoice);

        //             PdfApi.openFile(pdfFile);
        // },
      ),
      ],
),
    body: Column(
      children: [
    SfDateRangePicker(
          backgroundColor: kSecondaryColor,
          // todayHighlightColor: Colors.white,
          showTodayButton: true,
          showActionButtons: true,
                    onSelectionChanged: _onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(
                        DateTime.now().subtract(const Duration(days: 4)),
                        DateTime.now().add(const Duration(days: 3))),
                  ),
              
        Padding(
          padding:  EdgeInsets.only(top: defaultSize!*4),
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical:defaultSize*1),
                child: InkWell(
                  onTap: (){},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             const  Text("ABC",
                                // widget.cart.productName.toString(),
                                style:  TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const Text(
                                "Quantity: ",
                                maxLines: 2,
                                style:  TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const  [
                                   Text(
                                    "Rs ",
                                    style:  TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    )
 
    );
  }
}