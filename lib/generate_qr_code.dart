import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class generateQrCode extends StatefulWidget {
  const generateQrCode({Key? key}) : super(key: key);

  @override
  State<generateQrCode> createState() => _generateQrCodeState();
}

class _generateQrCodeState extends State<generateQrCode> {

  TextEditingController urlcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               if(urlcontroller.text.isNotEmpty)
                 QrImage(data: urlcontroller.text,size: 200,),
              SizedBox(height: 18,),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: urlcontroller,
                  decoration: InputDecoration(
                    hintText: "Enter Your Data",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                    labelText: "Enter Your Data Here",
                  ),
                ),
              ),
              SizedBox(height: 18,),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Generate QR Code"))
            ],
          ),
        ),
      ),
    );
  }
}
