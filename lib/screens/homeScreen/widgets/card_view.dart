import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
class CardView extends StatelessWidget {
  bool isAboutUs;
  CardView(bool isAboutUs) {
    this.isAboutUs = isAboutUs;
  }
  String link ="https://www.zerodollarsecurity.in";
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
      child: !isAboutUs
          ? null
          : Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Zero Dollar Security is a ‘Make in INDIA’ initiative and first of our kind organisation committed to augment the skills of \'Cyber Security\'. With the onsetting era of enhanced Internet Connectivity and a massive spike in internet users any cyber architecture can be compromised. We at Zero Dollar Security ensure to eradicate cyber threat from the Digital Infrastructure with the initiative of ZeroDollarSecurity Community, where we educate the young brains across India and create assets for tomorrow. We yearn to ‘Educate’ and ‘Procreate’ together as a community. We secure a company for what it is ‘Worth’, and protect what is ‘Yours’.',
                    style: kTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'To view more, Visit our website',
                          style: kTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                        ),
                    Linkify(
                      onOpen: (link) async {
                        if (await canLaunch(link.url)) {
                          await launch(link.url);
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      text: "https://www.zerodollarsecurity.in/",
                      style: kTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.blue,
                      ),
                      linkStyle: TextStyle(color: Colors.blue),
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
