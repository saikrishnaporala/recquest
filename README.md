
# recquest_21

<div>
  <h1 align="center">Getting Started with Flutter 🚀 </h1>
  <strong>
    Generated with ❤️ from DhiWise
  </strong>
  <p>
    This is the documentation of Flutter Applications.
    It contains all the information you need to get started with
    and make changes to your App
  </p>
</div>


### Table of Contents
- [System Requirements](#system-requirements)
- [Figma design guidelines for better accuracy](#figma-design-guideline-for-better-accuracy)
- [App Navigations](#app-navigations)
- [Facebook Authentication Configuration](#facebook-authentication-configuration)
- [Google Authentication Configuration](#google-authentication-configuration)
- [Project Structure](#project-structure)
- [How you can do code formatting?](#how-you-can-do-code-formatting)
- [How you can improve the readability of code?](#how-you-can-improve-the-readability-of-code)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)

### System Requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Figma design guidelines for better accuracy

Read our guidelines to increase the accuracy of design conversion to code by optimizing Figma designs.
https://docs.dhiwise.com/docs/Designguidelines/intro

### App Navigations

Check your app's UI from the AppNavigation screen of your app.

### Facebook Authentication Configuration

Steps:
- Follow the steps on https://pub.dev/packages/flutter_login_facebook for Facebook login and only update app_id and client_token in your project.
- For Android:
    - Update facebook_app_id and facebook_client_token in /android/app/src/main/res/values/strings.xml  file.
- For iOS:
    - Configure Info.plist (ios/Runner/Info.plist) file and update APP_ID and CLIENT_TOKEN.

### Google Authentication Configuration

Steps:
- Follow the steps on https://pub.dev/packages/google_sign_in for Google sign-in.
- For iOS:
    - Download the GoogleService-Info.plist  file. Drag and drop the downloaded file into the Runner subfolder and update Info.plist  file.

### Project Structure

After successful build, your application structure should look like this:

```
.
├── android                         - contains files and folders required for running the application on an Android operating system.
├── assets                          - contains all images and fonts of your application.
├── ios                             - contains files required by the application to run the dart code on iOS platforms.
├── lib                             - Most important folder in the project, used to write most of the Dart code.
    ├── main.dart                   - starting point of the application
    ├── core
    │   ├── app_export.dart         - contains commonly used file imports 
    │   ├── constants               - contains all constants classes
    │   ├── errors                  - contains error handling classes                  
    │   ├── network                 - contains network related classes
    │   └── utils                   - contains common files and utilities of project
    ├── data
    │   ├── apiClient               - contains API calling methods 
    │   ├── models                  - contains request/response models 
    │   └── repository              - network repository
    ├── localization                - contains localization classes
    ├── presentation                - contains all screens and screen controllers
    │   └── screens                 - contains all screens
    ├── routes                      - contains all the routes of application
    └── theme                       - contains app theme and decoration classes
    └── widgets                     - contains all custom widget classes
```

### How you can do code formatting?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

### How you can improve the readability of code?

Resolve the errors and warnings that are shown in the application.

### Libraries and tools used

- get - State management
  https://pub.dev/packages/get
- connectivity_plus - For status of network connectivity
  https://pub.dev/packages/connectivity_plus
- shared_preferences - Provide persistent storage for simple data
  https://pub.dev/packages/shared_preferences
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image
    
### Support

If you have problems or questions go to our Discord channel, we will then try to help you as quickly as possible: https://discord.com/invite/rFMnCG5MZ7


> Task :url_launcher_android:signingReport
Variant: debugAndroidTest
Config: debug
Store: C:\Users\saikr\.android\debug.keystore
Alias: AndroidDebugKey
MD5: D5:AC:E5:F2:03:D5:3F:A8:E4:C4:CF:51:B3:EA:19:D9
SHA1: 0C:D4:4D:6F:D4:02:B0:F8:AD:78:CA:8A:F4:D9:E7:AE:A8:6F:38:7C
SHA-256: 52:96:AD:34:B9:56:61:70:42:C1:28:52:98:D2:38:A8:EC:B1:26:BE:C8:E0:D8:B7:D5:8F:64:D7:E1:54:61:0C
Valid until: Saturday, 14 December, 2052