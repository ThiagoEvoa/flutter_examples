# Clean Architecture

## Folder structure
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/folder_structure.png" height="649" width="800">
</p>

## Presentation
### This layer will only have classes that are going to present the screen elements.
>  widget -> Responsible for having the customizable and reusable widgets.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/widget.png" height="649" width="300">
</p>

>  ui -> Responsible for having screen code that is going to be the widget tree.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/ui.png" height="649" width="300">
</p>

>  presenter -> Responsible for having the state management classes who are going to  hold the UI data elements and make the communication with the usecase on the Domain layer.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/presenter.png" height="649" width="300">
</p>

## Domain
### This layer will only have classes that are going to represent the entities and busyness logic.
>  usecase -> Responsible for having busyness logic and make the communication with the repository implementation on the Data layer. 
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/usecase.png" height="649" width="300">
</p>

>  repository -> Responsible for having the interfaces (abstract classes in Dart) that is going to be implemented by the repository on the Data layer.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/repository_domain.png" height="649" width="300">
</p>

>  error -> Responsible for having the custom exceptions.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/error.png" height="649" width="300">
</p>

>  entity -> Responsible for having the entities.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/entity.png" height="649" width="300">
</p>

## Data
### This layer will only have classes that are going to retrieve data from database, api's and etc.
>  repository -> Responsible for having the interfaces (abstract classes in Dart) implementations created in the repository on the Domain layer.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/repository_data.png" height="649" width="300">
</p>

>  model -> Responsiblel for having datasource validations. 
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/model.png" height="649" width="300">
</p>

>  datasource ->  Responsible for retrieve the data from database, api's and etc.
<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/datasource.png" height="649" width="300">
</p>
