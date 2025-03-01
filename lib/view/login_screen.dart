import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internship_task/res/components/round_button.dart';
import 'package:internship_task/utils/routes/routes_name.dart';
import 'package:internship_task/utils/utils.dart';
import '../viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    final List<Map<String, dynamic>> avatarData = [
      {'url': 'assets/images/shareg.svg', 'color': const Color(0xffFFFFFF)},
      {'url': 'assets/images/facebook.svg', 'color': const Color(0xff77B5F2)},
      {'url': 'assets/images/linkedin.svg', 'color': const Color(0xff0077B5)},
      {'url': 'assets/images/whatsapp.svg', 'color': const Color(0xff52BF90)},
      {'url': 'assets/images/instagram.svg', 'color': const Color(0xffCC6957)},
    ];

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
        body: ListView(
          children: [
            Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset('assets/images/flower.svg', height: 180, width: 180,)),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Welcome to', style: TextStyle(fontFamily: 'Poppins Medium', fontSize: 32,),)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Image(image: AssetImage('assets/images/carboncap.png'))),
                ),
                SizedBox(height: height * .03,),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Please Sign in or Sign up to CarbonCap', style: TextStyle(fontFamily: 'Poppins Medium', fontSize: 16,),)),
                ),
                SizedBox(height: height * .03,),
                const Text('Sign in', style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 20,),),
                SizedBox(height: height * .03,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (_emailController.text == null || _emailController.text.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        decoration: InputDecoration(
                          labelText: ' Enter Your Email',
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
                          Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                    SizedBox(height: height * .02,),
                    ValueListenableBuilder(valueListenable: _obsecurePassword, builder: (context, value, child){
                      return Padding(
                        padding: const EdgeInsets.only(right: 24, left: 24),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obsecurePassword.value,
                          obscuringCharacter: '*',
                          focusNode: passwordFocusNode,
                          decoration: InputDecoration(
                            labelText: ' Enter Your Password',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16),
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
                              Text(
                                'Remember Password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins Light',
                                    color: Color(0xff000000)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: InkWell(
                            child: const Text(
                              'Forget Password?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins Light',
                                  color: Color(0xff1515BC),
                                  decoration: TextDecoration.underline
                              ),
                            ),
                            onTap: (){

                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * .05,),
                    RoundButton(
                      title: 'Sign in',
                      loading: authViewModel.loading,
                      onPress: () {
                        if(_emailController.text.isEmpty && _passwordController.text.isNotEmpty){
                          Utils.flushBarErrorMessage('Please enter email', context);
                        }else if(_passwordController.text.isEmpty && _emailController.text.isNotEmpty){
                          Utils.flushBarErrorMessage('Please enter password', context);
                        }else if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
                          Utils.flushBarErrorMessage('Please enter email and password', context);
                        }else if(_passwordController.text.length < 6){
                          Utils.flushBarErrorMessage('Password should not be less than 8 characters', context);
                        }else{
                          Map data = {
                            'email' : _emailController.text.toString(),
                            'password' : _passwordController.text.toString()
                          };
                          authViewModel.loginApi(data, context);
                        }
                      },),
                    SizedBox(height: height * .005,),
                    Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'New to CarbonCap?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins Medium',
                                color: Color(0xff000000)),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, RoutesName.register);
                            },
                            child: Text(
                              ' Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins Medium',
                                  color: Color(0xff2E7758)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, top: 48, left: 40),
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: avatarData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: index == 0 ? 20 : 2),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: avatarData[index]['color'],
                                          child: SvgPicture.asset(avatarData[index]['url']!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        )
    );
  }
}

