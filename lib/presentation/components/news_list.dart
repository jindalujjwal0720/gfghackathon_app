import 'package:flutter/cupertino.dart';
import 'package:gfghackathon_app/data/providers/news_provider.dart';
import 'package:gfghackathon_app/presentation/components/news_list_tile.dart';

import 'loading.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getNewsData(),
        builder: (context , snapshot) {
          if(snapshot.hasData)
            {
              return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    NewsListTile(snapshot.data![index])
             );
            }
          else
            {
              return const LoadingWidget();
            }

        }

    );
  }
}
