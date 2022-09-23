void main() {
  var myList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];

  var myList2 = [
    for(var i in myList)
      i
  ];

  print(myList);
  print(myList2);

  var myList3 = [1, 2, 3,];
  var myList4 = [7, 8, 9, 0];

  var myList5 = [
    for(var i in myList3)
      i,
    for(var i in myList4)
      i,
  ];

  print(myList5);

  //nested list, 2-dimensional list
  var myList6 = [
    [1, 2, 3,],
    [4, 5, 6,],
    [7, 8, 9,],
  ];

  var mylist7 = [
    for(var sublist in myList6)
      for(var i in sublist)
        i
  ];

  print(mylist7);  //กลายเป็น list 1 มิติ
  print(myList6.length);
  print(mylist7.length);

  var myList8 = [1, 2, 3];

  for(var i = 0; i < myList8.length; i ++){
    print(myList8[i]);
  }
  for(var item in myList8){
    print(item);
  }
  //myList8.forEach(function /*ส่งไปเป็นค่าให้ foreach*/)
  //myList8.forEach((element) {})
  /*
  var f = myFunc;
  myList8.forEach(f);
  */
  //myList8.forEach(myFunc);
  //myList8.forEach((int num) => print(num));
  /*
  myList8.forEach((item) {
    print(item);
  });
  */
  /*
  myList8.forEach((element) {
    print(element);
  });
  */
  myList8.forEach((int num) {
    print(num);
  }); //ไม่ต้องสร้าง function ใหม่แล้วค่อยมาเรียกใช้แต่สามารถสร้างขึ้นมาใน forEach ได้เลย/เมธอด forEach คือ Higher-order function

  //การเขียน map, forEach = functional programming
  //result จะเท่ากับ [11, 12. 13]
  //map คือการแปลง list
  var result = myList8.map((item) {
    return item + 10;
  }).toList(); //ใช้ .toList() [11, 12, 13] จะถูกสร้างเป็น list ใหม่
}

//parameter ที่ส่งให้ myFunc ต้องเป็น type เดียวกับ list
/*void myFunc(int num){
  print(num);
}*/