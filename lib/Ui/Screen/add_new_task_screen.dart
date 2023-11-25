import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:crud_app/Ui/Widget/profile_summary_card.dart';
import 'package:crud_app/Ui/Widget/snack_message.dart';
import 'package:crud_app/data_network_caller/network_caller.dart';
import 'package:crud_app/data_network_caller/network_reponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data_network_caller/utility/urls.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subjectTEContoller=TextEditingController();
  final TextEditingController _describtionTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  bool CreateTaskInProgress=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ProfileSummaryCard(),
              Expanded(child: BodyBackground(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32),
                        Text("Add New Task",style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _subjectTEContoller,
                          decoration: InputDecoration(
                            hintText: "Subject",
                          ),
                          validator: (String? value){
                            if(value?.trim().isEmpty ?? true){
                              return "Enter Your Subject";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _describtionTEController,
                          maxLines: 8,
                          decoration: InputDecoration(
                            hintText: "Describtion",
                          ),
                          validator: (String? value){
                            if(value?.trim().isEmpty ?? true){
                              return "Enter Your Describtion";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        SizedBox(width: double.infinity,
                          child: Visibility(
                            visible: CreateTaskInProgress==false,
                            replacement: Center(child: CircularProgressIndicator(),),
                            child: ElevatedButton(onPressed: () {
                              if(_formKey.currentState!.validate()){
                                CreateTask();
                              }
                            },
                            child: Icon(Icons.arrow_circle_right_outlined),),
                          ),)
                      ]
                    ),
                  ),
                ),
              ))

            ],
          ),
        ),
      ),
    );
  }
  Future<void>CreateTask()async {
    if(_formKey.currentState!.validate()){
      CreateTaskInProgress=true;
      if(mounted){
        setState(() {
          
        });
      }
      final NetworkResponse response=await NetworkCaller().PostRequest(Urls.createTask,body: {
        "title":_subjectTEContoller.text.trim(),
        "description":_describtionTEController.text.trim(),
        "status":"New"
      });
      CreateTaskInProgress=false;
      if(mounted){
         setState(() {

         });
      }
      if(response.isSuccess){
        _subjectTEContoller.clear();
        _describtionTEController.clear();
        showSnackMessage(context, "New Task Create Successful",false);
      }else{
        if(mounted){
          showSnackMessage(context, "New Task Create failed",true);
        }
      }

    }
  }
  
  @override
  void dispose() {
    _subjectTEContoller.dispose();
    _describtionTEController.dispose();
    super.dispose();
  }
}
