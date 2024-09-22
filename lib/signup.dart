
import 'package:flutter/material.dart';



class Ratewidget extends StatelessWidget {
  Ratewidget({required this.rate});
  double rate=0.0;
  late Color colored;
  Widget build(BuildContext context) {
   colored= rate>7?Colors.green:rate<5?Colors.red:Colors.blue;
    return Center(
        child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0,end: 1),
          duration: Duration(seconds: 4),
          builder: (context,value,child){
            return Container(
              height: MediaQuery.of(context).orientation==Orientation.portrait?
              MediaQuery.of(context).size.height/9+5:
              MediaQuery.of(context).size.height/7+5,
              width: MediaQuery.of(context).orientation==Orientation.portrait?
              MediaQuery.of(context).size.width/7+5:
              MediaQuery.of(context).size.height/9+5,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect){
                      return SweepGradient(
                          startAngle: 0.0,
                          endAngle: 6.28,
                          stops: [rate/10.0,(rate/10.0)+0.02],
                          // 0.0 , 0.5 , 0.5 , 1.0
                          center: Alignment.center,
                          colors: [colored,Colors.indigo.withAlpha(70)]
                      ).createShader(rect);
                    },
                    child: Container(
                      height: MediaQuery.of(context).orientation==Orientation.portrait?
                      MediaQuery.of(context).size.height/9+5:
                      MediaQuery.of(context).size.height/7+5,
                      width: MediaQuery.of(context).orientation==Orientation.portrait?
                      MediaQuery.of(context).size.width/7+5:
                      MediaQuery.of(context).size.height/9+5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                          // image: DecorationImage(image: Image.asset("assets/images/radial_scale.png").image)
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).orientation==Orientation.portrait?
                      MediaQuery.of(context).size.height/9-5:
                      MediaQuery.of(context).size.height/7-5,
                      width: MediaQuery.of(context).orientation==Orientation.portrait?
                      MediaQuery.of(context).size.width/7-5:
                      MediaQuery.of(context).size.height/9-5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Center(child: Text("$rate",
                        style: TextStyle(fontSize:
                        MediaQuery.of(context).orientation==Orientation.portrait?
                      MediaQuery.of(context).size.height/55:
                      MediaQuery.of(context).size.height/35,
                        color:Colors.black),)),
                    ),
                  )
                ],
              ),
            );
          },
        ),
    );
  }
}
