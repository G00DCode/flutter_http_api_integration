import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_api_integration/Widgets/ui_helper.dart';
import 'package:http/http.dart' as http;

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController nameController =TextEditingController();
  TextEditingController jobController =TextEditingController();

  createUser({ required String name, required String job})async{
    final String apiUrl="https://reqres.in/api/users";

    if(name==""&&job==""){
      return SnackBar(content: Text("Enter Required Fields"));
    }
    else{
      String encodedData =jsonEncode({name:name,job:job});
      final response =await http.post(Uri.parse(apiUrl));

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(nameController, "Enter Username", Icons.person),
          UiHelper.CustomTextField(jobController, "Enter Job Title", Icons.work),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text("Sign Up"))
        ],
      ),
    );
  }
}
