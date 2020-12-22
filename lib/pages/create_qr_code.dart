import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQRCode extends StatefulWidget {
  CreateQRCode({Key key}) : super(key: key);

  @override
  _CreateQRCodeState createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCode> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create QR Code'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                color: Colors.white,
                data: controller.text ?? 'Hello',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(child: buildTextField(context)),
                  const SizedBox(width: 12),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(Icons.done, size: 30),
                    onPressed: () => setState(() {}),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
}
