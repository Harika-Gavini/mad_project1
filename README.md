#**Recipe Nest**:

Recipe Nest is a mobile application built with Flutter, designed to streamline meal planning, recipe browsing, and grocery list management. It provides a clean, user-friendly interface that helps users manage their food-related activities efficiently. The app allows users to plan weekly meals, create a customized grocery list, and view personalized meal suggestions based on their dietary preferences. Recipe Nest is a comprehensive tool for anyone looking to organize their meal planning in one accessible place.

---
## Presentation
For a detailed overview, check out the [![Recipe Nest Presentation]([https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2006.50.32.jpeg)](https://github.com/Harika-Gavini/mad_project1/blob/main/your_ppt_file.pptx](https://github.com/Harika-Gavini/mad_project1/blob/9d1fbfd4594e5fb6ad580388734fab4d0e66d472/RECIPE_NEST_finalppt*.pptx))

----

##**Features**:

- **Meal Planning**: Easily plan meals for each day of the week and customize selections based on available recipes.
- **Recipe Browsing**: Browse through a variety of categorized recipes, filtered by dietary preferences (Vegetarian, Non-Vegetarian, etc.).
- **Grocery List Management**: Add, view, and delete items from a grocery list tailored to your meal plans.
- **User Profile Management**: Customize your profile for a more personalized experience.

  ---

## **Technologies Used**

- **Flutter:** A cross-platform framework that allows Recipe Nest to be developed for both iOS and Android from a single codebase.
- **Dart**: The programming language behind Flutter, used for building the app's interface and managing its functionalities.
- **Material Design**: Ensures a consistent and user-friendly UI/UX experience.

---

##**Application Flow**

### **Authentication:**
- **Login and Sign-Up pages** enable users to access and create accounts securely.

### **Home Page:**

- Serves as the main navigation hub, where users can access **Today’s Meal Plan**, **Recipe List**, **Meal Planning**, and **Grocery List** tabs.
- A **Bottom Navigation Bar** is used for seamless navigation across these screens.

### **Profile Page**
Profile Page:
- Users can view and update their profile details, further customizing their experience.

  ---
  
## **Detailed Features**

1. **Home Page Navigation**
- Utilizes a Bottom Navigation Bar to access the app's main features, with a profile icon to access the Profile Page.
  
2.  **Meal Planning**
- Allows users to select meals for each day of the week.
- Stores selections in a Map for each day, which displays meal choices in a ListView.
- Meal selection is handled using a SimpleDialog that provides a list of meals to choose from.
  
3. **Grocery List Management**
- Users can add items to a grocery list using a TextField.
- Grocery items are displayed in a ListView with options to delete specific items.
- State management is used to update the list in real time.
  
4. **Recipe Filtering by Dietary Preference**
- Users can filter recipes based on dietary needs, such as Vegetarian or Non-Vegetarian.
- The selected dietary option filters the recipe list, showing only relevant results.

  ---
  
## **App Architecture**

Recipe Nest is structured with scalability in mind:

- **UI Layer**: Built with Flutter widgets like Scaffold, AppBar, ListView, and BottomNavigationBar.
- **Business Logic**: Managed through stateful widgets and setState().
- **Data Layer:** Stores data locally for the meal plan and grocery list. Future updates may include database integration.

---

# *USE CASE DIAGRAM:* 
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2006.50.32.jpeg)

---

## **Technologies Used**

- Flutter: A cross-platform framework that allows Recipe Nest to be developed for both iOS and Android from a single codebase.

- Dart: The programming language behind Flutter, used for building the app's interface and managing its functionalities.

- Material Design: Ensures a consistent and user-friendly UI/UX experience.

  ---
  

## *Recipe_Nest App Overview Screenshots:*

![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.48.jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.49%20(1).jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.49.jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.50%20(1).jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.50.jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.51%20(1).jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.51.jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.52%20(1).jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.52.jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.53%20(1).jpeg)
![image alt](https://github.com/Harika-Gavini/mad_project1/blob/7e01bbf8b385cf6be474afdda481d5f5cf6b9d00/WhatsApp%20Image%202024-10-27%20at%2008.24.53.jpeg)

----

## **Potential Enhancements**

In future versions, Recipe Nest could include:

- **API Integration**: Fetch real-time recipes and grocery lists from online sources.
- **Persistent Data Storage**: Using SQLite or Firebase for data that persists across sessions.
- **Notifications**: Reminders for meal planning and grocery shopping.
- **Advanced Filtering**: More dietary options and other filtering features to further personalize user experience.

---

## **Conclusion**

Recipe Nest is a robust and user-friendly mobile application designed to simplify meal planning and grocery list management. With a clear UI and intuitive features, it provides a strong foundation for further development, enabling users to keep their food-related activities organized and stress-free. The app highlights Flutter’s potential to create seamless, cross-platform applications and offers room for future growth with personalized meal recommendations, API integrations, and more.Recipe Nest

Recipe Nest is a mobile application built with Flutter, designed to streamline meal planning, recipe browsing, and grocery list management. It provides a clean, user-friendly interface that helps users manage their food-related activities efficiently. The app allows users to plan weekly meals, create a customized grocery list, and view personalized meal suggestions based on their dietary preferences. Recipe Nest is a comprehensive tool for anyone looking to organize their meal planning in one accessible place.

---



