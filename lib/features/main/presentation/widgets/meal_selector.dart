// import 'package:flutter/material.dart';
//
// // Enum для типов приемов пищи
// enum MealType { breakfast, lunch, dinner }
//
// class MealSelector extends StatefulWidget {
//   @override
//   _MealSelectorState createState() => _MealSelectorState();
// }
//
// class _MealSelectorState extends State<MealSelector> {
//
//   // Текущий выбранный тип
//   MealType selectedMeal = MealType.breakfast;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Row с кнопками выбора
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildMealButton('Завтрак', MealType.breakfast),
//             const SizedBox(width: 16),
//             _buildMealButton('Обед', MealType.lunch),
//             const SizedBox(width: 16),
//             _buildMealButton('Ужин', MealType.dinner),
//           ],
//         ),
//         const SizedBox(height: 20),
//         // Контейнер с контентом
//         _buildContent(),
//       ],
//     );
//   }
// }
//
// // Построение кнопки выбора
// Widget _buildMealButton(String title, MealType mealType) {
//   return InkWell(
//     onTap: () {
//       setState(() {
//         selectedMeal = mealType;
//       });
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: selectedMeal == mealType ? Colors.blue : Colors.grey[200],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: selectedMeal == mealType ? Colors.white : Colors.black,
//           fontWeight: selectedMeal == mealType ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     ),
//   );
// }
//
//
// Widget _buildContent() {
//   switch (selectedMeal) {
//     case MealType.breakfast:
//       return Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Text('Меню завтрака',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10,),
//             // Здесь ваш контент для завтрака
//             ListTile(
//               leading: Icon(Icons.breakfast_dining),
//               title: Text('Омлет'),
//               subtitle: Text('300 ккал'),
//             ),
//             // Добавьте другие элементы
//           ],
//         ),
//       );
//
//     case MealType.lunch:
//       return Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Text('Меню обеда',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10,),
//             // Здесь ваш контент для обеда
//             ListTile(
//               leading: Icon(Icons.soup_kitchen),
//               title: Text('Суп'),
//               subtitle: Text('1000 ккал'),
//             ),
//             // Добавьте другие элементы
//           ],
//         ),
//       );
//
//       // case MealType.dinner
//
//   }
//
//   // Функция для создания кнопок приема пищи.
//   Widget _buildMealButton(String meal) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedMeal = meal;
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//         decoration: BoxDecoration(
//           color: selectedMeal == meal ? Colors.blue : Colors.grey[300],
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Text(
//           meal,
//           style: TextStyle(
//             color: selectedMeal == meal ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }