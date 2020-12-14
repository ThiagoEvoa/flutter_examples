# Clean Architecture

## Folder structure
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/folder_structure.png" height="649" width="1000">
</p>

## Presentation
### This layer will only have classes that are going to present the screen elements.
>  widget -> Responsible for having the customizable and reusable widgets.

>  ui -> Responsible for having screen code that is going to be the widget tree.

>  presenter -> Responsible for having the state management classes who are going to  hold the UI data elements and make the communication with the usecase on the Domain layer.

## Domain
### This layer will only have classes that are going to represent the entities and busyness logic.
>  usecase -> Responsible for having busyness logic and make the communication with the repository implementation on the Data layer. 

>  repository -> Responsible for having the interfaces (abstract classes in Dart) that is going to be implemented by the repository on the Data layer.

>  entity -> Responsible for having the entities, and should be language agnostic.

## Data
### This layer will only have classes that are going to retrieve data from database, api's and etc.
>  repository -> Responsible for having the interfaces (abstract classes in Dart) implementations created in the repository on the Domain layer.

>  model -> Responsiblel for having datasource functions, for example: convert object to json and json to object. 

>  datasource ->  Responsible for retrieve the data from database, api's and etc.
