// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.black12,
              width: 0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
                offset: Offset(0, 7),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xffE7F2F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 30,
                ),
                hintText: 'Выберите локацию',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

List<String> images = [
  'assets/images/agura.jpg',
  'assets/images/pinkLake.jpg',
  'assets/images/guamka.jpg',
  'assets/images/orl.jpg',
  'assets/images/abrau.jpg',
];

List<String> name = [
  'Агурские водопады',
  'Розовое озеро',
  'Гуамкское ущелье',
  'Орлиная полка',
  'Озеро Абрау-Дюрсо',
];

List<String> info = [
  'Наполняются водопады из горной реки Агуры, с которой связана красивая легенда. /Боги решили наказать Прометея за то, что он дал людям огонь, и приковали героя к скале. Он должен был страдать без еды и питья. Не только людям, но даже птицам и зверям строго запрещалось делать что-то, облегчающее мучения героя.Но местная девушка по имени Агура принесла Прометею воды. За это она была жестоко наказана. Смотритель сбросил девушку со скалы. Упав на землю, она превратилась в бурную реку. Каменное изваяние Прометея с мощными цепями на руках установлено на вершине одной из местных скал, что напоминает об этой легенде. Первая достопримечательность здешних мест — Чёртова купель. Воды в этом источнике наполнены сероводородом и имеют характерный запах, что и послужило поводом для «инфернального» названия. Вода здесь чистая и лечебная, желающие могут искупаться.',
  'Розовое озеро Сасык-Сиваш – самое большое из соленых озер Крыма и крупнейшее /озеро полуострова. Его площадь – более 70 кв. км., оно вытянуто в длину на 14 км. Северная часть пресная, а южная — соленая. Дамба не дает им смешаться. Несмотря на перевод названия «зловонная грязь», розовое озеро Сасык-Сиваш входит в число главных туристических достопримечательностей летнего Крыма. Привлекательным его делает именно необычный пейзаж — озеро с розовой водой. И каждый год множество людей, местных и приезжих, приходят полюбоваться и запечатлеть на фото это фантастическое природное явление. Помимо красоты, озеро Сасык знаменито своими лечебными грязями и розовой солью. Археологические раскопки показали, что соль добывалась во времена скифов и древних греков. И сейчас там развита добыча соли, а полезную розовую соль можно купить в Евпатории и Саках. Она содержит йод, бета-каротин, цинк, железо, медь, марганец, натрий и калий. Дышать испарениями соляного озера летом полезно для профилактики различных заболеваний. Часто можно наблюдать, как люди сами собирают соль с поверхности озера, но необработанную соль в пищевых и косметических целях использовать не рекомендуется.',
  '',
];

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 50),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: CustomAppBar(),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Рекомендуемые',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Все',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff357AFF),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 268,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) => Container(
                  child: InkWell(
                    onTap: () {
                      // ignore: inference_failure_on_function_invocation
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.9,
                          maxChildSize: 0.9,
                          builder: (_, scrollController) => DecoratedBox(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30),
                              ),
                            ),
                            child: ListView(
                              controller: scrollController,
                              children: <Widget>[
                                Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.width *
                                      (3 / 4),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        name[index],
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        info[index],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            width: 213,
                            height: 268,
                          ),
                          Positioned(
                            bottom: 26,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                name[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
