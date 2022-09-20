import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:telephony/telephony.dart';

class SMSOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Telephony telephony = Telephony.instance;
  OtpFieldController otpbox = OtpFieldController();
  List<String> listDeneme = [];

  @override
  void initState() {
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        String sms = message.body.toString();
        var deneme = sms.split(" ");
        print(deneme[6]);
      },
      listenInBackground: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Autofill OTP From SMS"),
            backgroundColor: Colors.redAccent),
        body: Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Enter OTP Code",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(padding: EdgeInsets.all(20)),
                listDeneme.length != 0 ? Text(listDeneme[6]) : Text(''),
                OTPTextField(
                  controller: otpbox,
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 50,
                  style: TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    print("Entered OTP Code: $pin");
                  },
                ),
              ],
            )));
  }
}
