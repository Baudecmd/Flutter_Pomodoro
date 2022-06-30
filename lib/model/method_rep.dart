
import 'dart:core';

import 'dart:ui';

class MethodRep {
    int workAmount,breakAmount;
    	MethodRep(this.workAmount, this.breakAmount);
      @override
  String toString() {
    // TODO: implement toString
    return  '$workAmount travail $breakAmount break';
  }
  }