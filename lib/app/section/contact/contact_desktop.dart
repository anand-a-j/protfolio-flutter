import 'package:flutter/material.dart';
import 'package:portfolio/app/section/contact/widgets/form_custom_button.dart';
import 'package:portfolio/app/utils/utils.dart';
import 'package:portfolio/core/providers/contact_form_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/custom_textfield.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
     
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Text(
            "Contact",
            style: heading2,
          ),
          const SizedBox(height: 20),
          const Text(
            "Feel free to reach out to me for any questions or opportunities!",
            style: body1,
          ),
          const SizedBox(height: 50),
          Container(
            width: 550,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: boxShadow,
            ),
            child: Consumer<ContactFormProvider>(builder: (context, form, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email Me🚀", style: heading2),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    hintText: "Your Name",
                    controller: form.nameController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    hintText: "Your Email",
                    controller: form.emailController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    hintText: "Your Subject",
                    controller: form.subjectController,
                  ),
                  const SizedBox(height: 15),
                  CustomTextfield(
                    hintText: "Your Message",
                    controller: form.descriptionController,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 15),
                  const FormCustomButton(),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
