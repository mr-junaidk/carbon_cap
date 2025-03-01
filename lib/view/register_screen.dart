import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internship_task/res/components/round_button.dart';
import 'package:internship_task/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import 'package:internship_task/utils/utils.dart';
import '../viewmodel/auth_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _createPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  FocusNode createPasswordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _genderController.dispose();
    _createPasswordController.dispose();
    _confirmPasswordController.dispose();


    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    addressFocusNode.dispose();
    genderFocusNode.dispose();
    createPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * .05,),
                Image(image: AssetImage('assets/images/carboncap.png')),
                SizedBox(height: height * .1,),
                const Text('Sign up', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20,),),
                SizedBox(height: height * .03,),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: TextFormField(
                    controller: _firstNameController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: firstNameFocusNode,
                    decoration: InputDecoration(
                      labelText: ' First Name*',
                      labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                      fillColor: const Color(0xffFFFFFF),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, firstNameFocusNode, lastNameFocusNode);
                    },
                  ),
                ),
                SizedBox(height: height * .02,),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: TextFormField(
                    controller: _lastNameController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: lastNameFocusNode,
                    decoration: InputDecoration(
                      labelText: ' Last Name*',
                      labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                      fillColor: const Color(0xffFFFFFF),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, lastNameFocusNode, emailFocusNode);
                    },
                  ),
                ),
                SizedBox(height: height * .02,),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: TextFormField(
                    controller: _emailController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                      labelText: ' Enter Your Email*',
                      labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                      fillColor: const Color(0xffFFFFFF),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, emailFocusNode, phoneFocusNode);
                    },
                  ),
                ),
                SizedBox(height: height * .02,),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: TextFormField(
                    controller: _phoneController,
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                    focusNode: phoneFocusNode,
                    decoration: InputDecoration(
                      labelText: ' Enter Your Phone Number*',
                      labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                      fillColor: const Color(0xffFFFFFF),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, phoneFocusNode, addressFocusNode);
                    },
                  ),
                ),
                SizedBox(height: height * .02,),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: TextFormField(
                    controller: _addressController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: addressFocusNode,
                    decoration: InputDecoration(
                      labelText: ' Enter Your Address*',
                      labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                      fillColor: const Color(0xffFFFFFF),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, addressFocusNode, genderFocusNode);
                    },
                  ),
                ),
                SizedBox(height: height * .02,),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24),
                  child: TextFormField(
                    controller: _genderController,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: genderFocusNode,
                    decoration: InputDecoration(
                      labelText: ' Select Gender*',
                      labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                      fillColor: const Color(0xffFFFFFF),
                      filled: true,
                      suffixIcon: PopupMenuButton<String>(
                        color: Color(0xffFFFFFF),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 5),
                          child: SvgPicture.asset('assets/images/dropdown.svg'),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25)
                          )
                        ),
                        onSelected: (value) {
                          setState(() {
                            _genderController.text = value;
                          });
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: "Male",
                            child: Padding(
                              padding: const EdgeInsets.only(right: 160),
                              child: Text("Male", style: TextStyle(fontFamily: 'Poppins Light', fontSize: 16),),
                            ),
                          ),
                          PopupMenuItem(
                            value: "Female",
                            child: Text("Female", style: TextStyle(fontFamily: 'Poppins Light', fontSize: 16),),
                          ),
                        ],
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, genderFocusNode, createPasswordFocusNode);
                    },
                  ),
                ),
                SizedBox(height: height * .02,),
                ValueListenableBuilder(valueListenable: _obsecurePassword, builder: (context, value, child){
                  return Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24),
                    child: TextFormField(
                      controller: _createPasswordController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: '*',
                      focusNode: createPasswordFocusNode,
                      decoration: InputDecoration(
                        labelText: ' Create Your Password*',
                        labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                        suffixIcon: InkWell(
                            onTap: (){
                              _obsecurePassword.value = !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value? Icons.visibility_off_outlined: Icons.visibility)),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onFieldSubmitted: (value){
                        Utils.fieldFocusChange(context, createPasswordFocusNode, confirmPasswordFocusNode);
                      },
                    ),
                  );
                }),
                SizedBox(height: height * .02,),
                ValueListenableBuilder(valueListenable: _obsecurePassword, builder: (context, value, child){
                  return Padding(
                    padding: const EdgeInsets.only(right: 24, left: 24),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: '*',
                      focusNode: confirmPasswordFocusNode,
                      decoration: InputDecoration(
                        labelText: ' Confirm Password*',
                        labelStyle: const TextStyle(fontFamily: 'Poppins Light', fontSize: 16),
                        suffixIcon: InkWell(
                            onTap: (){
                              _obsecurePassword.value = !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value? Icons.visibility_off_outlined: Icons.visibility)),
                        fillColor: const Color(0xffFFFFFF),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(width: height * .004,),
                      Expanded(
                        child: Text(
                          "I agree with terms and conditions",
                          style: TextStyle(fontFamily: 'Poppins Medium', fontSize: 12, color: Color(0xff474747)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * .06,),
                RoundButton(
                  title: 'Next',
                  loading: authViewModel.registerLoading,
                  onPress: () {
                    Navigator.pushNamed(context, RoutesName.verify);
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
                SizedBox(height: height * .005,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins Medium',
                          color: Color(0xff000000)),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RoutesName.login);
                      },
                      child: Text(
                        ' Sign in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins Medium',
                            color: Color(0xff2E7758)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * .05,),
              ],
            )
          ],
        )
    );
  }
}



