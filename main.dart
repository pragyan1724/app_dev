import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: tip_calc(),
)
);
class tip_calc extends StatefulWidget {
  @override
  _tip_calcState createState() => _tip_calcState();
}
class _tip_calcState extends State<tip_calc> {
  @override
  double bill_amt;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tip calc"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 30, right: 30),
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 50.0,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "bill amount",
                    style: TextStyle(fontSize: 30),
                  ),
                  TextField(
                    keyboardType:
                    (TextInputType.numberWithOptions(decimal: true)),
                    onChanged: (String ba) {
                      try {
                        bill_amt = double.parse(ba);
                      } catch (exception) {
                        bill_amt = 0.0;
                      }
                    },
                    style: TextStyle(fontSize: 30),
                    decoration: InputDecoration(
                      hintText: "bill amount:",
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => page_2(bill_amt)),
                      );
                    },
                    child: Text("next"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class page_2 extends StatefulWidget {
  double bill_amt;
  page_2(this.bill_amt);
  @override
  _page_2State createState() => _page_2State();
}
class _page_2State extends State<page_2> {
  @override
  double Tip_amount = 0.0;
  double total_amount = 0.0;
  double tip = 0.0;
  double total_amt = 0.0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("tip calc"),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 50, left: 30, right: 30),
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 50.0,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "tip%:",
                      style: TextStyle(fontSize: 30),
                    ),
                    TextField(
                      keyboardType:
                      (TextInputType.numberWithOptions(decimal: true)),
                      onChanged: (String ti) {
                        try {
                          tip = double.parse(ti);
                        } catch (exception) {
                          tip = 0.0;
                        }
                      },
                      style: TextStyle(fontSize: 30),
                      decoration: InputDecoration(
                        hintText: "Tip%",
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                  child: Text("calculate"),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text("total amount="+calc(tip, widget.bill_amt)),
                      ),
                    );
                  }),
            ],
          )),
    );
  }
   String calc(double tips, double bill_amt) {
    double amount;
    String amt_dis;
    amount = bill_amt * (1 + tips / 100);
    amt_dis = amount.toString();
    return amt_dis;
  }
}
