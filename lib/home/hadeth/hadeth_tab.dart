import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islami_app/home/hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';


class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if(ahadethList.isEmpty){
      loadHadethFile();
    }
    return Center(
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/hadeth_logo.png')),
          Divider(
            color:  provider.isDarkMode() ?
            MyTheme.yellowColor
                :
            Theme.of(context).primaryColor,
            thickness: 3,
          ),
          Text(AppLocalizations.of(context)!.hadeth_name ,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Divider(
            color: provider.isDarkMode() ?
            MyTheme.yellowColor
                :
            Theme.of(context).primaryColor,
            thickness: 3,
          ),
          ahadethList.isEmpty ?
              Center(child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
              :
          Expanded(
            flex: 2,
            child: ListView.separated(
              separatorBuilder: (context,index){
                return Divider(
                  color: provider.isDarkMode() ?
                  MyTheme.yellowColor
                      :
                  Theme.of(context).primaryColor,
                  thickness: 2,
                );
              },
                itemBuilder: (context,index){
                  return ItemHadethName(hadeth: ahadethList[index],) ;
                },
              itemCount: ahadethList.length,
            ),
          ),

        ],
      ),
    );
  }

  void loadHadethFile()async{
    String ahadethContent = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = ahadethContent.split('#\r\n');
    for(int i = 0 ; i < hadethList.length ; i++){
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {

      });
    }
  }
}
class Hadeth{
  String title;
  List<String> content;

  Hadeth({required this.title,required this.content});
}
