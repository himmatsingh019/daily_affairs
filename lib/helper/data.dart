import 'package:flutter_news/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List.empty(growable: true);

  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = 'Business';
  categoryModel.imgURL =
      "https://image.freepik.com/free-photo/businessman-pointing-arrow-graph-corporate-future-growth-plan-increase-percentage_20693-179.jpg";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Sports';
  categoryModel.imgURL =
      "https://www.skymetweather.com/content/wp-content/uploads/2021/03/How-to-play-sports-betting-online.jpg";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imgURL =
      "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202012/Netflix-New-Feature-Audio-Only_1200x768.jpeg?9TmAZq3wvsTH1jXQNlPkiSKJprCtGBAx&size=770:433";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Health';
  categoryModel.imgURL =
      "http://clipart-library.com/images_k/health-clipart-transparent/health-clipart-transparent-1.png";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = 'Science';
  categoryModel.imgURL =
      "https://clipartix.com/wp-content/uploads/2016/04/Science-clip-art-molecules.png";
  category.add(categoryModel);
  return category;
}
