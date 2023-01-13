import 'package:flutter/material.dart';




class BillSplitter extends StatefulWidget {
  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _bilAmount = 0.0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person", style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.purpleAccent.shade700
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("\$ ${calculateTotalPerPerson(_bilAmount, _personCounter, _tipPercentage)}",style: TextStyle(
                        fontSize: 34.9,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent.shade700
                      ),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 29),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid
                ),
                borderRadius: BorderRadius.circular(12.0) 
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money)
                    ),
                    onChanged: (String value) {
                      try{
                        _bilAmount = double.parse(value);

                      }catch(exception){
                        _bilAmount = 0.0;

                      }

                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split", style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                }else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purpleAccent.shade100,
                              ),
                              child: Center(
                                child: Text(
                                  "-",style: TextStyle(
                                  color: Colors.blue.shade100,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0
                                ),
                                ),
                              ),
                            ),
                          ),
                          Text("$_personCounter",style: TextStyle(
                            color: Colors.purpleAccent..shade100,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                          ),),

                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.purpleAccent.shade100,
                                borderRadius: BorderRadius.circular(7.0)
                              ),
                              child: Center(
                                child: Text("+", style: TextStyle(
                                  color: Colors.blue.shade100,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  ),
                  //tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tip", style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("\$ ${calculateTotalTip(_bilAmount,
                        _personCounter, _tipPercentage)}", style: TextStyle(
                          color: Colors.purpleAccent.shade100,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0
                        ),),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%", style: TextStyle(
                        color: Colors.purpleAccent.shade100,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      ),),

                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: Colors.purpleAccent.shade100,
                          inactiveColor: Colors.grey,
                          value: _tipPercentage.toDouble(), onChanged: (double newValue){
                        setState(() {
                          _tipPercentage = newValue.round();
                        });
                      })
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerPerson( double billAmount, int splitBY, int tipPercentage){
    var totalPerPerson = (calculateTotalTip(billAmount, splitBY, tipPercentage) + billAmount) / splitBY;

    return totalPerPerson;

  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
// no go!

    }else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip;
  }
}












class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email Tapped!"))
        ],
      ),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            InkWell(
              child: Text("Tap me!",
              style: TextStyle(fontSize: 23.4),),

              onTap: () => debugPrint("tapped..."),

            )

          ],
        ),
      ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrangeAccent,
      child: Center(
          child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.4,
            fontStyle: FontStyle.italic),
      )),
    );
  }
}
