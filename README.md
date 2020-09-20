# CI/CD Github Actions

### Dependencies
<p><b>If you want to distribute on firebase follow the steps 1 and 2</b></p>
<b>1)</b> Integrate the <b>Firebase</b> on your project </br>
<b>2)</b> Install firebase cli on your machine and run the command "firebase login:ci --no-localhost" </br>
<b>3)</b> After login copy the token on terminal</br>
<b>4)</b> On your Github Settings go to <b>Secrets</b> and create the secrets related to the <b>FIREBASE_IOS_APPID</b>, <b>FIREBASE_ANDROID_APPID</b> and <b>FIREBASE_TOKEN</b> </br>
<b>5)</b> On the root of your Github repository, you need to create the folder <b>/.github/workflows</b>, and add the main.yml file inside with the code bellow </br>
<b>6)</b> In order to run the yml file, you have to push your code to the informed branch </br></br>


<b>OBS: Note that you have to choose beetwen one or more jobs</b>


### main.yml
```yml
name: Flutter CI/CD

on:
  push:
    branches:
      - master
  pull_request:
    branches:
      - master
    
jobs:
  build_ios:
    name: Build Flutter (iOS)
    runs-on: macOS-latest
    steps:
    - uses: actions/checkout@v1
    - uses: actions/setup-java@v1
      with:
        java-version: '12.x'
    - uses: subosito/flutter-action@v1
      with:
          flutter-version: '1.20.4'
          channel: 'stable'
    - run: flutter clean
      working-directory: ./ci_cd
    - run: flutter pub get
      working-directory: ./ci_cd
    - run: flutter build ios --debug --no-codesign
      working-directory: ./ci_cd
    - name: Upload iPA
      uses: actions/upload-artifact@master
      with:
        name: ios-build
        path: build/ios/iphoneos/*.ipa
        
  build_apk:
    name: Build Flutter (Android)
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - uses: subosito/flutter-action@v1
      with:
          flutter-version: '1.20.4'
          channel: 'stable'
    - run: flutter clean
      working-directory: ./ci_cd
    - run: flutter pub get
      working-directory: ./ci_cd
    - run: flutter build apk --debug
      working-directory: ./ci_cd
    - name: Upload APK
      uses: actions/upload-artifact@master
      with:
        name: android-build
        path: ./ci_cd/build/app/outputs/apk/debug/*.apk
         
  beta_ios:
    name: Upload iOS Beta to Firebase App Distributio
    needs: [build_ios]
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Download Artifact
      uses: actions/download-artifact@master
      with:
        name: ios-build
    - name: Upload IPA
      uses: wzieba/Firebase-Distribution-Github-Action@v1.0.0
      with:
        appId: ${{secrets.FIREBASE_IOS_APPID}}
        token: ${{secrets.FIREBASE_TOKEN}}
        group: testers
        file: Runner.ipa
         
  beta_apk:
    name: Upload Android Beta to Firebase App Distribution
    needs: [build_apk]
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: set up JDK 1.8
      uses: actions/setup-java@v1
      with:
        java-version: 1.8
    - name: Download Artifact
      uses: actions/download-artifact@master
      with:
        name: android-build
    - name: Upload APK
      uses: wzieba/Firebase-Distribution-Github-Action@v1
      with:
        appId: ${{secrets.FIREBASE_ANDROID_APPID}}
        token: ${{secrets.FIREBASE_TOKEN}}
        groups: testers
        file: app-debug.apk
```
