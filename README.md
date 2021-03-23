# How to build flutter app?

## Android
> Debug version run the command:

``
flutter build apk --debug
``

> Release version run the command:

``
flutter build apk --release
``

> Bunble version run the command:

``
flutter build appbundle
``

``
flutter appbundle --target-platform android-arm, android-arm64, android-x64
``

> Split Bunble version run the command:

``
flutter build apk --split-per-abi
``

## iOS
> Debug version run the command:

``
flutter build ios --debug
``

> Release version run the command:

``
flutter build ios --release
``

## Find devices
> If you want to see all connected devices run this command:

``
flutter devices
``

## Testing on single device
> If you want to test your app in a single device open the simulator and run this command:

``
flutter run -d {deviceName}
``

## Testing on multiple devices
> If you want to test your app in multiple devices open the simulators and run this command:

``
flutter run -d all
``
___
<!--# Architecture
[MVVM](https://github.com/ThiagoEvoa/flutter_examples/tree/mvvm_architecture)
[Clean Architecture](https://github.com/ThiagoEvoa/flutter_examples/tree/clean_architecture) -->

# Design Patterns

## Creational
[Factory Method](https://github.com/ThiagoEvoa/design_patterns/tree/factory_method)

[Singleton](https://github.com/ThiagoEvoa/design_patterns/tree/singleton)

[Prototype](https://github.com/ThiagoEvoa/design_patterns/tree/prototype)

## Structural
[Decorator](https://github.com/ThiagoEvoa/design_patterns/tree/decorator)

[Adapter](https://github.com/ThiagoEvoa/design_patterns/tree/adapter)

[Facade](https://github.com/ThiagoEvoa/design_patterns/tree/facade)

## Behavioral
[Strategy](https://github.com/ThiagoEvoa/design_patterns/tree/strategy)

[State](https://github.com/ThiagoEvoa/design_patterns/tree/state)

[Observer](https://github.com/ThiagoEvoa/design_patterns/tree/observer)

# CI/CD
[Github Actions](https://github.com/ThiagoEvoa/flutter_examples/tree/ci_cd_github_action)

# Test
[Unit test](https://github.com/ThiagoEvoa/flutter_examples/tree/unit_test)

[Widget test](https://github.com/ThiagoEvoa/flutter_examples/tree/widget_test)

# Flavors
[Flavors Dart](https://github.com/ThiagoEvoa/flutter_examples/tree/flavor_dart)

[Flavors Android](https://github.com/ThiagoEvoa/flutter_examples/tree/flavor_android)

[Flavors iOS](https://github.com/ThiagoEvoa/flutter_examples/tree/flavor_ios)

# Widgets

## Texts
[Text](https://github.com/ThiagoEvoa/flutter_examples/tree/text)

[RichText](https://github.com/ThiagoEvoa/flutter_examples/tree/rich_text)

[SelectableText](https://github.com/ThiagoEvoa/flutter_examples/tree/selectable_text)

[TextField](https://github.com/ThiagoEvoa/flutter_examples/tree/textfield)

[Form](https://github.com/ThiagoEvoa/flutter_examples/tree/form)

[FilteringTextInputFormatter](https://github.com/ThiagoEvoa/flutter_examples/tree/filtering_text_input_formatter)

[Pincode fields](https://github.com/ThiagoEvoa/flutter_examples/tree/pincode)

## Buttons
[RaisedButton](https://github.com/ThiagoEvoa/flutter_examples/tree/raisedbutton)

[FlatButton](https://github.com/ThiagoEvoa/flutter_examples/tree/flatbutton)

[IconButton](https://github.com/ThiagoEvoa/flutter_examples/tree/iconbutton)

[InkWell](https://github.com/ThiagoEvoa/flutter_examples/tree/inkwell)

## Icons
[Icon](https://github.com/ThiagoEvoa/flutter_examples/tree/icon)

[Animated Icon](https://github.com/ThiagoEvoa/flutter_examples/tree/animatedicon)

## Dialogs
[AlertDialog](https://github.com/ThiagoEvoa/flutter_examples/tree/alertdialog)

[GeneralDialog](https://github.com/ThiagoEvoa/flutter_examples/tree/generaldialog)

[AboutDialog](https://github.com/ThiagoEvoa/flutter_examples/tree/aboutdialog)

## Images / Videos
[Image NetWork](https://github.com/ThiagoEvoa/flutter_examples/tree/image_network)

[Image Asset](https://github.com/ThiagoEvoa/flutter_examples/tree/image_asset)

[ClipRRect](https://github.com/ThiagoEvoa/flutter_examples/tree/cliprrect)

[ClipOval](https://github.com/ThiagoEvoa/flutter_examples/tree/clipoval)

[ClipPath](https://github.com/ThiagoEvoa/flutter_examples/tree/clippath)

[ColorFiltered](https://github.com/ThiagoEvoa/flutter_examples/tree/colorfiltered)

[ImagePicker](https://github.com/ThiagoEvoa/flutter_examples/tree/imagepicker)

[Base64 Image](https://github.com/ThiagoEvoa/flutter_examples/tree/base64_image_database)

[Video Player](https://github.com/ThiagoEvoa/flutter_examples/tree/video_player)

[Audio Player](https://github.com/ThiagoEvoa/flutter_examples/tree/audio_player)

[FilePicker](https://github.com/ThiagoEvoa/flutter_examples/tree/filepicker)

[ImageFiltered](https://github.com/ThiagoEvoa/flutter_examples/tree/image_filtered)

[Camera](https://github.com/ThiagoEvoa/flutter_examples/tree/camera)

[Augmented Reality](https://github.com/ThiagoEvoa/flutter_examples/tree/augmented_reality)

## Lists
[ListView](https://github.com/ThiagoEvoa/flutter_examples/tree/listview)

[ListView Builder](https://github.com/ThiagoEvoa/flutter_examples/tree/listview_builder)

[Dismissible](https://github.com/ThiagoEvoa/flutter_examples/tree/dismissible)

[RefreshIndicator](https://github.com/ThiagoEvoa/flutter_examples/tree/refreshindicator)

[Reorderable ListView](https://github.com/ThiagoEvoa/flutter_examples/tree/reorderablelistview)

[GridView Builder](https://github.com/ThiagoEvoa/flutter_examples/tree/gridview_builder)

[ListWheelScrollView](https://github.com/ThiagoEvoa/flutter_examples/tree/listwheelscrollview)

[CheckboxListTile](https://github.com/ThiagoEvoa/flutter_examples/tree/checkbox_listtile)

[Infinite Scroll](https://github.com/ThiagoEvoa/flutter_examples/tree/infinity_scroll)

[Flutter Slidable](https://github.com/ThiagoEvoa/flutter_examples/tree/flutter_slidable)

[Flutter Swiper](https://github.com/ThiagoEvoa/flutter_examples/tree/flutter_swiper)

[Group ListView](https://github.com/ThiagoEvoa/flutter_examples/tree/group_listview)

[ScrollablePositionedList](https://github.com/ThiagoEvoa/flutter_examples/tree/scrollable_positioned_list)

## Progress
[CircularProgressIndicator](https://github.com/ThiagoEvoa/flutter_examples/tree/circularprogressindicator)

[LinearProgressIndicator](https://github.com/ThiagoEvoa/flutter_examples/tree/linearprogressindicator)

[Shimmer](https://github.com/ThiagoEvoa/flutter_examples/tree/shimmer)

## Menus
[TabBar](https://github.com/ThiagoEvoa/flutter_examples/tree/tabbar)

[Bottom Navigation](https://github.com/ThiagoEvoa/flutter_examples/tree/bottomnavigationbar)

[BottomAppBar](https://github.com/ThiagoEvoa/flutter_examples/tree/bottomappbar)

[Drawer](https://github.com/ThiagoEvoa/flutter_examples/tree/drawer)

[Popup Menu Button](https://github.com/ThiagoEvoa/flutter_examples/tree/popupmenubutton)

[SliverAppBar](https://github.com/ThiagoEvoa/flutter_examples/tree/sliverappbar)

## Layouts
[Container](https://github.com/ThiagoEvoa/flutter_examples/tree/container)

[Animated Container](https://github.com/ThiagoEvoa/flutter_examples/tree/animatedcontainer)

[Placeholder](https://github.com/ThiagoEvoa/flutter_examples/tree/placeholder)

[Column](https://github.com/ThiagoEvoa/flutter_examples/tree/column)

[Row](https://github.com/ThiagoEvoa/flutter_examples/tree/row)

[Wrap](https://github.com/ThiagoEvoa/flutter_examples/tree/wrap)

[Stack](https://github.com/ThiagoEvoa/flutter_examples/tree/stack)

[Material](https://github.com/ThiagoEvoa/flutter_examples/tree/material)

[Scaffold](https://github.com/ThiagoEvoa/flutter_examples/tree/scaffold)

[SafeArea](https://github.com/ThiagoEvoa/flutter_examples/tree/safearea)

[Table](https://github.com/ThiagoEvoa/flutter_examples/tree/table)

[LayoutBuilder](https://github.com/ThiagoEvoa/flutter_examples/tree/layoutbuilder)

[WebView](https://github.com/ThiagoEvoa/flutter_examples/tree/webview)

[Gradient](https://github.com/ThiagoEvoa/flutter_examples/tree/gradient)

[InteractiveViewer](https://github.com/ThiagoEvoa/flutter_examples/tree/interactiveviewer)

[SearchDelegate](https://github.com/ThiagoEvoa/flutter_examples/tree/search_delegate)

[MaterialFloatingSearchBar](https://github.com/ThiagoEvoa/flutter_examples/tree/material_floating_search_bar)

[ShaderMask](https://github.com/ThiagoEvoa/flutter_examples/tree/shader_mask)

## Navigations
[Navigation](https://github.com/ThiagoEvoa/flutter_examples/tree/navigation)

[Navigation 2](https://github.com/ThiagoEvoa/flutter_examples/tree/navigation2)

## Animations
[Slider](https://github.com/ThiagoEvoa/flutter_examples/tree/slider)

[Switch](https://github.com/ThiagoEvoa/flutter_examples/tree/switch)

[CheckBox](https://github.com/ThiagoEvoa/flutter_examples/tree/checkbox)

[Radio](https://github.com/ThiagoEvoa/flutter_examples/tree/radio)

[ExpansionPanel](https://github.com/ThiagoEvoa/flutter_examples/tree/expansionpanel)

[Tooltip](https://github.com/ThiagoEvoa/flutter_examples/tree/tooltip)

[SnackBar](https://github.com/ThiagoEvoa/flutter_examples/tree/snackbar)

[Stepper](https://github.com/ThiagoEvoa/flutter_examples/tree/stepper)

[Draggable](https://github.com/ThiagoEvoa/flutter_examples/tree/draggable)

[DatePicker](https://github.com/ThiagoEvoa/flutter_examples/tree/datepicker)

[TimePicker](https://github.com/ThiagoEvoa/flutter_examples/tree/timepicker)

[FadeTransition](https://github.com/ThiagoEvoa/flutter_examples/tree/fadetransition)

[Hero](https://github.com/ThiagoEvoa/flutter_examples/tree/hero)

[DraggableScrollableSheet](https://github.com/ThiagoEvoa/flutter_examples/tree/draggablescrollablesheet)

[AnimatedBuilder](https://github.com/ThiagoEvoa/flutter_examples/tree/animatedbuilder)

[Transform](https://github.com/ThiagoEvoa/flutter_examples/tree/transform)

[AnimatedPositioned](https://github.com/ThiagoEvoa/flutter_examples/tree/animatedpositioned)

[SlideTransition](https://github.com/ThiagoEvoa/flutter_examples/tree/slide_transition)

[FlipCard](https://github.com/ThiagoEvoa/flutter_examples/tree/flipcard)

[FlipWidget](https://github.com/ThiagoEvoa/flutter_examples/tree/flipwidget)

[Flare/Rive](https://github.com/ThiagoEvoa/flutter_examples/tree/flare)

[SplashScreen](https://github.com/ThiagoEvoa/flutter_examples/tree/splashscreen)

[Lottie](https://github.com/ThiagoEvoa/flutter_examples/tree/lottie)

## Themes
[Dark Theme](https://github.com/ThiagoEvoa/flutter_examples/tree/darktheme)

[Dark Theme Provider](https://github.com/ThiagoEvoa/flutter_examples/tree/dartheme_provider)

# State Management
[SetState](https://github.com/ThiagoEvoa/flutter_examples/tree/setstate)

[Provider](https://github.com/ThiagoEvoa/flutter_examples/tree/provider)

[Bloc](https://github.com/ThiagoEvoa/flutter_examples/tree/bloc)

[Bloc + rxDart](https://github.com/ThiagoEvoa/flutter_examples/tree/bloc_rxdart)

[Mobx](https://github.com/ThiagoEvoa/flutter_examples/tree/mobx)

[Getx](https://github.com/ThiagoEvoa/flutter_examples/tree/getx)

[Riverpod](https://github.com/ThiagoEvoa/flutter_examples/tree/riverpod)

[ValueNotifier](https://github.com/ThiagoEvoa/flutter_examples/tree/value_notifier)

[Hooks](https://github.com/ThiagoEvoa/flutter_examples/tree/hooks)

# Database
[SqfLite](https://github.com/ThiagoEvoa/flutter_examples/tree/sqflite)

[Hive](https://github.com/ThiagoEvoa/flutter_examples/tree/hive)

[Moor](https://github.com/ThiagoEvoa/flutter_examples/tree/moor)

[SharedPreferences](https://github.com/ThiagoEvoa/flutter_examples/tree/sharedpreferences)

[FlutterSecureStorage](https://github.com/ThiagoEvoa/flutter_examples/tree/secure_storage)

# API
[HTTP](https://github.com/ThiagoEvoa/flutter_examples/tree/http)

[Dio](https://github.com/ThiagoEvoa/flutter_examples/tree/dio)

[Chopper](https://github.com/ThiagoEvoa/flutter_examples/tree/chopper)

[Retrofit](https://github.com/ThiagoEvoa/flutter_examples/tree/retrofit)

[Websocket](https://github.com/ThiagoEvoa/flutter_examples/tree/websocket)

[Flutter Mdns Plugin](https://github.com/ThiagoEvoa/flutter_examples/tree/flutter_mdns_plugin)

# Firebase
[Auth](https://github.com/ThiagoEvoa/flutter_examples/tree/firebaseauth)

[Store](https://github.com/ThiagoEvoa/flutter_examples/tree/firebasestore)

[Storage](https://github.com/ThiagoEvoa/flutter_examples/tree/firebasestorage)

[Messaging](https://github.com/ThiagoEvoa/flutter_examples/tree/firebase_messaging)

[InAppMessage](https://github.com/ThiagoEvoa/flutter_examples/tree/firebase_inappmessage)

[RemoteConfig](https://github.com/ThiagoEvoa/flutter_examples/tree/firebase_remoteconfig)

# Authentication
[Google Auth](https://github.com/ThiagoEvoa/flutter_examples/tree/google_auth)

[Flutter LinkedIn](https://github.com/ThiagoEvoa/flutter_examples/tree/linkedin_login)

[Flutter Facebook](https://github.com/ThiagoEvoa/flutter_examples/tree/facebook_login)

[Biometric](https://github.com/ThiagoEvoa/flutter_examples/tree/biometric)

# Internationalization
[Internationalization](https://github.com/ThiagoEvoa/flutter_examples/tree/internationalization)

[EasyLocalization](https://github.com/ThiagoEvoa/flutter_examples/tree/easy_location)

# Geolocator
[Geolocator](https://github.com/ThiagoEvoa/flutter_examples/tree/geolocator)

[Google Maps](https://github.com/ThiagoEvoa/flutter_examples/tree/googlemaps)

# Connectivity
[PackageInfo](https://github.com/ThiagoEvoa/flutter_examples/tree/packageinfo)

[Channel](https://github.com/ThiagoEvoa/flutter_examples/tree/channel)

[Connectivity](https://github.com/ThiagoEvoa/flutter_examples/tree/connectivity)

[Device Info](https://github.com/ThiagoEvoa/flutter_examples/tree/device_info)

[Bluetooth](https://github.com/ThiagoEvoa/flutter_examples/tree/bluetooth)

[Share](https://github.com/ThiagoEvoa/flutter_examples/tree/share)

[BarCode e QRCode](https://github.com/ThiagoEvoa/flutter_examples/tree/barcode_qrcode)

# Others

[Local Notification](https://github.com/ThiagoEvoa/flutter_examples/tree/localnotification)

[Flutter Launcher Icons](https://github.com/ThiagoEvoa/flutter_examples/tree/flutter_launcher_icons)

[Json Serializable](https://github.com/ThiagoEvoa/flutter_examples/tree/json_serializable)

[Freezed](https://github.com/ThiagoEvoa/flutter_examples/tree/freezed)
