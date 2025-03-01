import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_task/res/color.dart';
import 'package:internship_task/res/components/round_button.dart';
import 'package:internship_task/utils/routes/routes_name.dart';
import 'package:internship_task/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: height * .05,),
              const Image(image: AssetImage('assets/images/carboncap.png')),
              SizedBox(height: height * .1,),
              const Text('Verify OTP', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20,),),
              SizedBox(height: height * .03,),
              const Text('Enter OTP sent to your Email', style: TextStyle(fontFamily: 'Poppins Medium', fontSize: 16,),),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),

                      ),

                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),


                      ),

                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),

                      ),

                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),

                      ),

                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),

                      ),

                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: const Color(0xffFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                              borderRadius: BorderRadius.circular(50.r)),
                        ),

                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(height: height * .06,),
              RoundButton(
                title: 'Verify OTP',
                loading: authViewModel.registerLoading,
                onPress: () {
                  Navigator.pushNamed(context, RoutesName.home);
                  /*Map data = {
                      'first name' : _firstNameController.text.toString(),
                      'last name' : _lastNameController.text.toString(),
                      'email' : _emailController.text.toString(),
                      'phone number' : _phoneController.text.toString(),
                      'address' : _addressController.text.toString(),
                      'gender' : _genderController.text.toString(),
                      'password' : _createPasswordController.text.toString(),
                      'confirm password' : _confirmPasswordController.text.toString()
                    };
                    authViewModel.registerApi(data, context);*/
                },),
              SizedBox(height: height * .02,),
              InkWell(
                onTap: (){

                },
                child: Text('Resend', style: TextStyle(fontSize: 20, fontFamily: 'Poppins Bold', color: AppColors.blackColor),),
              )
            ],
          )
        ],
      ),
    );
  }
}
