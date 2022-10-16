import 'package:flutter/material.dart';
import 'package:motor_flutter/motor_flutter.dart';
import 'createAccount.dart';
import 'appIntegration.dart';
import 'admin.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key, required this.summary, required this.friend});
  final List<dynamic> summary;
  final String friend;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friend),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            // if friend == "Nico", render the Text "Hello!"

            Padding(
              padding: EdgeInsets.all(15),
              child: const Text("Paragraph Summary",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),

            if (widget.friend == "Noah Kong")
              Text(
                  "Jeff Lai bought a monitor for \$311. Noah Kong bought one for \$500. Jeff Lai is going to Chionh now. Kong has been doing work the whole weekend. Jeff has returned to hostel. Kong's mouse is broken. Jeff will try to disect it.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Zenton Yam")
              Text(
                  "Jeff Lai and Zenton Yam are working on the code for the single Gaussian model. Jeff Lai wrote a live script to run the code, but it took him 10 minutes to finish it. Zenton Yannet's code is correct, but the original one is not.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Ernest")
              Text(
                  "Ernest can't sign up using singpass. Jeff Lai scanned his IC to make account. He wants to stake 5k worth of CRO. He will wait for the price to drop to \$0.5 and then slowly buy it.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Zhi Xiang")
              Text(
                  "Jeff Lai and Zhi xiang want to buy white shirt and two colour word for \$6.50 each. Zhi Xiang's uncle will give them official quotation. Zhih xiang will craft the email and send it to her uncle's company. Sarah replied to the email.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Joseph Low")
              Text(
                  "Joseph low is running for president of the AISG. Jeff Lai is interested in joining the club. Joseph low forwarded him an email with a link to the club's contact details. He is sending Jeff a PDF of his resume. Jeff can't view the full PDF on his iPad.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Ke Hong")
              Text(
                  "Jeff Lai sent photos of himself, Renee and the partner to Kehongkhoip. Jeff Lai is happy with the results, although there was a mistake at the end of the video. Jeff and Kehongo are going to train for 2 months.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Clarence Lee")
              Text(
                  "Jeff Lai has an array of 256 bits. He has 8+8+8 storage for the array, and ~10 storage for m. The storage size of m is 768 bits. The number of bits required to represent m is log m bits. O(nm) is an exponential time complexity rather than polynomial.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Christopher")
              Text(
                  "Christopher Lye and Jeff Lai will submit the PAF and the purchase award form to the student president tomorrow morning. Christopher Lye will also submit the voucher for the NTUC and the T-shirt to the president. He will send the form to Woon Yang",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Phei Rong")
              Text(
                  "Jeff Lai is interning at UxUi design. Phei Rong is working from home. Jeff Lai's company HQ is at the little Padington preschool and Creative Galileo preschool, which is located in the industrial area of Tai Seng. Trehaus school wants to collaborate with Trehaus.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),

            if (widget.friend == "Nico")
              Text(
                  "Jeff Lai is trying to solve the problem of finding the tangent line equal to zero. Nico explains to him how to do it. Jeff Lai explains to Nico how he got the gradient of the equation right. Nico is not satisfied with the solution.",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            // iterate through summary and display in Text

            SizedBox(
              height: 20,
            ),
            for (var i = 1; i < widget.summary.length; i++)
              Text(widget.summary[i]),
          ],
        ),
      ),
    );
  }
}


    // "Noah Kong",
    // "Zenton Yam",
    // "Ernest",
    // "Zhi Xiang",
    // "Joseph Low",
    // "Ke Hong",
    // "Clarence Lee",
    // "Christopher",
    // "Phei Rong",
    // "Nico"