import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scanne_qr_code extends StatefulWidget {
  const scanne_qr_code({Key? key}) : super(key: key);

  @override
  State<scanne_qr_code> createState() => _scanne_qr_codeState();
}

class _scanne_qr_codeState extends State<scanne_qr_code> {

  String qrresult = "scan data will appear here";
  Future<void> scanQR()async{
    try{
       final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'cancel', true, ScanMode.QR);
       if(!mounted) return;
       setState(() {
         this.qrresult = qrCode.toString();
       });
    }on PlatformException{
      qrresult = "fail to read QR code";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scane QR Code"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text("$qrresult",style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQR, child: Text("Scan Code"))
          ],
        ),
      ),
    );
  }
}


