import 'IMCModelo.dart';
import 'ResultadoIMC.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PantallaIMCStateful extends StatefulWidget {
  @override
  _PantallaIMCState createState() => _PantallaIMCState();
}

class _PantallaIMCState extends State<PantallaIMCStateful> {
  double _alturaUsuario = 100.0;
  double _pesoUsuario = 40.0;
  double _imc = 0;

  IMCModelo _IMCModelo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset("assets/images/heart.svg", fit: BoxFit.contain,),
              ),
              SizedBox(
                height: 8,
              ),
              Text("IMC", style: TextStyle(color: Colors.lightGreen, fontSize: 34, fontWeight: FontWeight.w700),),
              Text("Nos preocupa tu salud", style: TextStyle(color: Colors.lightBlue, fontSize: 15, fontWeight: FontWeight.w400),),
              SizedBox(
                height: 32,
              ),

              Text("Altura (cm)", style: TextStyle(color: Colors.lightBlue, fontSize: 24, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (height){
                    setState(() {
                      _alturaUsuario = height;
                    });
                  },
                  value: _alturaUsuario,
                  divisions: 100,
                  activeColor: Colors.lime,
                  label: "$_alturaUsuario",
                ),
              ),

              Text("$_alturaUsuario cm", style: TextStyle(color: Colors.lightGreen, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 24,),

              Text("Peso (kg)", style: TextStyle(color: Colors.lightBlue, fontSize: 24, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 120.0,
                  onChanged: (height){
                    setState(() {
                      _pesoUsuario = height;
                    });
                  },
                  value: _pesoUsuario,
                  divisions: 100,
                  activeColor: Colors.lime,
                  label: "$_pesoUsuario",
                ),
              ),

              Text("$_pesoUsuario kg", style: TextStyle(color: Colors.lightGreen, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,),

              Container(
                child: FlatButton.icon(
                  onPressed: (){
                    setState(() {
                      _imc = _pesoUsuario/((_alturaUsuario/100)*(_alturaUsuario/100));
                      if (_imc <= 15){
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: false, resultado: "Delgadez muy severa");
                      }else if(_imc>15 && _imc<=15.9){
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: false, resultado: "Delgadez severa");
                      }else if(_imc>=16 && _imc<=18.4){
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: false, resultado: "Delgadez");
                      }else if(_imc>=18.5 && _imc<=24.9){
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: true, resultado: "Peso saludable");
                      }else if(_imc>=25 && _imc<=29.9){
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: false, resultado: "Sobrepeso");
                      }else if(_imc>=30 && _imc<=34.9){
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: false, resultado: "Obseidad moderada");
                      }else if(_imc>=35 && _imc<=39.9){
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: false, resultado: "Obesidad severa");
                      }else{
                        _IMCModelo = IMCModelo(imc: _imc, esNormal: false, resultado: "Obesidad morbida");
                      }
                      });

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ResultadoIMC(imcModelo: _IMCModelo,)
                    ));
                  },
                  icon: Icon(Icons.favorite, color: Colors.white,),
                  label: Text("Mide tu IMC"),
                  textColor: Colors.white,
                  color: Colors.lime,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        ),
      ),
    );
  }
}