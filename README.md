# animated_searchbar

Animated Searchbar provides the horizontal slide animation to a searchbar.

### Screenshot and Screen recording

### Usage

### Installation
Add animated_searchbar: any to your pubspec.yaml dependencies. And import it:
    ```dart
    import 'package:animated_searchbar/animated_searchbar.dart';
    ```

### Example
    AnimatedSearchbar(
        textController: TextEditingController(),
        isOriginalAnimation: false,
        buttonBorderColour: Colors.black45,
        enableKeyboardFocus: true,
    ),

### Required Parameters

#### textEditingController:
Need to pass the textEditingController for the textFormField of the searchbar.

#### isOriginalAnimation:
This is used to enable the button animation, default animation is based on 'DecoratedBoxTransition'. By default it is set to true.User can set it to false in order to disable the button animation and give the button shadow and border as per their requirement.



### Optional Parameters

#### searchBoxWidth:
- SearchBoxWidth decides the width or the length of the search box by default it will take the full width of the screen.

#### trailingIcon:
- TrailingIcon is use to set the icon which is at the end of the search box.

#### secondaryButtonIcon:
- SecondaryButtonIcon is use to set the icon of button when the search box is open.

#### buttonIcon:
- ButtonIcon is use to set the icon when the search box is closed.

#### hintText:
- HintText helps to set the hint value for the search box for instance "Search Here.."

#### searchBarColour:
- SearchBarColour helps to give the background colour of whole search box.

#### buttonColour:
- ButtonColour is use to give the background colour to the button.

#### cursorColour:
- CursorColour allows to give the colour to cursor of the textFormField of search box.

#### buttonIconColour:
- ButtonIconColour allows us to give the colour to button icon when the search box is closed.

#### secondaryButtonIconColour:
- SecondaryButtonIconColour allows us to give the colour to button icon when the search box is open.

#### trailingIconColour:
- TrailingIconColour allows to give the colour to the icon which is at the end of the search box.

#### hintTextColour:
- HintTextColour is use to give the colour to hintText of the textFormField in search box.

#### searchBoxBorderColour:
- SearchBoxBorderColour allows us to give the colour to the border for search box.

#### buttonShadowColour:
- ButtonShadowColour is use to give the colour to the shadow of button.

#### buttonBorderColour:
- ButtonBorderColour is use to give the colour to the border of button.

#### durationInMilliSeconds:
- DurationInMilliSeconds allow to set the animation duration of search box in terms of milliseconds.

#### textInputType:
- TextInputType decides the input type in textFormField of search box for instance it can be type numeric.

#### onRightSide:
- If user wants the button on the right side of the screen than can do the same by this property.

#### enableKeyboardFocus:
- This is for Focusing or unFocusing the keyboard on the tap of search button by enabling this it will automatically bring the keyboard on tap of the button otherwise it will bring the keyboard after tapping into textFormField.

#### enableSearchBoxBorder:
- If user want the border around the search box than it can be enable from this parameter.

#### enableButtonBorder:
- If user want the border around the button than it can be enable from this parameter.

#### enableButtonShadow:
- If user want the shadow around the button than it can be enable from this parameter.

#### enableBoxShadow:
- If user want the shadow under the search box than it can be enable from this parameter.

#### textAlignToRight:
- In case of some languages like arabic if it is require to start from the right side than same can be done from this parameter.

#### onSaved:
- This is the onSaved method of the textFormField.

#### onChanged:
- This is the onChanged method of the textFormField.

#### enteredTextStyle:
- This allows us to change the style of the text which user have entered in the textFormField of search box.

#### buttonElevation:
- The elevation of the button can be set from this parameter.

#### inputFormatters:
- InputFormatters helps us to set the RegExp to the textFormField.

## Guideline for contributors
Contribution towards our repository is always welcome, we request contributors to create a pull request to the development branch only

## Guideline to report an issue/feature request
- It would be great for us if the reporter can share the below things to understand the root cause of the issue.
    - Library version
 	- Code snippet
 	- Logs if applicable
	- Device specification like (Manufacturer, OS version, etc)
 	- Screenshot/video with steps to reproduce the issue

## Let us know!
I’d be really happy if you send me the links to your projects where you have used our component. Just send an email to anujpatel0001@gmail.com And do let us know if you have any questions or suggestion regarding our work.