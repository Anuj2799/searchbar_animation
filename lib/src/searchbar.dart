import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedSearchbar extends StatefulWidget {
  /// This gives the width to the searchbar by default it will take the size of whole screen.
  final double? searchBoxWidth;

  /// This give the shadow to the searchbar button by default it is 0.
  final double buttonElevation;

  /// Pass textEditing controller here.
  final TextEditingController textEditingController;

  /// Provide trailing icon in searchbar by default it is search icon.
  final IconData? trailingIcon;

  /// Provide the button icon by default it is search icon.
  final IconData? buttonIcon;

  /// This icon appears when searchbar is open by default it is close icon.
  final IconData? secondaryButtonIcon;

  /// This allows to set the colour for the button icon.
  final Color? buttonIconColour;

  /// This allows to set the colour for the trailing icon.
  final Color? trailingIconColour;

  /// This allows to set the colour for the secondary icon which is icon appears when searchbar is open.
  final Color? secondaryButtonIconColour;

  /// This allows to set the hintText color here hintText is search Here.
  final Color? hintTextColour;

  /// This allows to set the colour of the whole searchbar field by default it is set to white.
  final Color? searchBarColour;

  /// This property allows to set the colour of the search button.
  final Color? buttonColour;

  /// This allows to set the colour of the cursor.
  final Color? cursorColour;

  /// If user required the search box border then they can set it's colour from here.
  final Color? searchBoxBorderColour;

  /// User can set the shadow colour of button form here.
  final Color? buttonShadowColour;

  /// User can set the border colour of button from here
  final Color? buttonBorderColour;

  /// Change the hint text from here.
  final String hintText;

  /// Set the duration of the animation from here by default it is 1000 milliseconds.
  final int durationInMilliSeconds;

  /// If user required the searchbar on right side instead of left side they can set it from here.
  final bool onRightSide;

  /// This is used to hide the keyboard once tap the entre button.
  final bool enableKeyboardFocus;

  /// User can set button shadow from here.
  final bool enableButtonShadow;

  /// Can set if searchBox shadow is required from here.
  final bool enableBoxShadow;

  /// Can set the direction of the text, for instance form right to left in case of languages like arabic.
  final bool textAlignToRight;

  /// If searchBox border is required can set from here.
  final bool enableBoxBorder;

  /// If user wants button border they can set it from here
  final bool enableButtonBorder;

  /// This is the required field it allows to have different style for the animation
  final bool isOriginalAnimation;

  /// This allows us to change the style of the text whixh user have entered in the textFormField of search box.
  final TextStyle? enteredTextStyle;

  /// OnSaved function for the textFormField.
  final Function? onSaved;

  /// OnChanged function for the textFormField.
  final Function? onChanged;

  /// onFieldSubmitted function for the textFormField.
  final Function? onFieldSubmitted;

  /// Can set keyBoard Type from here (e.g TextInputType.numeric) by default it is set to text,
  final TextInputType textInputType;

  /// Can set RegExp from here.
  final List<TextInputFormatter>? inputFormatters;

  const AnimatedSearchbar({
    required this.textEditingController,
    required this.isOriginalAnimation,
    Key? key,
    this.searchBoxWidth,
    this.trailingIcon = Icons.search,
    this.secondaryButtonIcon = Icons.close,
    this.buttonIcon = Icons.search,
    this.hintText = "Search Here",
    this.searchBarColour = Colors.white,
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
    this.onRightSide = false,
    this.enableKeyboardFocus = false,
    this.enableBoxBorder = false,
    this.enableButtonBorder = false,
    this.enableButtonShadow = true,
    this.enableBoxShadow = true,
    this.textAlignToRight = false,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.enteredTextStyle,
    this.buttonElevation = 0,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _AnimatedSearchbarState createState() => _AnimatedSearchbarState();
}

class _AnimatedSearchbarState extends State<AnimatedSearchbar> with SingleTickerProviderStateMixin {
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
      boxShadow: <BoxShadow>[
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
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimatedSearchbarBody();
  }

  Widget _buildAnimatedSearchbarBody() {
    return Container(
      height: 60.0,
      alignment: widget.onRightSide ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: _isAnimationOn ? widget.searchBarColour : Colors.transparent,
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
                      BoxShadow(
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
          width: (!switcher) ? 48.0 : (widget.searchBoxWidth ?? MediaQuery.of(context).size.width),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: widget.durationInMilliSeconds),
                top: 6.0,
                left: widget.onRightSide ? 7.0 : null,
                right: !widget.onRightSide ? 7.0 : null,
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: (!switcher) ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 700),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
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
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    alignment: Alignment.topCenter,
                    width: (widget.searchBoxWidth ?? MediaQuery.of(context).size.width) / 1.7,
                    child: _textFormField(),
                  ),
                ),
              ),
              Align(
                alignment: widget.onRightSide ? Alignment.centerRight : Alignment.centerLeft,
                child: (widget.isOriginalAnimation)
                    ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: _isAnimationOn ? null : Border.all(color: widget.buttonBorderColour!),
                          ),
                          child: DecoratedBoxTransition(
                            decoration: decorationTween.animate(_animationController),
                            child: GestureDetector(
                              child: CircleAvatar(
                                backgroundColor: widget.buttonColour,
                                child: Icon(
                                  switcher ? widget.secondaryButtonIcon! : widget.buttonIcon!,
                                  size: 20.0,
                                  color:
                                      switcher ? widget.secondaryButtonIconColour : widget.buttonIconColour,
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
                                switcher ? widget.secondaryButtonIcon! : widget.buttonIcon!,
                                size: 20.0,
                                color: switcher ? widget.secondaryButtonIconColour : widget.buttonIconColour,
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

  /// This is the tap function for the animation style except the original animation style.
  void _onTapFunction() {
    _isAnimationOn = true;
    setState(
      () {
        if (!switcher) {
          switcher = true;
          setState(() {
            if (widget.enableKeyboardFocus) FocusScope.of(context).requestFocus(focusNode);
          });
          _animationController.forward().then((value) => {
                setState(() {
                  _isAnimationOn = true;
                })
              });
        } else {
          switcher = false;
          setState(() {
            if (widget.enableKeyboardFocus) {
              unFocusKeyboard();
            }
          });
          _animationController.reverse().then((value) => {
                setState(() {
                  _isAnimationOn = false;
                })
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
            if (widget.enableKeyboardFocus) FocusScope.of(context).requestFocus(focusNode);
          });
          _animationController.forward();
        } else {
          switcher = false;
          setState(() {
            if (widget.enableKeyboardFocus) {
              unFocusKeyboard();
            }
          });
          _animationController.reverse().then((value) => {
                setState(() {
                  _isAnimationOn = false;
                })
              });
        }
      },
    );
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
            : debugPrint('onFieldSubmitted Not Implemented');
      },
      onEditingComplete: () {
        unFocusKeyboard();
        setState(() {
          switcher = false;
        });
      },
      keyboardType: widget.textInputType,
      onChanged: (var value) {
        (widget.onChanged != null) ? widget.onChanged!(value) : debugPrint('onChanged Not Implemented');
      },
      onSaved: (var value) {
        (widget.onSaved != null) ? widget.onSaved!(value) : debugPrint('onSaved Not Implemented');
      },
      style: widget.enteredTextStyle != null ? widget.enteredTextStyle : TextStyle(color: Colors.black),
      cursorColor: widget.cursorColour,
      textAlign: widget.textAlignToRight ? TextAlign.right : TextAlign.left,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 5),
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintTextColour, //Color(0xff5B5B5B),
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
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

  /// This is for Focusing or unFocusing the keyboard on the tap of search button.
  void unFocusKeyboard() {
    final FocusScopeNode currentFocusScope = FocusScope.of(context);
    if (!currentFocusScope.hasPrimaryFocus && currentFocusScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
