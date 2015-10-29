//로그인 테이블 생성
CREATE TABLE  "LOGIN" 
   (	"IDX" NUMBER(8,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(4000), 
	"AGE" NUMBER(3,0), 
	"ADDR" VARCHAR2(4000), 
	"HIRE-DATE" DATE, 
	"IDXCODE" NUMBER NOT NULL ENABLE, 
	"PHONE" VARCHAR2(4000), 
	"SEX" VARCHAR2(4000), 
	 CONSTRAINT "LOGIN_PK" PRIMARY KEY ("IDX") ENABLE
   )
  기본 키값은 idx< 시퀀스를 넣어서 만듬 추후 게시판 테이블 제작시 idxcode를 참조하는 테이블 생성
  컬럼 내용 
  
  idx =  시퀀스 키( 인덱스열) 회원가입할때 value값은 = LOGEIN.SEQ 사용
  name =  이름 not null
  age = 나이
  addr = 주소
  hire-date = 가입날짜(insert문 사용시 sysdate 활용)
  idxcode = 주민번호 nop null
  phone =  전화번호
  sex = 성별
  
  //시퀀스 생성
  CREATE SEQUENCE   "LOGIN.SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE
  
  //게시판 테이블
  
  // 나머지 테이블들 추후 추가
  
  
  
  
  
  
  
  
  
  
