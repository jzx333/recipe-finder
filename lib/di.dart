import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:recipe_finder_demo/core/data/data_source/recipe_data_source.dart';
import 'package:recipe_finder_demo/core/data/repositories/recipe_repository_impl.dart';
import 'package:recipe_finder_demo/core/domain/repositories/recipe_repository.dart';

final getIt = GetIt.instance;

void setupDI() {
  final client = Client();

  // data sources
  getIt.registerSingleton<RecipeDataSource>(
    RecipeDataSourceImpl(client: client),
    dispose: (ds) {
      ds.dispose();
    }
  );

  // repositories
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(recipeDataSource: getIt<RecipeDataSource>()),
    dispose: (rep) {
      rep.dispose();
    }
  );
}
