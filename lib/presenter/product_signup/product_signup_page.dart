import 'package:flutter/material.dart';

class ProductSignupPage extends StatelessWidget {
  const ProductSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(60),
            child: Center(
              child: Text(
                'Cadastrar Produto',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 400,
                color: Colors.white,
              ),
              Center(
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.85,
                  color: Colors.white,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(50),
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
