import 'package:flutter/material.dart';

import 'package:fl_widgets/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: const [
          CustomCard(),
          CustomCard2(
            imageUrl:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5ea465ed-29e4-45da-b455-60e9e0a777bb/dey3buz-034797f8-5ae0-4b72-9166-6930855b2cd2.jpg/v1/fill/w_1600,h_1533,q_75,strp/decidueye__samurott_and_typhlosion__hisuian_forms__by_albrt_wlson_dey3buz-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTUzMyIsInBhdGgiOiJcL2ZcLzVlYTQ2NWVkLTI5ZTQtNDVkYS1iNDU1LTYwZTllMGE3NzdiYlwvZGV5M2J1ei0wMzQ3OTdmOC01YWUwLTRiNzItOTE2Ni02OTMwODU1YjJjZDIuanBnIiwid2lkdGgiOiI8PTE2MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.JE4D1Kmq13KHX_bNbmUw1K9TbtCPutN4OzKqmqUHghs',
            title: 'Best Hisuian Starter',
          ),
          CustomCard2(
              imageUrl:
                  'https://cdnb.artstation.com/p/assets/images/images/023/729/999/large/ange-cachart-dracau-x.jpg?1580164409&dl=1'),
        ],
      ),
    );
  }
}
