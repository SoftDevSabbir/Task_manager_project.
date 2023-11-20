import 'package:crud_app/Ui/Widget/body_background.dart';
import 'package:crud_app/Ui/Widget/profile_summary_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            ProfileSummaryCard(
              enableOntap: false,
            ),
            Expanded(child: BodyBackground(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 32),
                     Text("Update Profile",style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: 16),
                      PhotoPicker(),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: InputDecoration(
                         hintText: "Photo",
                      ),
                    ), const SizedBox(height: 8),

                     const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                         hintText: "First Name ",
                      ),
                    ), const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                         hintText: " Last Name",
                      ),
                    ), const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                         hintText: "Mobile ",
                      ),
                    ), const SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                         hintText: " Password",
                      ),
                    ),
                      const SizedBox(height: 16),
                      SizedBox(width: double.infinity,
                        child: ElevatedButton(onPressed: () {},
                          child: Icon(Icons.arrow_circle_right_outlined),),)

                  ],),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PhotoPicker extends StatelessWidget {
  const PhotoPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex:1,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    )
                ),child: Center(child: Text("Photo",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
              )),
          Expanded(
              flex:3,
              child: Container(
                height: 50,
                color: Colors.white,
                //padding: EdgeInsets.only(left: 1),
                child: Center(child: Text("Empty")),

              )),
        ],
      ),
    );
  }
}
