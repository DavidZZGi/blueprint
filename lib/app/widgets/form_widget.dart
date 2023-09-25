import 'package:blueprint/app/utils/util_preferences.dart';
import 'package:blueprint/core/blocs/bloc/issue_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/const.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _prefs =UtilPreferences();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController githubToken=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            obscureText: true,
            controller: githubToken,
            style: letterStyle,
                    decoration: const InputDecoration(
                      
                      helperStyle: letterStyle,
                      labelStyle: letterStyle,
                        labelText: 'Github token',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'Invalid Token';
                      } 
                    },
                  ),
                const SizedBox(height: 15,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                         shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                         )
                        ),
                         
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        _prefs.setGitHubToken= githubToken.text;
                   //add bloc event to trigger request to retrive data and then show the list of data
                         context.read<IssueBloc>().add(OnLoadIssueInfo());

                      }
                    },
                    child: const Text("Find",style: letterStyle),
                    
                  ),
        ],
      ) ,
    );
  }
}