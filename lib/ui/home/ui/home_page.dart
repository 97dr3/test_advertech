import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_advertech/ui/components/input_field_component.dart';
import 'package:test_advertech/ui/home/bloc/home_bloc.dart';
import 'package:test_advertech/ui/home/bloc/home_event.dart';
import 'package:test_advertech/ui/home/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact us"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: _checkContactInfoStatus,
        builder: (context, state) {
          if (state is LoadingState) {
            isLoading = state.loading;
          }

          return Column(
            children: [
              InputFieldComponent(
                hintText: "name",
                controller: _nameController,
              ),
              InputFieldComponent(
                hintText: "email",
                controller: _emailController,
              ),
              InputFieldComponent(
                hintText: "message",
                controller: _messageController,
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: _sendContactInfo,
                child: Container(
                  width: 220,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text(
                    isLoading ? "Wait" : "Send",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _toastMessage(
    String message,
    Color color,
  ) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _sendContactInfo() {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;
    final bool emailValid = emailValidation.hasMatch(email);

    if (!isLoading) {
      if (name.isEmpty || email.isEmpty || message.isEmpty) {
        _toastMessage(
          "ALL FIELDS SHOULD BE FILLED",
          Colors.red,
        );
      } else if (!emailValid) {
        _toastMessage(
          "INVALID MAIL",
          Colors.red,
        );
      } else {
        context.read<HomeBloc>().add(
              const LoadingEvent(true),
            );
        context.read<HomeBloc>().add(
              ContactInformationSendEvent(
                name,
                email,
                message,
              ),
            );
      }
    }
  }

  void _checkContactInfoStatus(
    BuildContext context,
    HomeState state,
  ) {
    if (state is ContactInfoSentState) {
      if (state.contactInfoSent) {
        _toastMessage(
          "SUCCESS",
          Colors.green,
        );
        context.read<HomeBloc>().add(
              const LoadingEvent(false),
            );
      } else {
        _toastMessage(
          "FAILED",
          Colors.red,
        );
        context.read<HomeBloc>().add(
              const LoadingEvent(false),
            );
      }
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}

final emailValidation = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
