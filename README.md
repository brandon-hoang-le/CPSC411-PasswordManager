# CPSC411-PasswordManager

CPSC411 Final Project - Password Manager App


In my project proposal, the plan for the Password Manager application was to use iCloudKit implementation to store the account data entries but I realized it cost $100 annually to use it via Apple Developer Program. As a result, I am using SQLite local database as my data structure for the application.


Section 1: Functionalities
* The core feature of the application is to store account data entries (id, title, username, password) to a local SQLite database for the user.


* Several functionalities are separated in tabview:
   * First tab: list all account data from database.
   * Second tab: user can enter an account title, username, and password; there is also a button for generating a random password.
   * Third tab: user can delete an or multiple accounts by entering the according title name.


Section 2: Architecture & Design
* The application uses SQLite framework from https://github.com/stephencelis/SQLite.swift for storing data
* The application was created using Xcode version 12.4 and Swift/SwiftUI.
* The application’s code was separated in two files: UserData and ContentView. UserData has the SQLite database implementation and functionalities (list accounts, add accounts, delete accounts). ContentView contains the user interface, button configurations, and transfer data from UserData for the user.


Section 3: GitHub Location of Code
https://github.com/brandon-hoang-le/CPSC411-PasswordManager


Section 4: Test Results
* I tested the application with a new SQLite database and added two account, first where the password is added manually and the second where the password is randomly generated:
   * First account:
      * Title: Google.com
      * Username: Brandon123
      * Password: chonker28@?!
   * Second account:
      * Title: Facebook.com
      * Username: Brandon123
      * Password: b1S6GTLCqO
  

* The application properly lists all accounts from the SQLite database.
* I also tested deleting the first account by entering its title (Google.com) and it properly deletes the object in the SQLite database.
   * However, one scenario that may present as a problem is that having two accounts with the same title name will cause both of them to be deleted unfortunately. 
* Also, if the user enters empty account information, the SQLite database will store the entry anyway. However, this should not cause any problems other than taking up space in the database.


Section 5: Future Work
* The application can definitely be improved in all aspects.
* Things that I could work on in the future:
   * List account objects from SQLite database using NavigationView (SwiftUI)
   * Allow for user to delete account entry by swiping left on it 
   * Add application thumbnail and icons to tabs
   * Improve user interface design and customization



