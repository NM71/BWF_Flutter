import 'package:bwt_flutter/profile_screen.dart';
import 'package:bwt_flutter/widgets/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TenWidgetsAndNavigation extends StatefulWidget {
  const TenWidgetsAndNavigation({super.key});

  @override
  State<TenWidgetsAndNavigation> createState() =>
      _TenWidgetsAndNavigationState();
}

class _TenWidgetsAndNavigationState extends State<TenWidgetsAndNavigation> {

  String genderValue = 'Gender';
  var nameController = TextEditingController();
  var trackController = TextEditingController();
  var roleController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var educationController = TextEditingController();
  var universityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        // Widget 1 - Preferred Size
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Colors.greenAccent, Colors.limeAccent],
              ),
            ),
            child: Center(
                child: Text(
              'BWF - Flutter Task 3',
              style: TextStyle(
                fontFamily: 'RobotoMono',
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        body: Center(

          // Widget 2 - Scroll View
        child: SingleChildScrollView(

          // Widget 3 - Container
        child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.limeAccent, Colors.greenAccent
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Data Form',

                        // Widget 6 - Support Widget
                        style: AppWidget.mainText(),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    // Widget 4 - Circle Avatar
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    // Widget 5 - TextFields
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                        prefixIcon: Icon(Icons.person),
                        // errorText: 'Name is required',
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextField(
                      controller: trackController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Track',
                        hintText: 'Enter Bytewise Track',
                        prefixIcon: Icon(Icons.book),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextField(
                      controller: roleController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Role',
                        hintText: 'Enter Your Position',
                        prefixIcon: Icon(Icons.verified_user),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Phone',
                        hintText: 'Enter Your Phone No.',
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Address',
                        hintText: 'Enter Your Address',
                        prefixIcon: Icon(Icons.location_city),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextField(
                      controller: educationController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Education',
                        hintText: 'Enter Education',
                        prefixIcon: Icon(Icons.history_edu),
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    TextField(
                      controller: universityController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'University',
                        hintText: 'Enter Your University',
                        prefixIcon: Icon(Icons.school),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Color(0xff212121)),
                      onPressed: (){
                        // widget 6 - Navigator
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          ProfileScreen(
                              nameController.text.toString(),
                              trackController.text.toString(),
                              roleController.text.toString(),
                              phoneController.text.toString(),
                              addressController.text.toString(),
                              educationController.text.toString(),
                              universityController.text.toString(),
                          ),),);
                      },
                      label: const Text('Submit', style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'RobotoMono'),),
                      icon: const Icon(Icons.send, color: Colors.white,size: 15,),
            
                    )],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
