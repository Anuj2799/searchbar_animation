import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBarAnimation extends StatefulWidget {
  /// This gives the width to the searchbar by default it will take the size of whole screen.
  final double? searchBoxWidth;

  /// This give the shadow to the search box button by default it is 0.
  final double buttonElevation;

  /// Need to pass the textEditingController for the textFormField of the searchbar.
  final TextEditingController textEditingController;

  /// Provide trailing icon in search box which is at the end of search box by default it is search icon.
  final IconData? trailingIcon;

  /// Provide the button icon that is when the search box is closed by default it is search icon.
  final IconData? buttonIcon;

  /// Provide the button icon that is when the search box is open by default it is close icon.
  final IconData? secondaryButtonIcon;

  /// This allows to set the colour for the button icon.
  final Color? buttonIconColour;

  /// This allows to set the colour for the trailing icon.
  final Color? trailingIconColour;

  /// This allows to set the colour for the secondary icon which is icon appears when search box is open.
  final Color? secondaryButtonIconColour;

  /// This allows to set the hintText color of textFormField of the search box.
  final Color? hintTextColour;

  /// This allows to set the background colour of the whole search box field by default it is set to white.
  final Color? searchBoxColour;

  /// This property allows to set the background colour of the search button.
  final Color? buttonColour;

  /// This allows to set the colour of the cursor of textFormField.
  final Color? cursorColour;

  /// If user required the search box border than they can set it's colour from here.
  final Color? searchBoxBorderColour;

  /// User can set the shadow colour of button form here.
  final Color? buttonShadowColour;

  /// User can set the border colour of button from here
  final Color? buttonBorderColour;

  /// Can Change the hint text from here.
  final String hintText;

  /// Set the duration of animation from here by default it is 1000 milliseconds.
  final int durationInMilliSeconds;

  /// If user required the search box appear on the right side instead of left side they can set it from here.
  final bool isSearchBoxOnRightSide;

  /// This property allows user to enable the keyboard on tap of search box button directly if this is set as true if not set as true than it will not automatically bring keyboard on tap of the search box button instead it will bring keyboard once searchField is tapped.
  final bool enableKeyboardFocus;

  /// Can enable or disable the shadow of the button from here if isOriginalAnimation is set to false.
  final bool enableButtonShadow;

  /// Can set if searchBox shadow is required from here.
  final bool enableBoxShadow;

  /// Can set the direction of the text, That is form right to left in case of languages like arabic.
  final bool textAlignToRight;

  /// If user wants the border around the search box can enable from this parameter.
  final bool enableBoxBorder;

  /// If user wants border around the button they can set it from this parameter.
  final bool enableButtonBorder;

  /// This is the required field it allows to enable or disable the animation of the button currently it's animation is based on the 'DecoratedBoxTransition', If it is disabled than user can give the shadow to the button but if it is set to true than cannot give shadow to the button when search box is closed.
  final bool isOriginalAnimation;

  /// This allows us to change the style of the text which user have entered in the textFormField of search box.
  final TextStyle? enteredTextStyle;

  /// OnSaved function for the textFormField, In order to use this user must wrap this widget into 'Form' widget.
  final Function? onSaved;

  /// OnChanged function for the textFormField.
  final Function? onChanged;

  /// onFieldSubmitted function for the textFormField.
  final Function? onFieldSubmitted;

  /// onFieldSubmitted function for the textFormField.
  final Function? onEditingComplete;

  /// onExpansionComplete functions can be used to perform something just after searchbox is opened.
  final Function? onExpansionComplete;

  /// onCollapseComplete functions can be used to perform something just after searchbox is closed.
  final Function? onCollapseComplete;

  /// Can set keyBoard Type from here (e.g TextInputType.numeric) by default it is set to text,
  final TextInputType textInputType;

  /// Can set RegExp in the textFormField of search box from here.
  final List<TextInputFormatter>? inputFormatters;

  const SearchBarAnimation({
    required this.textEditingController,
    required this.isOriginalAnimation,
    Key? key,
    this.searchBoxWidth,
    this.trailingIcon = Icons.search,
    this.secondaryButtonIcon = Icons.close,
    this.buttonIcon = Icons.search,
    this.hintText = "Search Here",
    this.searchBoxColour = Colors.white,
    this.buttonColour = Colors.white,
    this.cursorColour = Colors.black,
    this.buttonIconColour = Colors.black,
    this.secondaryButtonIconColour = Colors.black,
    this.trailingIconColour = Colors.black,
    this.hintTextColour = Colors.grey,
    this.searchBoxBorderColour = Colors.black12,
    this.buttonShadowColour = Colors.black45,
    this.buttonBorderColour = Colors.black26,
    this.durationInMilliSeconds = 1000,
    this.textInputType = TextInputType.text,
    this.isSearchBoxOnRightSide = false,
    this.enableKeyboardFocus = false,
    this.enableBoxBorder = false,
    this.enableButtonBorder = false,
    this.enableButtonShadow = true,
    this.enableBoxShadow = true,
    this.textAlignToRight = false,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.onExpansionComplete,
    this.onCollapseComplete,
    this.onEditingComplete,
    this.enteredTextStyle,
    this.buttonElevation = 0,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _SearchBarAnimationState createState() => _SearchBarAnimationState();
}

class _SearchBarAnimationState extends State<SearchBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  FocusNode focusNode = FocusNode();
  bool _isAnimationOn = false;
  bool switcher = false;

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(60.0),
    ),
    end: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          blurRadius: 5.0,
          spreadRadius: 0.0,
          color: Colors.black45,
        )
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationInMilliSeconds),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    widget.textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimatedSearchbarBody();
  }

  /// main body of the searchbar animation
  Widget _buildAnimatedSearchbarBody() {
    return Container(
      height: 60.0,
      alignment: widget.isSearchBoxOnRightSide
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: _isAnimationOn ? widget.searchBoxColour : Colors.transparent,
          border: Border.all(
              color: !widget.enableBoxBorder
                  ? Colors.transparent
                  : _isAnimationOn
                      ? widget.searchBoxBorderColour!
                      : Colors.transparent),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: (!_isAnimationOn)
              ? null
              : ((widget.enableBoxShadow)
                  ? [
                      const BoxShadow(
                        color: Colors.black26,
                        spreadRadius: -10.0,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 7.0),
                      ),
                    ]
                  : null),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: widget.durationInMilliSeconds),
          height: 48.0,
          width: (!switcher)
              ? 48.0
              : (widget.searchBoxWidth ?? MediaQuery.of(context).size.width),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: widget.durationInMilliSeconds),
                top: 6.0,
                left: widget.isSearchBoxOnRightSide ? 7.0 : null,
                right: !widget.isSearchBoxOnRightSide ? 7.0 : null,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: (!switcher) ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 700),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Icon(
                      widget.trailingIcon!,
                      size: 20.0,
                      color: widget.trailingIconColour,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: widget.durationInMilliSeconds),
                left: (!switcher)
                    ? 20.0
                    : (!widget.textAlignToRight)
                        ? 45.0
                        : 80.0,
                curve: Curves.easeOut,
                top: 11.0,
                child: AnimatedOpacity(
                  opacity: (!switcher) ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.topCenter,
                    width: (widget.searchBoxWidth ??
                            MediaQuery.of(context).size.width) /
                        1.7,
                    child: _textFormField(),
                  ),
                ),
              ),
              Align(
                alignment: widget.isSearchBoxOnRightSide
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: (widget.isOriginalAnimation)
                    ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: _isAnimationOn
                                ? null
                                : Border.all(color: widget.buttonBorderColour!),
                          ),
                          child: DecoratedBoxTransition(
                            decoration:
                                decorationTween.animate(_animationController),
                            child: GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: widget.buttonColour,
                                child: Icon(
                                  switcher
                                      ? widget.secondaryButtonIcon!
                                      : widget.buttonIcon!,
                                  size: 20.0,
                                  color: switcher
                                      ? widget.secondaryButtonIconColour
                                      : widget.buttonIconColour,
                                ),
                              ),
                              onTap: () {
                                _onTapFunctionOriginalAnim();
                              },
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: widget.enableButtonBorder
                                ? Border.all(color: widget.buttonBorderColour!)
                                : null,
                            boxShadow: widget.enableButtonShadow
                                ? [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: widget.buttonShadowColour!,
                                        spreadRadius: widget.buttonElevation)
                                  ]
                                : null,
                          ),
                          child: GestureDetector(
                            child: CircleAvatar(
                              backgroundColor: widget.buttonColour,
                              child: Icon(
                                switcher
                                    ? widget.secondaryButtonIcon!
                                    : widget.buttonIcon!,
                                size: 20.0,
                                color: switcher
                                    ? widget.secondaryButtonIconColour
                                    : widget.buttonIconColour,
                              ),
                            ),
                            onTap: () {
                              _onTapFunction();
                            },
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// This is the tap function for the animation style not for the original animation style.
  void _onTapFunction() {
    _isAnimationOn = true;
    setState(
      () {
        if (!switcher) {
          switcher = true;
          setState(() {
            if (widget.enableKeyboardFocus) {
              FocusScope.of(context).requestFocus(focusNode);
            }
          });
          _animationController.forward().then((value) {
            setState(() {
              _isAnimationOn = true;
            });
            widget.onExpansionComplete?.call();
          });
        } else {
          switcher = false;
          setState(() {
            if (widget.enableKeyboardFocus) {
              unFocusKeyboard();
            }
          });
          _animationController.reverse().then((value) {
            setState(() {
              _isAnimationOn = false;
            });
            widget.onCollapseComplete?.call();
          });
        }
      },
    );
  }

  /// This is the tap function for the original animation style.
  void _onTapFunctionOriginalAnim() {
    _isAnimationOn = true;
    setState(
      () {
        if (!switcher) {
          switcher = true;
          setState(() {
            if (widget.enableKeyboardFocus) {
              FocusScope.of(context).requestFocus(focusNode);
            }
          });
          _animationController.forward().then((value) {
            widget.onExpansionComplete?.call();
          });
        } else {
          switcher = false;
          setState(() {
            if (widget.enableKeyboardFocus) {
              unFocusKeyboard();
            }
          });
          _animationController.reverse().then((value) {
            setState(() {
              _isAnimationOn = false;
            });
            widget.onCollapseComplete?.call();
          });
        }
      },
    );
    unFocusKeyboard();
  }

  /// This function is for the textFormField of searchbar.
  TextFormField _textFormField() {
    return TextFormField(
      controller: widget.textEditingController,
      inputFormatters: widget.inputFormatters,
      focusNode: focusNode,
      cursorWidth: 2.0,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (String value) {
        setState(() {
          switcher = true;
        });
        (widget.onFieldSubmitted != null)
            ? widget.onFieldSubmitted!(value)
            : debugPrint('onFieldSubmitted Not Used');
      },
      onEditingComplete: () {
        unFocusKeyboard();
        setState(() {
          switcher = false;
        });
        (widget.onEditingComplete != null)
            ? widget.onEditingComplete?.call()
            : debugPrint('onEditingComplete Not Used');
      },
      keyboardType: widget.textInputType,
      onChanged: (var value) {
        (widget.onChanged != null)
            ? widget.onChanged?.call(value)
            : debugPrint('onChanged Not Used');
      },
      onSaved: (var value) {
        (widget.onSaved != null)
            ? widget.onSaved?.call(value)
            : debugPrint('onSaved Not Used');
      },
      style: widget.enteredTextStyle ?? const TextStyle(color: Colors.black),
      cursorColor: widget.cursorColour,
      textAlign: widget.textAlignToRight ? TextAlign.right : TextAlign.left,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 5),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintTextColour,
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
          height: kIsWeb ? 1.5 : 1.2,
        ),
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// This is for automatically Focusing or unFocusing the keyboard on the tap of search button.
  void unFocusKeyboard() {
    final FocusScopeNode currentFocusScope = FocusScope.of(context);
    if (!currentFocusScope.hasPrimaryFocus && currentFocusScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
