class StringUtil {

  static String friendlyCount(int count) {
    if(count < 10000) {
      return '${count}';
    }else if(count >= 10000) {
      return '${formatNum(count / 10000.0, 1)}万';
    }
  }

  static formatNum(double num,int postion){
    if((num.toString().length-num.toString().lastIndexOf(".")-1)<postion){
      //小数点后有几位小数
      return num.toStringAsFixed(postion).substring(0,num.toString().lastIndexOf(".")+postion+1).toString();
    }else{
      return num.toString().substring(0,num.toString().lastIndexOf(".")+postion+1).toString();
    }
  }

}