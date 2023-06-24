import 'dart:ui';
// import 'package:flutter/material.dart';

class Dimensions {
  // var logicalScreenSize =
  //                   window.physicalSize / window.devicePixelRatio;
  //              static double width = logicalScreenSize.width;
  //              static double height = logicalScreenSize.height;

  // var pixelRatio = window.devicePixelRatio;
  // var physicalScreenSize = window.physicalSize;

  // var physicalWidth = physicalScreenSize.width;
  // var physicalHeight = physicalScreenSize.height;

  // static double viewHeight = MediaQuery.of(context).size.height;
  // static double viewWidth = MediaQuery.of(context).size.height;

  // static double homeMainImgHeight = viewHeight / 3;
}

//Without context

var pixelRatio = window.devicePixelRatio;

//Size in physical pixels
var physicalScreenSize = window.physicalSize;
var physicalWidth = physicalScreenSize.width;
var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
var padding = window.padding;

//Safe area paddings in logical pixels
var paddingLeft = window.padding.left / window.devicePixelRatio;
var paddingRight = window.padding.right / window.devicePixelRatio;
var paddingTop = window.padding.top / window.devicePixelRatio;
var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
var safeWidth = logicalWidth - paddingLeft - paddingRight;
var safeHeight = logicalHeight - paddingTop - paddingBottom;

//With context

//In logical pixels
// var width = MediaQuery.of(context).size.width;
// var height = MediaQuery.of(context).size.height;

// var padding = MediaQuery.of(context).padding;
// var safeHeight = height - padding.top - padding.bottom;
