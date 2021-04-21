import 'package:brinkeduca/components/buttons.dart';
import 'package:brinkeduca/components/dialogs.dart';
import 'package:brinkeduca/core/routes.dart';
import 'package:brinkeduca/core/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Auth extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final TextEditingController _rmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Session.shared.nameApp),
      ),
      body: Container(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Digite seu RM', labelText: 'Digite seu RM'),
                    controller: _rmController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      return value.isEmpty ? 'Insira seu RM' : null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Buttons.asyncButton(
                      text: 'Fazer Login',
                      onTapFunction: () async {
                        if (_formKey.currentState.validate()) {
                          var result = await checkUserInApi(
                              int.parse(_rmController.text),
                              context,
                              _keyLoader);

                          if (result) {
                            Navigator.of(context)
                                .pushReplacementNamed(Routes.modeApp);
                          } else {
                            print('Deu ruim');
                            Dialogs.showMessageDialog(
                                context,
                                'Erro ao efetuar login',
                                'Verifique o RM digitado');
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> checkUserInApi(
    int rm, BuildContext context, GlobalKey<State> keyLoader) async {
  String url = Session.shared.authBaseAddress;
  try {
    Dialogs.showLoadingDialog(context, keyLoader);
    var response = await Dio().get('$url/$rm');

    print(response.data.toString());
    if (response.data['status'] == 'ok') {
      Session.shared.studentName = response.data['data']['name'];
      Navigator.of(keyLoader.currentContext, rootNavigator: true).pop();
      return true;
    } else {
      Navigator.of(keyLoader.currentContext, rootNavigator: true).pop();
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
