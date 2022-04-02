import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constant {
  static final List<String> imgList = [
    'https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1513884923967-4b182ef167ab?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1513885535751-8b9238bd345a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1487412912498-0447578fcca8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1526178613552-2b45c6c302f0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    'https://images.unsplash.com/photo-1472417583565-62e7bdeda490?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ];
  static const countryList = ["Afghanistan","Albania","Algeria",
    "Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam",
    "Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];
  static const ageRangeList=["15-20","20-40","50-60"];
  static const workList=["Administration","Art","It","Health Care"];
  static const salaryList=["less than 1000","1000-4000","4000 - 6000"];
  static const interestList=["game","sports","arts","movies"];
  static const int limit = 10;
  static const String appVersionNumber = '1.0.0';
  static const String appDbName = 'db.db';
  static const String appName = "Bella";
  static const String mapKey = "AIzaSyClUHoOJr09DpHyvz7wWtQIs7VYv3HihkU";
  static final NumberFormat priceTwoDecimalFormat = NumberFormat("#.##");
  static const String priceTwoDecimalFormatString = '###.00';
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static const String showLoveNotification = 'showLoveNotification';
  static const String showOrdersNotification = 'showOrdersNotification';
  static const String showOffersNotification = 'showOffersNotification';
  static const String userID = 'userId';
  static const String shippingFirstName = 'shippingFirstName';
  static const String shippingLastName = 'shippingLastName';
  static const String shippingEmail = 'shippingEmail';
  static const String shippingPhone = 'shippingPhone';
  static const String shippingAddress = 'shippingAddress';
  static const String shippingAddress2 = 'shippingAddress2';
  static const String shippingState = 'shippingState';
  static const String shippingCity = 'shippingCity';
  static const String shippingCityId = 'shippingCityId';
  static const String shippingCountry = 'shippingCountry';
  static const String shippingCountryId = 'shippingCountryId';
  static const String shippingPostalCode = 'shippingPostalCode';
  static const String shippingCompany = 'shippingCompany';
  //billing
  static const String billingFirstName = 'billingFirstName';
  static const String billingLastName = 'billingLastName';
  static const String billingEmail = 'billingEmail';
  static const String billingPhone = 'billingPhone';
  static const String billingAddress = 'billingAddress';
  static const String billingAddress2 = 'billingAddress2';
  static const String billingState = 'billingState';
  static const String billingCity = 'billingCity';
  static const String billingCityId = 'billingCityId';
  static const String billingCountry = 'billingCountry';
  static const String billingCountryId = 'billingCountryId';
  static const String billingPostalCode = 'billingPostalCode';
  
  static const String userToken = 'userToken';

  static const String userName = 'userName';
  static const String loginBySocialMedia="loginBySocialMedia";
  static const String userPhoto = 'userPhoto';
  static const String userPhone = 'userPhone';
  static const String userEmail = 'userEmail';
}
