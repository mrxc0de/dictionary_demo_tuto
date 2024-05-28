import 'package:dictionary_demo_tuto/api.dart';
import 'package:dictionary_demo_tuto/dict_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isLoading = false;
  DictModel? dictModel;
  String noDataText = 'Start search by typing in Search Bar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Search',
              leading: Icon(
                (Icons.search),
              ),
              onSubmitted: (value) async {
                setState(() {
                  isLoading = true;
                });
                try {
                  dictModel = await API.fetchMeaning(value);
                } catch (e) {
                  print(e);
                  setState(() {
                    noDataText = 'No data, search again!';
                    dictModel = null;
                  });
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            if (isLoading)
              LinearProgressIndicator()
            else if (dictModel != null)
              myWidget()
            else
              Text('${noDataText}'),
          ],
        ),
      ),
    );
  }

  myWidget() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(dictModel!.word!),
        Text(dictModel!.phonetic!),
        Expanded(
          child: ListView.builder(
              itemCount: dictModel!.meanings!.length,
              itemBuilder: (context, index) {
                return myMeaningWidget(dictModel!.meanings![index]);
              }),
        ),
      ],
    ));
  }

  myMeaningWidget(Meaning meaning) {
    String definitionList = '';
    meaning.definitions?.forEach((element) {
      int index = meaning.definitions!.indexOf(element);
      definitionList += '${index + 1}. ${element.definition!}\n';
    });

    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(meaning.partOfSpeech!),
            Text('Definitions:'),
            Text(definitionList),
            _buidlSet('Synonyms', meaning.synonyms),
            _buidlSet('Antonyms', meaning.atonyms),
          ],
        ),
      ),
    );
  }
}

_buidlSet(String s, List<String>? setList) {
  if (setList?.isNotEmpty ?? false) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${s}'),
        SizedBox(
          height: 10,
        ),
        Text(
          setList!
              .toSet()
              .toString()
              .replaceAll("{", 'replace')
              .replaceAll('}', ''),
        ),
      ],
    );
  } else {
    return SizedBox.shrink();
  }
}
