import 'package:flutter/material.dart';
import 'package:untitled9_belcorp/pages/secondpage/chatgptreponsive.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> messages = [];
    final TextEditingController controller = TextEditingController();
    String selectedConsultant = 'Consultor 1';
    String selectedCountry = 'País 1';


    return Column(
      children: <Widget>[
        // Filtros
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: DropdownButton<String>(
                  value: selectedConsultant,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedConsultant = newValue!;
                    });
                  },
                  items: <String>['Consultor 1', 'Consultor 2', 'Consultor 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: DropdownButton<String>(
                  value: selectedCountry,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                    });
                  },
                  items: <String>['País 1', 'País 2', 'País 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Text('Soy tu asistente Virtual de Belleza',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),),
        ),
        // Área de chat
        Expanded(
          child: ChatGPTScreen()

        ),
        // Ingreso de chat
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     children: <Widget>[
        //       Expanded(
        //         child: ChatPagegpt()
        //       ),
        //       // IconButton(
        //       //   icon: Icon(Icons.send),
        //       //   onPressed: () {
        //       //     setState(() {
        //       //       messages.add(controller.text);
        //       //       controller.clear();
        //       //     });
        //       //   },
        //       // ),
        //     ],
        //   ),
        // ),
      ],
    );

  }
}
