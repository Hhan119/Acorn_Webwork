-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE user_info(
id VARCHAR2(100) CONSTRAINT user_info_id_pk PRIMARY KEY,
pwd VARCHAR2(100) CONSTRAINT user_info_pwd_nn NOT NULL,
email VARCHAR2(100),
profile VARCHAR2(100), -- 프로필 이미지 경로를 저장할 컬럼
regdate DATE -- 가입일
);

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	orgFileName VARCHAR2(100) NOT NULL,
	saveFileName VARCHAR2(100) NOT NULL,
	fileSize NUMBER NOT NUll,
	regdate DATE -- 가입일
);

CREATE SEQUENCE board_file_seq;

--- 게시글을 저장할 테이블 
CREATE TABLE board_cafe(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE --글 작성일

CREATE SEQUENCE board_cafe_seq;

-- 어떤 세션에서 몇 번글을 읽었는지 정보를 저장 할 테이블
CREATE TABLE readed_data(
	num NUMBER REFERENCES board_cafe(num),
	session_id VARCHAR2(50)
	)