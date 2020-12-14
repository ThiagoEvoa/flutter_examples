# MVVM Architecture

## Folder structure
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/mvvm__folder_structure.png" height="649" width="1000">
</p>

## View
### This layer will only have classes that are going to present the screen elements.
>  widget -> Responsible for having the customizable and reusable widgets.

>  screen -> Responsible for having screen code that is going to be in the widget tree.

## ViewModel
### This layer will only have classes that are going to represent the entities and busyness logic.
>  usecase -> Responsible for having busyness logic and make the communication  beteween View layer and Model layer, in order to update the Screens according the changes. 

## Model
### This layer will only have classes that are going to retrieve data from database, api's and etc.
>  dao -> Responsible for having the classes whitch contains access functions to the database.

>  entity ->  Responsiblel for having class that represents the objects from the database.

>  service -> Responsible for having the interfaces (abstract classes in Dart) whitch contains access functions to the api.

>  dto -> Responsiblel for having class that represents the objects from the api.
