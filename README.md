# weatherapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


#Architecture explained
There are four layers in this application 

UI---> pages and widgets
BLOC 
REPOSITORY
DATA PROVIDER


DATA PROVIDER fetches the data from db or using some api or somewhere.Data provider will give the raw data
Once the data comes, it is the responsibility of Repository to convert into a form that is usable in the application ie model

Now Bloc will handle the call backs on various events from UI
UI is binded to bloc bloc calls repository and repository sends the request to data provider which will send to the db

when data comes back this will generally be a json from db 
this will be send to the repo 
repos will convert this to a model and send to BLoc 
based on the data what actions needed to take is decided by bloc and give the data to UI