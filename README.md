# finaljsonparsing

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Json data parsing with the help of Json_free_Testing API in our flutter app.

Detailed overview : 

1) First i made a new project in Visual studio code which name i set finaljsonparsing and after making the project i deleted my whole boiler codes.
2) Then I added http dependencies in my project for making http requests in my app.

Http => This package makes http requests for your application.

3) After doing all basic works i configured my main.dart file like this : 

void main() => runApp(MaterialApp(
     home: HomePage(),
   ));

4) Then i created a model folder for making my API data model, i used https://jsonplaceholder.typicode.com/users this api shows the user and users information. In model class I made a user.dart file and converted Json data into Dart data, for converting Json data into dart data I used https://app.quicktype.io/ this website.

5) After that I made a Services folder for making my http request and parsing json data in my app. In Services folder i made services.dart file which code is i am gonna explain : 

import '../model/users.dart';
import 'package:http/http.dart' as http;
 
class Services {
 static const String url = "https://jsonplaceholder.typicode.com/users";
 
 static Future<List<User>> getUsers() async {
   try {
     final response = await http.get(url);
     if (200 == response.statusCode) {
       final List<User> users = usersFromJson(response.body);
       return users;
     } else if (400 == response.statusCode) {
       print("Bad request");
     } else {
       return List<User>();
     }
   } catch (e) {
     return List<User>();
   }
 }
}

In this code as you can see first I imported users.dart because user.dart is our main model which we are gonna use in this file for parsing json data. Then i imported http.dart as a http because i don't want to write full http.dart syntax, by using “as http” i can use this http.dart by only typing http, and these http.dart coming from my dependencies file which i entered first on my project.

After importing packages i made Services class which is gonna handle my whole work, in services class first i made a constant url variable for using my whole URL Link by typing just url.

Then I made an async method for getting my data. In flutter when we use async then we don't know how much time our task takes to get the data so we use Future. Future allows us to run our synchronised tasks freely.
After adding Future i have added List of users because i want to get my user data into a List view.

Then I made a try and catch method because when there are any exception returns then we want to return just an empty list of users as you can see in my code how i used the catch method.

In my try method i made a response variable for getting response from the url, which uses the await function for getting response from url. Await function blocks the execution of code when async is doing its work. Then I used if else statement for getting our main result. I set 200 == response.statuscode in this statement I made a user variable which shows the response which we got from our Json data.

Then I add some else if and else statements.

6) After solving this big problem i can make my UI peacefully so im gonna making my ui. first i made ui folder and in that folder i made homescreen.dart file, in homescreen.dart file i made stateless widget for making my button which gonna show us our Json data response,
So I made this button like this.

child: RaisedButton(
           onPressed: () {
             Navigator.of(context)
                 .push(MaterialPageRoute(builder: (context) => jsonparsing()));
           },
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(80.0),
           ),
           padding: EdgeInsets.all(0.0),
           child: Ink(
             decoration: BoxDecoration(
               gradient: LinearGradient(
                   colors: [(Color(0xff374ABE)), (Color(0xff64B6FF))],
                   begin: Alignment.centerLeft,
                   end: Alignment.centerRight),
               borderRadius: BorderRadius.circular(30.0),
             ),
             child: Container(
               constraints: BoxConstraints(maxWidth: 300.0, minHeight: 500.0),
               alignment: Alignment.center,
               child: Text(
                 "See Your Data",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Colors.white,
                 ),
               ),
             ),
           ),
         ),

I know this button widget code is too much but this time i want to try something new because flutter offers us many types of widget for doing one work and at this time i used RisedButton widget which makes amazing buttons for our app. This code is too big but you can understand this code by just reading his syntax, so i am not gonna tell you about this code in detail.

But there is one thing that is very important which I used in my RaisedButton widget which is onPressed action. In onPressed action I am using the Navigator class for navigating this button to another page when users press this button. In flutter everywhere we use material widget and the onPressed button is navigating to jsonparsing page which is made by statefullwidget syntax so we have to use MaterialPageRout for switching to material page.

7) Then in the UI folder i made my second file which is gonna our screen which shows the user details in list view on screen, and i set this file name as jsonparse.dart.

8) In jsonparse.dart file i made statefulwidget then i made appBar which is very common after that i made ListView widget which shows us users details in list : 

body: Container(
       color: Colors.white,
       child: ListView.builder(
         itemCount: null == _users ? 0 : _users.length,
         itemBuilder: (context, index) {
           User user = _users[index];
           return ListTile(
             title: Text(user.name),
             subtitle: Text(user.email),
           );
         },
       ),
     ),

In this code i used a container which covers some space which we want to get in our screen but in this container i didn't set any parameters so its taking full screen space. Then, in my container widget I made a ListView widget which shows our user in list view on screen. So first i set item length then i returned Lists in tile view, tile view makes the margin and lines between two lists, and in tile view i add title which shows users name and then i add subtitle which shows users email.

API Link : https://jsonplaceholder.typicode.com/users
My Project on Github : https://github.com/Rootom360/Json-Data-Parsing 
