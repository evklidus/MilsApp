//
//  Data.swift
//  Mils
//
//  Created by Erik Minasov on 23.01.2021.
//

import SwiftUI

class OurData: ObservableObject {
    
    @Published var categories : [Category] = [
        Category(id: "1", recipes: [
            Recipe(id: "C1_R1", name: "Сосиски",
                   image: "https://culinarya.ru/wp-content/uploads/2020/06/kak-otvarit-sosiski-v-vode-1.jpg",
                   images: [
                   ],
                   rating: "4",
                   time: "10",
                   complexity: "легко",
                   cost: "$",
                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
                   ingredients: [
                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
                   ],
                   tegs: ["легко", "100-200 ккал"],
                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
                           "Варить сосиски 2 минуты"
                   ]),
            Recipe(id: "C1_R2", name: "Удон с курицей и овощами",
                   image: "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg",
                   images: [
                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
                   ],
                   rating: "4",
                   time: "25",
                   complexity: "средне",
                   cost: "$",
                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
                   ingredients: [
                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
                   ],
                   tegs: ["средне", "100-200 ккал"],
                   steps: [
                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
                   ]
//            ),
//            Recipe(id: "C1_R3", name: "Сосиски",
//                   image: "https://culinarya.ru/wp-content/uploads/2020/06/kak-otvarit-sosiski-v-vode-1.jpg",
//                   images: [
//                   ],
//                   rating: "4",
//                   time: "10 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
//                   ingredients: [
//                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
//                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
//                   ],
//                   tegs: ["легко", "100-200 ккал"],
//                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
//                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
//                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
//                           "Варить сосиски 2 минуты"
//                   ]),
//            Recipe(id: "C1_R4", name: "Удон с курицей и овощами",
//                   image: "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg",
//                   images: [
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
//                   ],
//                   rating: "4",
//                   time: "25 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
//                   ingredients: [
//                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                   ],
//                   tegs: ["средне", "100-200 ккал"],
//                   steps: [
//                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
//                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
//                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
//                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
//                   ]
//            ),
//            Recipe(id: "C1_R5", name: "Сосиски",
//                   image: "https://culinarya.ru/wp-content/uploads/2020/06/kak-otvarit-sosiski-v-vode-1.jpg",
//                   images: [
//                   ],
//                   rating: "4",
//                   time: "10 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
//                   ingredients: [
//                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
//                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
//                   ],
//                   tegs: ["легко", "100-200 ккал"],
//                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
//                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
//                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
//                           "Варить сосиски 2 минуты"
//                   ]),
//            Recipe(id: "C1_R6", name: "Удон с курицей и овощами",
//                   image: "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg",
//                   images: [
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
//                   ],
//                   rating: "4",
//                   time: "25 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
//                   ingredients: [
//                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                   ],
//                   tegs: ["средне", "100-200 ккал"],
//                   steps: [
//                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
//                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
//                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
//                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
//                   ]
//            ),
//            Recipe(id: "C1_R7", name: "Сосиски",
//                   image: "https://culinarya.ru/wp-content/uploads/2020/06/kak-otvarit-sosiski-v-vode-1.jpg",
//                   images: [
//                   ],
//                   rating: "4",
//                   time: "10 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
//                   ingredients: [
//                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
//                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
//                   ],
//                   tegs: ["легко", "100-200 ккал"],
//                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
//                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
//                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
//                           "Варить сосиски 2 минуты"
//                   ]),
//            Recipe(id: "C1_R8", name: "Удон с курицей и овощами",
//                   image: "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg",
//                   images: [
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
//                   ],
//                   rating: "4",
//                   time: "25 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
//                   ingredients: [
//                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                   ],
//                   tegs: ["средне", "100-200 ккал"],
//                   steps: [
//                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
//                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
//                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
//                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
//                   ]
            ),
        ], image: "https://image.flaticon.com/icons/png/128/837/837560.png", name: "Простые блюда"),
//        Category(id: "3", recipes: [
//            Recipe(id: "C1_R1", name: "Сосиски",
//                   image: "https://cdn.shortpixel.ai/spai/w_1290+q_lossless+ret_img/https://www.kindlyunspoken.com/wp-content/uploads/2020/07/Easy-Pepperoni-Pizza-Lasagna-Roll-Ups-13-scaled.jpg",
//                   images: [
//                   ],
//                   rating: "4",
//                   time: "10 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
//                   ingredients: [
//                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
//                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
//                   ],
//                   tegs: ["легко", "100-200 ккал"],
//                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
//                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
//                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
//                           "Варить сосиски 2 минуты"
//                   ]),
//            Recipe(id: "C1_R2", name: "Удон с курицей и овощами",
//                   image: "https://whiskitrealgud.com/wp-content/uploads/2018/02/sweet-chili-chicken-14.jpg",
//                   images: [
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
//                   ],
//                   rating: "4",
//                   time: "25 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
//                   ingredients: [
//                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                   ],
//                   tegs: ["средне", "100-200 ккал"],
//                   steps: [
//                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
//                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
//                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
//                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
//                   ]
//            ),
//            Recipe(id: "C1_R3", name: "Сосиски",
//                   image: "https://whiskitrealgud.com/wp-content/uploads/2018/02/sweet-chili-chicken.jpg",
//                   images: [
//                   ],
//                   rating: "4",
//                   time: "10 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
//                   ingredients: [
//                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
//                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
//                   ],
//                   tegs: ["легко", "100-200 ккал"],
//                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
//                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
//                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
//                           "Варить сосиски 2 минуты"
//                   ]),
//            Recipe(id: "C1_R4", name: "Удон с курицей и овощами",
//                   image: "https://i.pinimg.com/originals/f1/e0/07/f1e0078213ebda7540b847f591276bf1.jpg",
//                   images: [
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
//                   ],
//                   rating: "4",
//                   time: "25 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
//                   ingredients: [
//                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                   ],
//                   tegs: ["средне", "100-200 ккал"],
//                   steps: [
//                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
//                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
//                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
//                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
//                   ]
//            ),
//            Recipe(id: "C1_R5", name: "Сосиски",
//                   image: "https://i.pinimg.com/564x/3c/52/97/3c52972c228fab19658a3ebea487f9a3.jpg",
//                   images: [
//                   ],
//                   rating: "4",
//                   time: "10 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
//                   ingredients: [
//                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
//                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
//                   ],
//                   tegs: ["легко", "100-200 ккал"],
//                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
//                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
//                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
//                           "Варить сосиски 2 минуты"
//                   ]),
//            Recipe(id: "C1_R6", name: "Удон с курицей и овощами",
//                   image: "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg",
//                   images: [
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
//                   ],
//                   rating: "4",
//                   time: "25 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
//                   ingredients: [
//                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                   ],
//                   tegs: ["средне", "100-200 ккал"],
//                   steps: [
//                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
//                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
//                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
//                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
//                   ]
//            ),
//            Recipe(id: "C1_R7", name: "Сосиски",
//                   image: "https://culinarya.ru/wp-content/uploads/2020/06/kak-otvarit-sosiski-v-vode-1.jpg",
//                   images: [
//                   ],
//                   rating: "4",
//                   time: "10 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "220", proteins: "9.5", fats: "20.0", carbohydrates: "0.5",
//                   ingredients: [
//                    Ingredient(id: "C1_R1_IN1", ingradientName: "Вода", weightPerPortion: "400", nameForWeight: "мл", secondId: "C1_R1_N"),
//                    Ingredient(id: "C1_R1_IN2", ingradientName: "Сосиски", weightPerPortion: "2", nameForWeight: "штуки", secondId: "C1_R1_N"),
//                   ],
//                   tegs: ["легко", "100-200 ккал"],
//                   steps: ["Снять полиэтиленовую пленку с сосисок, надрезав ее с одного конца и потянув вокруг сосиски по спирали. Натуральную оболочку не снимать",
//                           "Влить 400 миллилитров холодной воды в неглубокую кастрюлю, поместить ее на конфорку на сильный огонь, дать закипеть",
//                           "Положить в кипящую воду сосиски, поменять огонь на тихий, закрыть кастрюлю крышкой",
//                           "Варить сосиски 2 минуты"
//                   ]),
//            Recipe(id: "C1_R8", name: "Удон с курицей и овощами",
//                   image: "https://asimplepalate.com/wp-content/uploads/2019/02/Chicken-Teriyaki-2.jpg",
//                   images: [
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_1_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_9_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_10_max.jpg",
//                    "https://static.1000.menu/img/content/37261/klassicheskii-udon-s-kuricei-i-ovoshchami_1564406104_11_max.jpg"
//                   ],
//                   rating: "4",
//                   time: "25 мин",
//                   complexity: "легко",
//                   cost: "$",
//                   kcal: "570", proteins: "44.2", fats: "2.8", carbohydrates: "90.8",
//                   ingredients: [
//                    Ingredient(id: "C1_R2_IN1", ingradientName: "Лапша удон", weightPerPortion: "100", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN2", ingradientName: "Морковь", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN3", ingradientName: "Куриное филе", weightPerPortion: "125", nameForWeight: "г", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN4", ingradientName: "Красный перец", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN5", ingradientName: "Репчатый лук", weightPerPortion: "0.5", nameForWeight: "шт", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN6", ingradientName: "Чеснок", weightPerPortion: "0.5", nameForWeight: "зубчика", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN7", ingradientName: "Зеленый лук", weightPerPortion: "1", nameForWeight: "штука", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN8", ingradientName: "Соевый соус", weightPerPortion: "1", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                    Ingredient(id: "C1_R2_IN9", ingradientName: "Молотый имбирь", weightPerPortion: "0.5", nameForWeight: "ч.л.", secondId: "C1_R2_N"),
//                   ],
//                   tegs: ["средне", "100-200 ккал"],
//                   steps: [
//                    "Овощи очистить и вымыть. Морковь нарезать полосками толщиной 2-3 мм и длиной 3-5 см. Сладкий перец мелко нарезать, а курятину нарезать кубиками со стороной 1 см. Очищенный лук измельчить, а чеснок растолочь",
//                    "В большую кастрюлю с разогретым растительным маслом всыпать лук и чеснок и, помешивая, обжарить до золотистого оттенка. Затем добавить остальные овощи, измельченный зеленый лук и курятину и, помешивая, поджаривать, пока мясо не начнет подрумяниваться",
//                    "После этого добавить соевый соус и имбирь, перемешать, влить 3/4 стакана воды, накрыть крышкой и, периодически помешивая, тушить, пока овощи не станут мягкими, а соус не загустеет. В конце посолить",
//                    "Лапшу всыпать в подсоленную кипящую воду, поварить 2-3 минуты, откинуть на дуршлаг, промыть и дать стечь. После этого лапшу переложить в кастрюлю с овощами и мясом, хорошо перемешать и потушить на слабом огне еще 3-4 минуты. Подавать немедленно"
//                   ]
//            ),
//        ], image: "https://image.flaticon.com/icons/png/128/837/837560.png", name: "Вкусные блюда"),
        Category(id: "2", recipes: [
            Recipe(id: "C2_R1", name: "Ростбиф",
                   image: "https://up.tsargrad.tv/uploads/IS/071218/10kuj.jpg",
                   images: [
                    "https://volshebnaya-eda.ru/wp-content/uploads/2018/03/rostbif-iz-govyadiny-1.jpg",
                    "https://volshebnaya-eda.ru/wp-content/uploads/2018/03/rostbif-iz-govyadiny-2.jpg",
                    "https://volshebnaya-eda.ru/wp-content/uploads/2018/03/rostbif-iz-govyadiny-3.jpg",
                    "https://volshebnaya-eda.ru/wp-content/uploads/2018/03/rostbif-iz-govyadiny-4.jpg",
                    "https://volshebnaya-eda.ru/wp-content/uploads/2018/03/rostbif-iz-govyadiny-5.jpg",
                    "https://volshebnaya-eda.ru/wp-content/uploads/2018/03/rostbif-iz-govyadiny-6.jpg",
                   ],
                   rating: "5",
                   time: "30",
                   complexity: "сложно",
                   cost: "$$",
                   kcal: "175", proteins: "81.2", fats: "6.8", carbohydrates: "11.4",
                   ingredients: [
                    Ingredient(id: "C2_R1_IN1", ingradientName: "Говядина", weightPerPortion: "250", nameForWeight: "грамм", secondId: "C2_R1_N"),
                    Ingredient(id: "C2_R1_IN2", ingradientName: "Размарин", weightPerPortion: "15", nameForWeight: "грамм", secondId: "C2_R1_N"),
                    Ingredient(id: "C2_R1_IN3", ingradientName: "Соль", weightPerPortion: "3", nameForWeight: "щепотки", secondId: "C2_R1_N"),
                   ],
                   tegs: ["средне", "200-300 ккал"],
                   steps: [
                    "Мясо промываем в холодной воде и тщательно обсушиваем бумажными полотенцами. Обсыпаем смесью перцев, вдавливая их руками — желательно использовать перец крупного помола, свежемолотый",
                    "Смазываем со всех сторон растительным маслом, заворачиваем в пищевую пленку и делаем проколы в пленке зубочисткой. Если мясо у вас не парное(мясо только что убитого животного), а уже выдержанное, то достаточно промариновать его в перце 8-10 часов. Обратите внимание, что соль добавлять не нужно",
                    "Перед тем, как продолжить приготовление, мясо следует вынуть из холодильника и оставить на 1 час, чтобы прогрелось до комнатной температуры. Если этот шаг пропустить, то оно будет готовиться неравномерно, в итоге вы получите сырую середину и пересушенный край. Кусок обвязываем ниткой, чтобы он приобрел овальную форму — так его будет удобнее нарезать после запекания",
                    "Приступаем к обжарке. Ставим на огонь сковородку гриль, смазываем ее небольшим количеством растительного масла и прогреваем докрасна. На раскаленную сковороду выкладываем мясо и обжариваем до появления золотистой корочки — по 3 минуты со всех сторон. Таким образом мы «запечатаем» внутри куска все соки, они не будут вытекать наружу при запекании. Нельзя двигать мясо по всей сковороде, иначе волокна будут рваться и вытечет ценный сок. По этой же причине переворачивать его следует щипцами (или парой деревянных лопаток)",
                    "Отправляем говядину в духовку, предварительно разогретую до 160 градусов. У моей сковороды-гриль отстегивается ручка. Если у вас такой посуды нет, то переложите кусок на теплый противень (с высокими бортами). Готовность удобнее всего определять с помощью термометра. Я запекала ростбиф в духовке 30 минут, затем измерила температуру — она достигла 60 градусов. Если любите более сильную степень прожарки, то готовьте до 75-80 градусов. Чтобы определить степень готовности мяса без градусника, проколите его острым ножом :если на месте прокола выделяется бледно-розовый сок, то оно готово; ярко-красный цвет значит, что нужно еще подержать в духовке минимум 15 минут; светлый и прозрачный сок свидетельствует о том, что мясо пересушено",
                    "Готовое мясо перекладываем на деревянную доску или теплую тарелку. Заворачиваем в несколько слоев фольги. И оставляем «для отдыха» на 30-40 минут. Все это время мясо будет доготавливаться, внутри куска равномерно распределится мясной сок",
                   ]
            ),
        ], image: "https://image.flaticon.com/icons/png/128/3480/3480559.png", name: "Итальянская кухня"),
    ]
}
