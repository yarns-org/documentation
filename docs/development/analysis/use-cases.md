<!-- markdownlint-disable MD028 MD033 -->
# Use Cases

- [Back to README](../../../README.md)
- [Back to documentation index](../../index.md)

---

This page documents all relevant use cases of YarnsApp.

## Table of Contents

- [Use Cases](#use-cases)
  - [Table of Contents](#table-of-contents)
  - [UC1 - Search for yarns](#uc1---search-for-yarns)
  - [UC2 - List yarns](#uc2---list-yarns)
  - [UC3 - View yarn information](#uc3---view-yarn-information)
  - [UC4 - Rate yarns](#uc4---rate-yarns)
  - [UC5 - Create lists](#uc5---create-lists)
  - [UC6 - Delete lists](#uc6---delete-lists)
  - [UC7 - Edit lists](#uc7---edit-lists)
  - [UC8 - Browse lists](#uc8---browse-lists)
  - [UC9 - View interesting rating statistics](#uc9---view-interesting-rating-statistics)
  - [UC10 - Discover new yarns](#uc10---discover-new-yarns)
  - [UC11 - See the probability of liking a yarn based on ratings](#uc11---see-the-probability-of-liking-a-yarn-based-on-ratings)
  - [UC12 - Share personal lists with other users](#uc12---share-personal-lists-with-other-users)
  - [UC13 - Select a yarn to consume collectively](#uc13---select-a-yarn-to-consume-collectively)
  - [UC14 - Export lists](#uc14---export-lists)
  - [UC15 - Backup personal data](#uc15---backup-personal-data)
  - [UC16 - Restore personal data](#uc16---restore-personal-data)
  - [UC17 - Delete all personal data from remote instance](#uc17---delete-all-personal-data-from-remote-instance)
  - [UC18 - Configure the app](#uc18---configure-the-app)
  - [UC19 - Configure YarnsDB source](#uc19---configure-yarnsdb-source)
  - [UC20 - Update YarnsDB](#uc20---update-yarnsdb)
  - [UC21 - Add custom Yarns](#uc21---add-custom-yarns)
  - [UC22 - Configure UserDB instance](#uc22---configure-userdb-instance)
  - [UC23 - Register into a UserDB instance](#uc23---register-into-a-userdb-instance)
  - [UC24 - Delete account from a UserDB instance](#uc24---delete-account-from-a-userdb-instance)
  - [UC25 - Reset application](#uc25---reset-application)
  - [UC26 - View what this app is about](#uc26---view-what-this-app-is-about)

## UC1 - Search for yarns

**Description**: As a user, I want to search for yarns.

**Primary Actor**: PWA User

**Preconditions**:

- Local YarnsDB has content available
- The yarn type has been set in the context of the current session

**Postconditions**:

- A list of yarns is presented ([UC2 - List yarns](#uc2---list-yarns))

**Triggers**:

- The user selects the search functionality

**Basic flow**:

1. The application displays relevant search fields
2. The user applies the desired search filters
3. The application displays a list of yarns based on the filters selected ([UC2 - List yarns](#uc2---list-yarns))

**Extensions**:

1-2.

> a. Show intermediate results when searching by title
>
>> 1. The user starts typing a title
>> 2. The application shows intermediate results

## UC2 - List yarns

**Description**: As a user, I want to visualize a list of yarns.

**Primary Actor**: PWA User

**Preconditions**:

- Local YarnsDB has content available

**Postconditions**:

- A list of yarns is presented to the user

**Triggers**:

- The user uses the search functionality
- The user clicks on a list item

**Basic flow**:

1. The application displays a list of yarns

**Notes**:

- The user is able to identify yarns already rated
- The user is able to identify yarns included in personal lists
- The user is able to search within the current list ([UC1 - Search for yarns](#uc1---search-for-yarns))

## UC3 - View yarn information

**Description**: As a user, I want to visualize descriptive information regarding a specific yarn.

**Primary Actor**: PWA User

**Preconditions**:

- A yarn item is selected

**Postconditions**:

- Success cases:
  - The yarn selected is in YarnsDB - relevant information regarding the yarn is presented to the user
- Failure cases:
  - The yarn selected cannot be found in YarnsDB - a message notifies the user of this fact

**Triggers**:

- The user clicks on a yarn item

**Basic flow**:

1. The application displays information on the yarn selected by the user

## UC4 - Rate yarns

**Description**: As a user, I want to rate yarns.

**Primary Actor**: PWA User

**Preconditions**:

- Local YarnsDB has content available
- Local UserDB has been properly initiated

**Postconditions**:

- The yarn rating is created, updated, or removed in local UserDB

**Triggers**:

- The user clicks on the button to rate the yarn

**Basic flow**:

1. The application displays a star-classification system
2. The user selects the desired rating and clicks save
3. The application saves the rating

**Extensions**:

1-2.

> a. Edit current rating
>
>> 1. The application displays the current rating of the yarn
>> 2. The user selects the desired rating and clicks save

> b. Discard current rating
>
>> 1. The application displays the current rating of the yarn
>> 2. The user discards that rating

2-3.

> a. Display similar ratings
>
>> 1. The application displays a list of the user's similar ratings
>> 2. The user is able to navigate the list and filter results

## UC5 - Create lists

**Description**: As a user, I want to create lists of yarns.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated

**Postconditions**:

- A new yarn list is created

**Triggers**:

- The user clicks on the button to create a new list

**Basic flow**:

1. The application displays the elements to create a new list
2. The user inserts the information and clicks save
3. The application creates the new list

## UC6 - Delete lists

**Description**: As a user, I want to delete personal lists.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated

**Postconditions**:

- The list is deleted from UserDB

**Triggers**:

- The user clicks on the button to delete the list

**Basic flow**:

1. The application asks for user confirmation
2. The user confirms
3. The application deletes the list

**Extensions**:

1-2.

> a. The list is public
>
>> 1. The application warns the user that the list being deleted is public

## UC7 - Edit lists

**Description**: As a user, I want to edit rating and other lists.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated

**Postconditions**:

- The list is properly updated in UserDB

**Triggers**:

- The user clicks on the button to edit a list

**Basic flow**:

1. The application displays the elements to edit the list (e.g., remove item, change position index, make it public)
2. The user edits the list and clicks on the save button
3. The application saves the changes

**Extensions**:

1-2.

> a. Make a list public
>
>> 1. The application warns the user that the current list will be made public and anyone will be able to see it
>> 2. The user confirms/denies changes

## UC8 - Browse lists

**Description**: As a user, I want to browse rating, personal, and public lists.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated
- Local YarnsDB has content available

**Postconditions**:

- A menu in the current user's context that displays personal lists is presented
- A menu in the public section of the app that displays public lists is presented

**Triggers**:

- NA

**Basic flow**:

1. The user opens the application
2. The application shows two menus: personal and public lists
3. The user selects one of them
4. The application displays the associated lists

## UC9 - View interesting rating statistics

**Description**: As a user, I want to view interesting rating statistics.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated

**Postconditions**:

- Interesting rating statistics are displayed for the ratings list

**Triggers**:

- The user clicks the button to display rating statistics

**Basic flow**:

1. The user opens a ratings list
2. The application displays a button to view statistics
3. The user clicks on the button
4. The application displays statistics by divided by menus

## UC10 - Discover new yarns

**Description**: As a user, I want to discover new yarns.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated
- Local YarnsDB has content available

**Postconditions**:

- Interesting yarns are shown

**Triggers**:

- The user clicks on the menu to discover new yarns on main menu of the application
- The user clicks on the button to discover new yarns inside a list

**Basic flow**:

1. The application asks how the user wants to discover new yarns
2. The user selects an option
3. The application computes and shows yarns that are relevant

**Extensions**:

2-3.

> a. Create a temporary list
>
>> 1. The user selects the option to create a temporary list
>> 2. The application displays a menu to create a temporary list using rating, personal, and public lists
>> 3. The user creates a list
>> 4. The application shows yarns related to the list created

## UC11 - See the probability of liking a yarn based on ratings

**Description**: As a user, I want to see the probability of liking a yarn.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated

**Postconditions**:

- The probability of liking a yarn is displayed

**Triggers**:

- The user starts viewing yarns information

**Basic flow**:

1. The user selects a yarn to view its information or the user is viewing a list
2. The probability of liking the current yarn is displayed if it has not been rated yet

## UC12 - Share personal lists with other users

**Description**: As a user, I want to share personal lists with other users.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated
- An online UserDB is set up

**Postconditions**:

- Secondary actors are able to view lists shared by a user

**Triggers**:

- The primary user selects the share functionality of a list

**Basic flow**:

1. The application shows a list of usernames in the current instance
2. The user selects the users
3. The application asks for a password
4. The user decides if the password is required or not, and types it if it is
5. The application confirms the action and shares the list with the users selected

## UC13 - Select a yarn to consume collectively

**Description**: As a user, I want to select a yarn to consume along with other users.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated
- An online UserDB is set up

**Postconditions**:

- All users are presented with a list of yarns

**Triggers**:

- The primary user selects the consume together functionality

**Basic flow**:

1. The triggering user clicks on the button to select a yarn to consume together
2. The application displays a prompt for the primary user to select other users to proceed with the selection
3. The triggering user selects other users
4. The application displays filtering options for the yarns
5. The triggering user selects the filtering options
6. The application generates a list of yarns based on the criteria selected
7. The application sends this information to other users
8. All users proceed accepting or denying each and every yarn
9. The application display the final results

## UC14 - Export lists

**Description**: As a user, I want to export lists into a file.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- A file is created for each list

**Triggers**:

- The user clicks on the button to export a list
- The user clicks on the button to export all lists

**Basic flow**:

1. The application asks the user where to save the file
2. The user inserts the location
3. The application exports the list into a file

## UC15 - Backup personal data

**Description**: As a user, I want to backup all personal data.

**Primary Actor**: PWA User

**Preconditions**:

- Local UserDB has been properly initiated

**Postconditions**:

- Personal data is exported into a local file

**Triggers**:

- The user clicks on the button to export personal data

**Basic flow**:

1. The application asks the user where to save the file
2. The user inserts the location
3. The application exports the user's personal data into a file

## UC16 - Restore personal data

**Description**: As a user, I want to restore all personal data.

**Primary Actor**: PWA User

**Postconditions**:

- Personal data is properly restores

**Triggers**:

- The user clicks on the button to restore personal data

**Basic flow**:

1. The application asks the user where to backup file is
2. The user inserts the location
3. The application asks for confirmation
4. The user confirms
5. The application restores the user's personal data

## UC17 - Delete all personal data from remote instance

**Description**: As a user, I want to delete all my personal data from an instance.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- All personal data is removed from the instance selected

**Triggers**:

- The user clicks on the button to remove all personal data

**Basic flow**:

1. The application asks for the user to refer which instance to delete data from
2. The user inserts the instance
3. The application asks for user authentication
4. The user inserts the credentials
5. The application checks the credentials  and asks for confirmation
6. The user confirms
7. The application deletes all user data from the instance selected

**Extensions**:

3-4.

> a. The instance specified is the current one
>
>> 1. The application detects that the instance specified is the current one and asks the user for confirmation
>> 2. The user confirms
>> 3. The application deletes all personal data from the instance and sets the value of the current instance to null

5-6.

> a. Invalid credentials
>
>> 1. The application detects that the credentials are invalid and requests for new ones
>> 2. The user insert the credentials

## UC18 - Configure the app

**Description**: As a user, I want to configure the application settings.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- The application has been properly configured

**Triggers**:

- The user opens the configuration menu

**Basic flow**:

1. The application display a buttons for the settings
2. The user clicks on the button
3. The application displays the settings
4. The user edits them and clicks save
5. The application saves the changes

## UC19 - Configure YarnsDB source

**Description**: As a user, I want to configure the source for the local YarnsDB.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- The source for the local YarnsDB is properly configured

**Triggers**:

- The user opens the application settings and selects the functionality to configure YarnsDB

**Basic flow**:

1. The application asks for the yarn type to configure
2. The user selects the types desired
3. The application asks if the user wants to use a remote YarnsDB instance or a local/remote JSON file
4. The user selects an option
5. The application asks for a path to the instance or file
6. The user inserts the path
7. The application verifies the information and replicates YarnsDB locally

**Notes**:

- The application keeps a history of YarnsDB sources

## UC20 - Update YarnsDB

**Description**: As a user, I want to update the local YarnsDB content.

**Primary Actor**: PWA User

**Preconditions**:

- YarnsDB has been properly set up

**Postconditions**:

- YarnsDB is up-to-date

**Triggers**:

- Automatic from time to time
- Manually by the user

**Basic flow**:

1. The application updates YarnsDB

**Notes**:

- The update of YarnsDB can be configured in the app settings

## UC21 - Add custom Yarns

**Description**: As a user, I want to add custom items to a YarnsDB list.

**Primary Actor**: PWA User

**Preconditions**:

- YarnsDB has been properly set up

**Triggers**:

- The user triggers the functionality to add a custom item to a yarn list.

**Basic flow**:

1. The application asks the yarn type to add
2. The user selects the desired type
3. The application displays the field for the local creation of a new yarn
4. The user provides the information
5. The application validates and inserts the yarn into the database

## UC22 - Configure UserDB instance

**Description**: As a user, I want to configure the UserDB instance.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- A UserDB instance is configured

**Triggers**:

- The user opens the settings to configure UserDB

**Basic flow**:

1. The application requests for user input on the instance URL to use
2. The user inserts the URL
3. The application validates and requests for the login credentials
4. The user inserts the credentials
5. The application validates the information and log the user in

**Extensions**:

3-4.

> a. The URL is invalid
>
>> 1. The application informs the user that the URL provided is not an instance of UserDB

5-.

> a. Invalid credentials
>
>> 1. The application informs the user that the credentials are invalid and requests again for user input
>> 2. The user inserts the credentials
>> 3. The application validates the information and log the user in

> b. No user account for the username provided
>
>> 1. The application informs the user that there is no user account for the username provided and that the user must first register ([UC23 - Register into a UserDB instance](#uc23---register-into-a-userdb-instance))

**Notes**:

- The application keeps a history of UserDB instances

## UC23 - Register into a UserDB instance

**Description**: As a user, I want to register into a UserDB instance.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- The user is registered into a UserDB instance

**Triggers**:

- The user clicks on the button to register into a UserDB instance

**Basic flow**:

1. The application requests for input on instance URL, username, and password
2. The user inserts the information
3. The application validates the information and asks the user if data is to be encrypted at rest
4. The user decides
5. The application registers the user into the instance

**Extensions**:

3-4.

> a. The URL is invalid
>
>> 1. The application informs the user that the URL provided is not an instance of UserDB

3-4.

> a. The username provided is already registered into the instance
>
>> 1. The application informs the user that the username is already registered into the instance provided

3-4.

> a. Insecure password
>
>> 1. The application informs the user that the password does not meet the minimum requirements

4-5.

> a. The user decides not to encrypt
>
>> 1. The application asks for confirmation, informing the user that anyone will be able to see personal data and that this should only be done in private/personal instances
>> 2. The user confirms
>> 3. The application asks for confirmation again to ensure that the user knows what he is doing
>> 4. The user confirms

## UC24 - Delete account from a UserDB instance

**Description**: As a user, I want to delete my account from a UserDB instance.

**Primary Actor**: PWA User

**Preconditions**:

- An account for the user exists in the UserDB instance

**Postconditions**:

- The user is deleted from the UserDB instance

**Triggers**:

- The user clicks on the button to delete account

**Basic flow**:

1. The application requests for the instance URL, username, and password
2. The user inserts the information
3. The application validates the information and asks for confirmation
4. The user confirms
5. The application triggers [UC17 - Delete all personal data from remote instance](#uc17---delete-all-personal-data-from-remote-instance) and then deletes the user account completely

**Extensions**:

3-4.

> a. The URL is invalid
>
>> 1. The application informs the user that the URL provided is not an instance of UserDB

3-4.

> a. The username provided is does not exist the instance
>
>> 1. The application informs the user that the username does not exist in the instance provided

3-4.

> a. Invalid password
>
>> 1. The application informs the user that the password is invalid

## UC25 - Reset application

**Description**: As a user, I want to reset the application to factory settings.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- The application is reset to factory settings

**Triggers**:

- The user clicks on the button to reset the application

**Basic flow**:

1. The application asks for confirmation
2. The user confirms
3. The application resets itself to factory settings and restarts

## UC26 - View what this app is about

**Description**: As a user, I want to know more about the application.

**Primary Actor**: PWA User

**Preconditions**:

- NA

**Postconditions**:

- The user is informed about the application

**Triggers**:

- The user clicks on the button to know more about the application

**Basic flow**:

1. The application displays relevant information

**Relevant information**:

- About
- FAQ
- How to use the app
- Documentation URL
- GitHub organization
- News
