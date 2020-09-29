# Flavor Android

### Dependencies

> Inside your app gradle level, add this configuration in order to create a dev and prod versions. 

#### App build.gradle
```dart
flavorDimensions "default"
productFlavors {
    dev {
        dimension "default"
        applicationIdSuffix ".dev"
    }
    prod{
        dimension "default"
    }
}
```

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/gradle.png" height="600" width="600">
</p>

> On the <b>src</b> create those two folders and put the firebase json configuration if you want two firebase projects, according to the enviroment. 

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/folders.png" height="400" width="400">
</p>

> OBS: In order to run the project, execute the command <b>"flutter run lib/main.dart flavor --dev"</b> on terminal. Just remember to replace de <b>"dev"</b> for the desired environment.
