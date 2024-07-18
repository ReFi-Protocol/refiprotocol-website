import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/cta_button.dart';
import '../../../widgets/custom_appbar.dart';

class ContactFrame extends StatefulWidget {
  const ContactFrame({super.key, required this.controller});
  final ScrollController controller;
  @override
  State<ContactFrame> createState() => _ContactFrameState();
}

class _ContactFrameState extends State<ContactFrame> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _loading = false;

  sendContactEmail(String name, String email, String message) async {
    Map<String, dynamic> templateParams = {
      'from_name': name,
      'reply_to': email,
      'message': message
    };
    setState(() {
      _loading = true;
    });

    try {
      await EmailJS.send(
        'service_0ipo4ai',
        'template_07lmbb6',
        templateParams,
        const Options(
          publicKey: 'qI0azStKYaQiJ-_x_',
          privateKey: 'GOYcBgkM3bxDxP5a4VfXR',
        ),
      );
      Get.showSnackbar(const GetSnackBar(
        title: "Thank you",
        message: "Thanks for reaching out, we will contact you shortly",
      ));
      _nameController.clear();
      _messageController.clear();
      _emailController.clear();
    } catch (error) {
      print(error);
      Get.showSnackbar(GetSnackBar(
        title: "Error",
        message: "Failed to send email:${error.toString()}",
      ));
    }
    setState(() {
      _loading = false;
    });
  }

  _getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 30, vertical: 40);
    } else {
      return const EdgeInsets.all(20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        width: 1.sw,
        constraints: const BoxConstraints(minHeight: 850),
        height: 1.sh,
        child: Stack(children: [
          Container(
              alignment: Alignment.center,
              child: _loading ? CircularProgressIndicator() : null),
          // Positioned(top: 0, left: 0, child: _parallaxImage()),
          Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const PreferredSize(
                    preferredSize: Size.fromHeight(80),
                    child: CustomAppBar(
                      page: Routes.CONTACT,
                    ),
                  ),
                  Padding(
                      padding: _getContainerPadding(),
                      child: Responsive(
                        desktop: _desktopView(),
                        mobile: _mobileView(),
                      ))
                ],
              ))
        ]));
  }

  _parallaxImage() {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double offsetY = -widget.controller.offset *
              (Responsive.isDesktop(context) ? 0.625 : 0.625);
          return Transform.translate(
            offset: Offset(0, offsetY),
            child: child,
          );
        },
        child: _background());
  }

  _background() {
    return Transform.flip(
      flipX: true,
      child: Image.asset(
        "assets/images/gradients.png",
        fit: BoxFit.cover,
        width: 1.sw,
        height: 2.sh,
      ),
    );
  }

  _mobileView() {
    return Column(
      children: [_contactForm()],
    );
  }

  _desktopView() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600.w),
      child: _contactForm(),
    );
  }

  _contactForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(children: [
                Text(
                  "Feel free to write to us",
                  textAlign: TextAlign.center,
                  style: Responsive.getTextStyle(context,
                      dSize: 40,
                      mSize: 30,
                      weight: FontWeight.w500,
                      textColor: Colors.white),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Questions about our products/services or just want to say hello? We’re here to help",
                  textAlign: TextAlign.center,
                  style: Responsive.getTextStyle(context,
                      dSize: 18,
                      mSize: 16,
                      weight: FontWeight.w500,
                      textColor: Colors.white),
                ),
              ]),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: TextFormField(
                  controller: _nameController,
                  decoration: _textFieldDecoration('Name'),
                  style: GoogleFonts.inter(color: Colors.white),
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  // style: GoogleFonts.inter(color: kBlack),
                  // cursorColor: kPink,
                  onChanged: (text) {
                    setState(() {
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: TextFormField(
                  controller: _emailController,
                  decoration: _textFieldDecoration("Email"),
                  style: GoogleFonts.inter(color: Colors.white),
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains("@") || !value.contains(".")) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: TextFormField(
                  controller: _messageController,
                  decoration: _textFieldDecoration("Message"),
                  style: GoogleFonts.inter(color: Colors.white),
                  cursorColor: Colors.white,
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Message is empty';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {
                      //you can access nameController in its scope to get
                      // the value of text entered as shown below
                      //fullName = nameController.text;
                    });
                  },
                )),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Expanded(
                    child: CTAButton(
                        filled: true,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // Get.toNamed(Routes.SUCCESS);
                            sendContactEmail(_nameController.text,
                                _emailController.text, _messageController.text);

// https://api.emailjs.com/api/v1.0/email/send-form
                          }
                        },
                        child: const Text(
                          "Submit",
                        )))
              ],
            ),
          ],
        ));
  }

  _textFieldDecoration(String title) {
    return InputDecoration(
        // hoverColor: const Color(0xff2D2D2D),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff2D2D2D))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        floatingLabelStyle: const TextStyle(color: Colors.white),
        labelText: title,
        labelStyle: GoogleFonts.inter(color: Colors.white));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
