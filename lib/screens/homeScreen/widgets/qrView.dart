import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QRView extends StatelessWidget {
  String name,designation,idno,email;
  QRView(String name,String designation,String idno,String email){
    this.name=name;
    this.designation=designation;
    this.email=email;
    this.idno=idno;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      alignment: Alignment.center,
      width: 200.0,
      height: 200.0,
      child: QrImage(
        data: '@ZDS \nName: $name \nDesignation: $designation\nId no.: $idno\nEmail:$email',
      ),
    );
  }
}

