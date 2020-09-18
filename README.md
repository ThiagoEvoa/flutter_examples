# CI/CD Github Actions

### Dependencies
<p>Integrate the <b>Firebase</b> on your project</p>
<p>On the root of your project, you need to create the folder <b>/.github/workflows</b>, and add the main.yml file inside with the code bellow</p>
<p><b>Note that you have to choose beetwen one or more jobs</b></p>


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
          channel: 'dev'
    - run: flutter pub get
    - run: flutter build ios --release --no-codesign
    - name: Upload iPA
      uses: actions/upload-artifact@master
      with:
        name: ios-build
        path: build/ios/iphoneos
        
   build_apk:
     name: Build Flutter (Android)
     runs-on: ubuntu-latest
     steps:
     - uses: actions/checkout@v1
     - uses: actions/setup-java@v1
       with:
         java-version: '12.x'
     - uses: subosito/flutter-action@v1
       with:
           channel: 'dev'
     - run: flutter pub get
     - run: flutter build apk
     - name: Upload APK
       uses: actions/upload-artifact@master
       with:
         name: apk-build
         path: build/app/outputs/apk/release
         
   beta_ios:
     name: Upload iOS Beta to Firebase App Distribution
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
         name: apk-build
     - name: Upload APK
       uses: wzieba/Firebase-Distribution-Github-Action@v1.0.0
       with:
         appId: ${{secrets.FIREBASE_ANDROID_APPID}}
         token: ${{secrets.FIREBASE_TOKEN}}
         group: testers
         file: app-release.aap
```
