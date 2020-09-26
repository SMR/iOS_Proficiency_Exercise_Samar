# iOS_Proficiency_Exercise_Samar
## Requirements:
* iOS 11.0+
* Xcode 12.0
* Swift 5.3

## Objective:
This proof of concept app which consumes a REST service and displays photos with headings and descriptions to demonstrate some aspect of clean architecture using  MVVM pattern, loose coupling, **unit testing** and some of the best practices used in modern iOS programming using `Swift`.

## Specification:
* This project was intended as proof of concept app which consumes a REST service and displays photos with headings and descriptions. 
* The demo uses the [Feeds API](https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json) which returns information in a JSON format.
* Implemented Unit test for business logic.
* The feed contains a title and a list of rows.
* Restrict the image to go to outside of the device width if image is having a larger width then your device.
* Loads the images lazily and Don’t download them all at once, but only as needed.
* Refresh function
* Each image having title at the bottom of the image.
* Note - Should not block UI when loading the data from the json feed.


## Installation

- Xcode **11.0**(required)
- Clean `/DerivedData` folder if any

## 3rd Party Libraries
No Third Party Librariies used in the  Project 

## Technical notes:
- MVVM - My preferred architecture.
- MVVM stands for “Model View ViewModel”
- It’s a software architecture often used by Apple developers to replace MVC. Model-View-ViewModel (MVVM) is a structural design pattern that separates objects into three distinct groups:
- Models hold application data. They’re usually structs or simple classes.
- Views display visual elements and controls on the screen. They’re typically - subclasses of UIView.
- View models transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.

