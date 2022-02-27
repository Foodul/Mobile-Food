import 'package:flutter/material.dart';
import 'package:foodul/core/base/viewmodel/base_view_model.dart';
import 'package:foodul/view/categories/model/categories_model.dart';

import 'package:mobx/mobx.dart';
part 'categories_view_model.g.dart';

class CategoriesViewModel = _CategoriesViewModelBase with _$CategoriesViewModel;

abstract class _CategoriesViewModelBase with Store, BaseViewModel {
  List<CategoriesModel> categories = [
    CategoriesModel(
        image:
            'https://blog.obilet.com/wp-content/uploads/2021/05/Sebzeler-scaled.jpeg',
        details: [
          CategoryDetails(
            image:
                'https://www.nutraingredients-usa.com/var/wrbm_gb_food_pharma/storage/images/_aliases/wrbm_large/publications/food-beverage-nutrition/nutraingredients-usa.com/news/research/tomato-powder-beats-isolated-lycopene-in-study-but-expert-questions-scope-of-conclusions/12238409-1-eng-GB/Tomato-powder-beats-isolated-lycopene-in-study-but-expert-questions-scope-of-conclusions.jpg',
            title: 'Tomato',
          ),
          CategoryDetails(
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlh0LgYlZtVPPNHIeIn0GClJ90-uKR0vN9j9sjh0i1P5BqpRuDrkGSvEPvXy9wSchPSm0&usqp=CAU',
              title: 'Tomato'),
          CategoryDetails(
            image:
                'https://cdn03.ciceksepeti.com/cicek/kcm82904816-1/XL/iri-dev-patlican-tohumu-ithal-dev-patlican-tohumu-10-tohum-surpriz-hediye-tohum-kcm82904816-1-e564f51930074e07abe8d2bc4d310f50.jpg',
            title: 'Aubergine',
          ),
          CategoryDetails(
            image:
                'https://www.aftamarket.com.tr/sogan-sebzeler-manav-12415-17-B.jpg',
            title: 'Onion',
          ),
          CategoryDetails(
            image:
                'https://www.tohumsanati.com/yalcin-biber-tohumutatlitarla-carliston-biberler-yuksel-tohum-339-50-B.jpg',
            title: 'Peper',
          ),
          CategoryDetails(
            image:
                'https://i.nefisyemektarifleri.com/2017/11/08/bamya-nasil-yapilir-begenilen-bamya-yemekleri-1-600x400.jpg',
            title: 'Okra',
          ),
          CategoryDetails(
            image:
                'https://www.tarlaniz.com/image/cache/catalog/sebzeler/sarimsak-1000x1000.jpg',
            title: 'Garlic',
          ),
          CategoryDetails(
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiXtcaaK00GQNviR4-ViWRZ7iOjG9mYxTKRsKlXLQ21ly8R4sUJkP6toqhA7pfQorOUJw&usqp=CAU',
            title: 'Cabbage',
          ),
        ],
        title: 'Vegetables'),
    CategoriesModel(
        image:
            'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
        title: 'Fruits',
        details: [
          CategoryDetails(
            image: 'https://www.seraf.com.tr/kivi-500-g-meyve-1094-35-B.jpg',
            title: 'Kiwi',
          ),
          CategoryDetails(
            image:
                'https://www.verita.com.tr/wp-content/uploads/2014/08/muz.jpg',
            title: 'Banana',
          ),
          CategoryDetails(
            image:
                'https://www.mda-agro.com/en/tekno_dosyalar/large/20_07_18_23640_837d356571561e3e1aaa8579374c6995.jpg',
            title: 'Mandarin',
          ),
          CategoryDetails(
            image:
                'https://images.unsplash.com/photo-1606604830353-4da34f5a208a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2004&q=80',
            title: 'Apple',
          ),
          CategoryDetails(
            image:
                'https://m.media-amazon.com/images/I/61OHAsXEmgL._SS500_.jpg',
            title: 'Pear',
          ),
          CategoryDetails(
            image:
                'https://static.libertyprim.com/files/familles/peche-large.jpg?1574630286',
            title: 'Peach',
          ),
          CategoryDetails(
            image:
                'https://pbs.twimg.com/profile_images/459401470/strawberry_400x400.png',
            title: 'Strawberry',
          ),
        ]),
    CategoriesModel(
        image:
            'https://cdn.vox-cdn.com/thumbor/A_jC-vC8q_aK7hqQQOwiDexNCTo=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/21890023/Snacks.jpg',
        title: 'Snacks'),
    CategoriesModel(
        image:
            'https://simply-delicious-food.com/wp-content/uploads/2019/07/Pancake-board-2.jpg',
        title: 'Breakfast'),
    CategoriesModel(
        image:
            'https://www.texasrealfood.com/discover/wp-content/uploads/sites/3/2020/04/iStock-493058654-min-1.jpg',
        title: 'Staple Food'),
    CategoriesModel(
        image:
            'https://media.baamboozle.com/uploads/images/206824/1622533346_327808_url.jpeg',
        title: 'Drinks'),
  ];

  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
