import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ss/app/core/helper/colors.dart';
import 'package:ss/app/core/helper/images_resources.dart';
import 'package:ss/app/core/helper/text_style.dart';
import 'package:ss/app/core/helper/validations.dart';

class CommonTextField extends StatefulWidget {
  String? hintText;
  String? prefixText;
  bool? obscureText = false, enabled;
  bool? enabledTextField = true;
  TextInputType? textInputType;
  int? maxLength;
  int? minLength;
  int? maxLines = 1;
  TextInputAction? textInputAction;
  String? error;
  TextEditingController? controller;
  ValidateTypes? validateTypes;
  ValidateState? validateState;
  Widget? suffixIcon;
  String? suffixText;
  bool? isVerifyButton;
  bool? isShowError;
  bool? showCounterText;
  List<TextInputFormatter>? inputFormat;
  Function(String)? onCountText;
  bool? isCounterCallback;
  int? counter;
  String? labelText;
  Function? applyPromo;
  String? errorMsg;
  FocusNode? focusNext;
  FocusNode? focusNode;
  bool? isOptional = false;
  int? minLines;
  void Function(String)? onChange;
  void Function(String)? onSubmit;
  void Function(String)? onEdite;
  TextCapitalization? textCapitalization;
  Widget? prefix;
  Color? fillColor;
  bool? showBorder = true;
  Color? borderColor;
  bool? showBoxShadow = true;
  bool? decoration;
  bool? isBio = false;
  bool? isImage = false;

  CommonTextField(
      {Key? key,
      this.maxLength,
      this.minLength,
      this.error,
      this.textInputAction,
      this.maxLines,
      @required this.hintText,
      this.obscureText = false,
      this.enabled,
      this.textInputType,
      @required this.controller,
      this.validateTypes,
      this.validateState,
      this.suffixIcon,
      this.suffixText,
      this.enabledTextField,
      this.isVerifyButton,
      this.isShowError,
      this.inputFormat,
      this.onCountText,
      this.isCounterCallback = false,
      this.showCounterText = false,
      this.counter,
      this.applyPromo,
      this.labelText,
      this.errorMsg,
      this.focusNext,
      this.focusNode,
      this.isOptional = false,
      this.minLines,
      this.prefixText = "",
      this.onChange,
      this.onSubmit,
      this.textCapitalization,
      this.fillColor,
      this.prefix,
      this.showBorder = true,
      this.borderColor,
      this.showBoxShadow = true,
      this.decoration,
      this.isBio,
      this.isImage = false,
      this.onEdite})
      : super(key: key);

  @override
  CommonTextFieldState createState() => CommonTextFieldState();
}

class CommonTextFieldState extends State<CommonTextField> {
  FocusNode? _focusNode;
  bool isFocus = false;
  String? hintText;
  bool? enabled;
  TextInputType? textInputType;
  int? maxLength;
  int? maxLines;

  TextInputAction? textInputAction;
  TextEditingController? controller;
  ValidateTypes? validateTypes;
  bool? isVerifyButton;
  bool? isVerify;
  String? errorMsg;
  FocusNode? focusNext;
  bool? isOptional;
  String? text = "";
  ValidateState? validateState;
  String? error;
  int? counter;
  bool? isBio = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    } else {
      _focusNode = widget.focusNode;
      _focusNode!.addListener(() {
        setState(() {
          isFocus = _focusNode!.hasFocus;
        });
        if (!_focusNode!.hasFocus) {
          checkValidation(_focusNode!.hasFocus);
        }
      });
    }
    if (widget.controller != null) {
      widget.controller!.selection = TextSelection.fromPosition(
          TextPosition(offset: widget.controller!.text.length));
    }
    widget.enabled ??= true;
    widget.maxLines ??= 1;
    widget.textInputAction ??= TextInputAction.next;
    widget.error ??= "";
    widget.validateTypes ??= ValidateTypes.empty;
    widget.validateState ??= ValidateState.initial;
    widget.isVerifyButton ??= false;
    widget.decoration ??= true;
    hintText = widget.hintText;
    enabled = widget.enabled;
    textInputType = widget.textInputType;
    maxLength = widget.maxLength;
    maxLines = widget.maxLines;
    textInputAction = widget.textInputAction;
    error = widget.error;
    controller = widget.controller;
    validateTypes = widget.validateTypes;
    validateState = widget.validateState;
    isVerifyButton = widget.isVerifyButton;
    focusNext = widget.focusNext;
    isOptional = widget.isOptional;
    isVerify = widget.isShowError;
    isBio = widget.isBio ?? false;

    if (controller != null && controller!.text.isNotEmpty) {
      checkValidation(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  widget.labelText ?? "",
                  style: TextStyles.normal(
                      fontSize: 14.0.sp, fontColor: secondaryColor),
                ),
              ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: secondaryColor)),
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: widget.prefix ?? SizedBox.shrink(),
              ),
              Expanded(
                child: TextField(
                  enabled: widget.enabledTextField ?? true,
                  textInputAction: textInputAction,
                  keyboardType: widget.textInputType,
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLines ?? 1,
                  obscureText: widget.obscureText ?? false,
                  autofocus: false,
                  focusNode: widget.focusNode,
                  onSubmitted: (v) {
                    if (widget.focusNode == widget.focusNext) {
                      FocusScope.of(context).unfocus();
                    } else {
                      FocusScope.of(context).requestFocus(widget.focusNext);
                    }
                  },
                  inputFormatters: widget.inputFormat ?? [trimSpaceAndSimbl()],
                  onChanged: ((val) {
                    if (widget.onChange != null) {
                      widget.onChange!(val);
                    }

                    checkValidation(isFocus);
                  }),
                  onEditingComplete: () {
                    widget.onEdite;
                  },
                  style:
                      TextStyles.normal(fontColor: blackColor, fontSize: 14.sp),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    prefixText: widget.prefixText ?? "",
                    prefixStyle: TextStyles.normal(
                        fontSize: 14.sp, fontColor: blackColor),
                    hintStyle: TextStyles.normal(
                        fontColor: whiteColor, fontSize: 14.sp),
                    counterText: "",
                    contentPadding: isBio!
                        ? const EdgeInsets.only(top: 12)
                        : widget.suffixIcon == null
                            ? const EdgeInsets.all(0.0)
                            : const EdgeInsets.only(top: 0),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  controller: controller,
                ),
              ),
              widget.suffixIcon == null
                  ? validateState == ValidateState.validate
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SvgPicture.asset(SvgResources.checkedIc),
                        )
                      : const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: widget.suffixIcon)
            ],
          ),
        ),
        (widget.isShowError == null ? true : false)
            ? (validateState == ValidateState.inValidate && error!.isNotEmpty)
                ? Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: const Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 12.0,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        error!,
                        style: TextStyles.normal(
                            fontColor: Colors.red, fontSize: 14.0.sp),
                      )
                    ],
                  )
                : const SizedBox(height: 30)
            : const SizedBox(height: 0),
      ],
    );
  }

  trimSpaceAndSimbl() {
    if (widget.validateTypes == ValidateTypes.empty) {
      return FilteringTextInputFormatter.deny(RegExp(r""));
    }
    if (widget.validateTypes == ValidateTypes.password) {
      return FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"));
    }
    if (widget.validateTypes == ValidateTypes.reEnterPassword) {
      return FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"));
    }
    if (widget.validateTypes == ValidateTypes.email) {
      return FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"));
    }
    if (widget.validateTypes == ValidateTypes.mobile) {
      return FilteringTextInputFormatter.allow(RegExp("[0-9]"));
    }
    if (widget.validateTypes == ValidateTypes.zipCode) {
      return FilteringTextInputFormatter.allow(RegExp("[0-9]"));
    }

    if (widget.validateTypes == ValidateTypes.name) {
      return FilteringTextInputFormatter.deny(RegExp(r'[/\\]'));
    }
    if (widget.validateTypes == ValidateTypes.userName) {
      return FilteringTextInputFormatter.deny(RegExp(r'[/\\]'));
    }
    if (widget.validateTypes == ValidateTypes.amount) {
      return FilteringTextInputFormatter.deny(RegExp(r'[/\\]'));
    }
    if (widget.validateTypes == ValidateTypes.cvv) {
      return FilteringTextInputFormatter.deny(RegExp(r'[/\\]'));
    }
    if (widget.validateTypes == ValidateTypes.pan) {
      return FilteringTextInputFormatter.deny(RegExp(r'[/\\]'));
    }
  }

  bool checkValidation([bool isFocus = false]) {
    String errorText = "";
    var isCheck = true;
    if (isOptional! && controller!.text.isEmpty) {
      isCheck = false;
    }
    if (isCheck) {
      switch (validateTypes!) {
        case ValidateTypes.amount:
          {
            errorText = Validations.validateAmount(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.name:
          {
            errorText = Validations.validateName(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.empty:
          {
            errorText = Validations.validateEmpty(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString(),
                isImage: widget.isImage);
            break;
          }
        case ValidateTypes.email:
          {
            errorText = Validations.validateEmail(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.mobile:
          {
            errorText = Validations.validateMobile(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.userName:
          {
            errorText = Validations.validateUserName(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.reEnterPassword:
          {
            errorText = Validations.validateReEnterPassword(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.password:
          {
            errorText = Validations.validatePassword(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.zipCode:
          {
            errorText = Validations.validateZip(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.cvv:
          {
            errorText = Validations.validateCVV(
                controller!.text.trim(),
                widget.errorMsg == null
                    ? hintText.toString()
                    : widget.errorMsg.toString());
            break;
          }
        case ValidateTypes.pan:
          // TODO: Handle this case.
          break;
      }
    }

    if (errorText.isNotEmpty) {
      if (validateState != ValidateState.inValidate) {
        setState(() {
          validateState = ValidateState.inValidate;
        });
      }
      if (!isFocus) {
        setState(() {
          error = errorText;
        });
      } else if (error!.isNotEmpty) {
        setState(() {
          error = "";
        });
      }
      return true;
    } else {
      if (validateState != ValidateState.validate) {
        setState(() {
          error = "";
          validateState = ValidateState.validate;
        });
      }
      return false;
    }
  }

  void setError(String errorText) {
    if (validateState != ValidateState.inValidate) {
      setState(() {
        validateState = ValidateState.inValidate;
      });
    }
    setState(() {
      error = errorText;
    });
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    debugPrint(newValue.text);
    return TextEditingValue(
      text: newValue.text.toUpperCase().toString(),
      selection: newValue.selection,
    );
  }
}

enum ValidateTypes {
  email,
  mobile,
  password,
  reEnterPassword,
  name,
  zipCode,
  empty,
  userName,
  cvv,
  pan,
  amount,
}

enum ValidateState { initial, validate, inValidate }
