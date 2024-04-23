// const x = new RegExp("~~~");
const reg01= /script/; //객체 생성(정규 표현식)
const str1 = "javascript shellscript";
const result1 = reg01.test(str1);
console.log(result1);

const reg02= /abc/; //객체 생성(정규 표현식)
const str2 = "helloabc";
const result2 = str2.replace(reg02, 'ㅋ');
console.log(result2);

const reg03= /script/gi; //객체 생성(정규 표현식)
const str3 = "javaScript shellscript";
const result3 = str3.replace(reg03, 'ㅋ');
console.log(result3);

const reg04= /\s/gi; //객체 생성(정규 표현식)
const str4 = "hello world";
const result4 = str4.replace(reg04, 'ㅋ');
console.log(result4);

const reg05= /./gi; //객체 생성(정규 표현식)
const str5 = "hello world";
const result5 = str5.replace(reg05, 'ㅋ');
console.log(result5);

const reg06= /[cal]/gi; //객체 생성(정규 표현식)
const str6 = "hello world";
const result6 = str6.replace(reg06, 'ㅋ');
console.log(result6);

const reg07= /com$/gi; //객체 생성(정규 표현식)
const str7 = "kh@naver.com";
const result7 = str7.replace(reg07, 'ㅋ');
console.log(result7);

const reg08= /\d{1,3}/gi; //객체 생성(정규 표현식)
const str8 = "hello123";
const result8 = str8.replace(reg08, 'ㅋ');
console.log(result8);

/*
    RegExp 객체에서 제공하는 메소드
        객체.test(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 false를 리턴한다.
        객체.exec(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 처음 매치된 문자열 리턴한다.
    
    String 객체에서 정규 표현식 객체를 이용하는 메소드
        문자열.match(정규식) : 문자열에서 정규식 패턴의 값과 일치하는 값을 리턴한다.
        문자열.replace(정규식, 바꿀값) : 문자열에서 정규식 패턴의 값과 일치하는 부분을 바꿀값으로 변경한다.
        문자열.search(정규식) : 문자열에서 정규식 패턴의 값과 일치하지 부분의 시작 인덱스를 리턴한다.
        문자열.split(정규식) : 문자열에서 정규식 패턴의 값과 일치하는 값을 구분자로 하여 배열을 생성하여 리턴한다.
*/

