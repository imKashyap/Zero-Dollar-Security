import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
class CardView extends StatelessWidget {
   bool isAboutUs;
  CardView(bool isAboutUs){
    this.isAboutUs=isAboutUs;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
      child:!isAboutUs ?null:Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
            Text('Zero Dollar Security is a ‘Make in INDIA’ initiative and first of our kind organisation committed to augment the skills of \'Cyber Security\'. With the onsetting era of enhanced Internet Connectivity and a massive spike in internet users any cyber architecture can be compromised. We at Zero Dollar Security ensure to eradicate cyber threat from the Digital Infrastructure with the initiative of ZeroDollarSecurity Community, where we educate the young brains across India and create assets for tomorrow. We yearn to ‘Educate’ and ‘Procreate’ together as a community. We secure a company for what it is ‘Worth’, and protect what is ‘Yours’.',
              style: kTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.black,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
