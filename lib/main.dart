import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/repositories/recipe_repository.dart';
import 'package:recipe_finder_demo/di.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();

  // final rep = getIt<RecipeRepository>();
  //
  // final r = await rep.getTags();
  //
  // print(r.tags);
  //
  // final previews = await rep.getRecipePreviews();
  // print(previews);
  //
  // final details = await rep.getRecipeDetails();
  // print(details);

  runApp(const App());
}





