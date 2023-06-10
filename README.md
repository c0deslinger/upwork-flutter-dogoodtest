# Grocery App

A simple grocery app with Getx and Firestore

## Best Practices in this App

- Implement Getx state management: By implementing Getx state management, it becomes easy to change and manage the app's state using the GroceryController class.
- Multilanguage support: I have added multilanguage support to this app with English and Bahasa Indonesia languages.
  ![Example Image](https://img001.prntscr.com/file/img001/aYxZuVzCRM6jXzMs8U2klQ.png)
  ![Example Image](https://img001.prntscr.com/file/img001/ACH0mud5QFKbmLkZEc0cqw.png)
- MVC class implementation: By implementing the MVC (Model-View-Controller) pattern, we can separate the view for the user interface, the controller for handling the business logic, and the datasource for retrieving data from the repository. This allows for easier future changes to the database by simply modifying the datasource class.
- Light mode and dark mode support: The app supports both light mode and dark mode by separating the app themes. This enables easy switching between modes in the global controller for future implementation of light mode or dark mode.