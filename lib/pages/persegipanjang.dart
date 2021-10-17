import 'package:flutter/material.dart';
import 'package:kalkulator/theme.dart';

class PersegiPanjang extends StatefulWidget{
  @override
  _PersegiPanjangState createState() => _PersegiPanjangState();
}

class _PersegiPanjangState extends State<PersegiPanjang>{
  double _luas = 0;
  double _keliling = 0;
  final panjang = TextEditingController();
  final lebar = TextEditingController();

  void _hitungLuas(panjang,lebar){

    setState(() {
      _luas = double.parse(panjang.text)*double.parse(lebar.text);
    });
  }

  void _hitungKeliling(panjang,lebar) {
    setState(() {
      _keliling = (double.parse(panjang.text)+double.parse(lebar.text)) * 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildImage() {
      return Expanded(
        child: Center(
          child: Container(
            width: 280,
            height: 154,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/pp.png',
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget buildBottomSheet() {
      return Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
          color: kWhiteColor,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Kalkulator Luas dan Keliling\nPersegi Panjang", style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,), textAlign: TextAlign.center ),

                  new SizedBox(
                    width: double.infinity,
                    child: new TextFormField(
                      decoration: new InputDecoration(hintText: 'Panjang'),
                      keyboardType: TextInputType.number,
                      controller: panjang,
                    ),
                  ),

                  new SizedBox(
                    width: double.infinity,
                    child: new TextFormField(
                      decoration: new InputDecoration(hintText: 'Lebar'),
                      keyboardType: TextInputType.number,
                      controller: lebar,
                    ),
                  ),

                  new ElevatedButton(
                    onPressed: (){
                      _hitungLuas(panjang,lebar);
                      _hitungKeliling(panjang,lebar);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kYellowColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(11),
                          topRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(11),
                        ),
                      ),
                    ),
                    child: new Text("Hitung Luas dan Keliling Persegi Panjang"),
                  ),
                  new Text(
                    'Luas = $_luas',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  new Text(
                    'Keliling = $_keliling',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          buildImage(),
          buildBottomSheet(),
        ],
      ),
    );
  }
}
