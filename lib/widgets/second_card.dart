import 'package:flutter/material.dart';
class SecondCard extends StatelessWidget {
  const SecondCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green
          ,
          borderRadius: BorderRadius.circular(7)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Under Weight", style: TextStyle(color: Colors.white ,
                    fontSize: 20 ,
                    fontWeight: FontWeight.bold
                ),

                ),
              ],
            )
            , Row(
              children: [
                Text("Your BMI is less than 18.5", style: TextStyle(color: Colors.white ,
                  fontSize: 14 ,
                ),
                ),
              ],
            ),
            SizedBox(height: 7,),
            Text("Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est."
              , style: TextStyle(color: Colors.white
                , fontSize: 14 ,

              ),
            ) ,
            SizedBox(height: 10,)
          ],
        ),
      ),
    ) ;
  }
}
