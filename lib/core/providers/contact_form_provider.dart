import 'package:flutter/material.dart';

class ContactFormProvider extends ChangeNotifier {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get subjectController => _subjectController;
  TextEditingController get descriptionController => _descriptionController;
  
  onSubmit() {
    if(descriptionController.text.isEmpty) {
    
    }
  }
  
}
