# fun_cam

## Description

 - A Camera app uses deepAr to Capture funny photos and videos

## Getting Started

• Clean architecture with block pattern.
• Get-it service locator.
• The app is totally offline work without internet.
• Using deepar.io sdk integration.
• Can take both picture and video record.
• Switch between different ar objects.
• Save to gallery.
• Switch between rear and front camera.
• Use flash (working only on rear camera).

![alt text](assets/artboard1.png)

![alt text](assets/artboard2.png)



## Installation Steps
1- Go to https://developer.deepar.ai/

2- Sign-up and create project with any name

3- In the project you have been created add android and ios apps

4- copy the sdk key for both app for the next step usage 

5-create a dart file in lib/auth/ name it secrets.dart

6- in lib/auth/secrets.dart ...
add const string variable named with "deepArAndroidKey" and its value equals "sdk key of android app"
add const string variable named with "deepArIosKey" and its value equals "sdk key of ios app"

Good Luck