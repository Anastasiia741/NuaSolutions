# HomeTaskNuaSolution 📲
## Key Features:
- The search engine screen allows the user to enter a keyword and get a list of recipes via an API request, while providing an intuitive user interface for easy interaction and understanding of the application's functionality.
- Unit tests to verify successful access to the database to search for recipes. They check that the fetchData(with:) method in the RecipeViewModel correctly sends a request to the API and processes the received data.
- UI tests to test user interaction with the interface. They check that after entering a search query and clicking the search button, the table with recipes is displayed and there are cells with recipes in it.
  
- **Instructions for use:**
![Alt Text](https://media.giphy.com/media/uNvpZ73FIqDMu4xk6n/giphy.gif)

![NziV6D](https://i.makeagif.com/media/4-01-2024/NziV6D.gif)

## Requirements
- **UIkit framework**
- **iOS Platform:** iOS 15.0 
- **Swift Version:** Swift 5.5
- **Xcode Version:** Xcode 13.0
- **Dependency Manager:** Swift Package Manager (SPM)

## Installation
**Instal project:** 
1. Clone the repository: https://github.com/Anastasiia741/NuaSolutions.git
2. Navigate to the project folder: cd NuaSolutions
3. Open the project in Xcode: open NuaSolutions.xcodeproj
4. Press `Cmd + R` to run the application

**Testing:**
1. Open your project in Xcode.
2. Go to the file with tests "NuaSolutionsTests.swift" in the project navigator
3. Click on the "Run" button or use the hotkeys Cmd + U
4. Xcode will launch application and automatically run tests from test class "NuaSolutionsTests"
5. Once the tests are completed, you will see the results in the Test Navigator window.

**Replace Application Keys:**
If necessary, accesses can be replaced with your own ones
1. Open the project in XCode or in the NuaSolutions folder
2. Find the `ApiConstants` file
3. In the `apiKey` and `appID` constant, replace the key with yours
4. A new key will apply in the `ApiRequest` file

## MVVM Architecture
This project adopts the Model-View-ViewModule architecture to application logic

