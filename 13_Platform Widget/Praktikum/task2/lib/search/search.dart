import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( 
      margin: const EdgeInsets.all(16),
    child: CupertinoSearchTextField(
        onChanged: (data){},
        onSubmitted: (data){},
        autocorrect: true,
        prefixInsets: const EdgeInsets.only(left: 160),
    ),
    );
  }
}