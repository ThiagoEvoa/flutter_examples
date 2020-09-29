# Flavor iOS

### Dependencies

> On XCode, go to Product > Scheme > Manage Scheme.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_1.png" height="600" width="700">
</p>

> Select the Runner scheme and click on the engine, and select Duplicate.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_2.png" height="600" width="600">
</p>

> Change the scheme name to <b>"dev"</b> for example, mark the <b>Shared</b> option and change the <b>Build Configuration</b> to <b>Debug</b>. Repeate the process to <b>prod</b>.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_3.png" height="600" width="600">
</p>

> Go to <b>Runner</b> on <b>Project</b> level

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_4.png" height="600" width="600">
</p>

> Click o the <b>+</b> icon and <b>Duplicate</b> the <b>Debug</b> and <b>Release</b> configuration, as the image bellow.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_5.png" height="600" width="600">
</p>


<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_6.png" height="600" width="600">
</p>

 > Go to Product > Scheme > Manage Scheme.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_7.png" height="600" width="600">
</p>

> Select the <b>dev</b> scheme and click on the <b>Edit...</b>

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_8.png" height="600" width="600">
</p>

> Select <b>Run</b> and change the <b>Build Configuration</b> to <b>Debug-dev</b>.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_9.png" height="600" width="600">
</p>

> Select <b>Archive</b> and change the <b>Build Configuration</b> to <b>Release-dev</b>. Repeate the process to <b>prod</b>.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_10.png" height="600" width="600">
</p>

> Inside <b>Runner</b> directory add a <b>Group with folder</b> with the name <b>Firebase</b> and inside create two folders with the name <b>dev</b> and <b>prod</b> and put the firebase .plist configuration inside the respective folder.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_11.png" height="600" width="600">
</p>

> Go to <b>Runner</b> on <b>Target</b> level.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_12.png" height="600" width="600">
</p>

> Go to <b>Build Phases</b> and click on the <b>+</b> icon and create a <b>New Run Script Phase</b>.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_13.png" height="600" width="600">
</p>

> Change the name to <b>Firebase Setup</b>.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_14.png" height="600" width="600">
</p>

> Move the <b>Firebase Setup</b> above the <b>Compile Sources</b>.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_15.png" height="600" width="600">
</p>

> Add the code bellow


#### Firebase Setup
```dart
if [ "${CONFIGURATION}" == "Debug-prod" ] || [ "${CONFIGURATION}" == "Release-prod" ] || [ "${CONFIGURATION}" == "Release" ]; then
cp -r "${PROJECT_DIR}/Runner/Firebase/prod/GoogleService-Info.plist" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"

echo "Production plist copied"

elif [ "${CONFIGURATION}" == "Debug-dev" ] || [ "${CONFIGURATION}" == "Release-dev" ] || [ "${CONFIGURATION}" == "Debug" ]; then

cp -r "${PROJECT_DIR}/Runner/Firebase/dev/GoogleService-Info.plist" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"

echo "Development plist copied"
fi
```

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_16.png" height="600" width="600">
</p>

> Go to <b>Build Settings</b>.

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_17.png" height="600" width="600">
</p>

> Search for <b>Product Bundle Identifier</b> and change the <b>dev</b> package name, adding <b>.dev</b> in the end. 

<p align="center">
<img src="https://github.com/ThiagoEvoa/flutter_examples/blob/master/images/flavor_ios_18.png" height="600" width="600">
</p>


> OBS: In order to run the project, execute the command <b>"flutter run lib/main.dart flavor --dev"</b> on terminal. Just remember to replace de <b>"dev"</b> for the desired environment.
