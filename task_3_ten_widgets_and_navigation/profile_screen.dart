import 'package:bwt_flutter/widgets/support_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  var nameRecieved;
  var trackRecieved;
  var roleRecieved;
  var phoneRecieved;
  var addressRecieved;
  var educationRecieved;
  var universityRecieved;

  ProfileScreen(
      this.nameRecieved,
      this.trackRecieved,
      this.roleRecieved,
      this.phoneRecieved,
      this.addressRecieved,
      this.educationRecieved,
      this.universityRecieved,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.limeAccent,
              Colors.greenAccent
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              SizedBox(height: 20.0,),
              Text("Welcome, $nameRecieved",style: AppWidget.mainText()),
              SizedBox(height: 20.0,),
              Text("Bytewise Track: $trackRecieved",style: AppWidget.lightTextFieldStyle()),
              SizedBox(height: 15.0,),
              Text("Role: $roleRecieved",style: AppWidget.lightTextFieldStyle()),
              SizedBox(height: 15.0,),
              Text("Ph No: $phoneRecieved",style: AppWidget.lightTextFieldStyle()),
              SizedBox(height: 15.0,),
              Text("Address: $addressRecieved",style: AppWidget.lightTextFieldStyle()),
              SizedBox(height: 15.0,),
              Text("Education: $educationRecieved",style: AppWidget.lightTextFieldStyle()),
              SizedBox(height: 15.0,),
              Text("University: $universityRecieved",style: AppWidget.lightTextFieldStyle()),
              SizedBox(height: 15.0,),

            ],
          ),
        ),
      ),
    );
  }
}
