# SolidMeal

SolidMeal is a mobile application designed to assist individuals with specific health conditions in finding suitable and healthy recipes. Leveraging the power of the K-nearest neighbours (KNN) algorithm, SolidMeal provides personalized recipe recommendations based on your health profile and dietary needs. Discover meals that not only taste good but also contribute positively to your health.

Beta Version of the app is available here: 
https://drive.google.com/file/d/1-FgI8AuEEWy6_BMb4mft2pkfyZa2Wc0T/view?usp=share_link

Website here:
https://solidmeal.vercel.app/

### IMPORTANT:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```
### ENVIRONMENT VARIABLES
The application uses environment variables for certain configurations. To set these:

Rename the .env.example file to .env.
Fill in the values for the variables in the .env file. The variables include:
API_KEY: Your API key for accessing the Spoonacular Recipe Food Nutrition API from Rapid-API.
Save the file.
Note: The .env file is included in the .gitignore to ensure sensitive data (like your API key) is not committed to version control. When cloning or forking this repository, ensure you set these variables in your own .env file.


# Sample Images of App

![first screen](https://github.com/Coder-Jon014/SolidMeal_App/assets/71227832/aac098ad-db40-4900-abbf-736b8826dea0)
![home](https://github.com/Coder-Jon014/SolidMeal_App/assets/71227832/89e3cb4f-f36a-43ae-b21b-edfc9b4ee9ae)
![MealType Screen](https://github.com/Coder-Jon014/SolidMeal_App/assets/71227832/35b7fd61-6e08-480f-bad2-55e448cff195)
![RecipeSimilarRecipesPage](https://github.com/Coder-Jon014/SolidMeal_App/assets/71227832/25be0893-1a71-4067-8fff-70d28013a021)
![RecipeInstructionsPage1](https://github.com/Coder-Jon014/SolidMeal_App/assets/71227832/8b08f584-98e0-40ab-8205-a1277678b9c7)
![RecipeCreateNote_ReviewPage](https://github.com/Coder-Jon014/SolidMeal_App/assets/71227832/c06ca21c-d1ac-40ca-a267-1d9272f187cf)



