CREATE DATABASE seconddisplay;

CREATE TABLE seconddisplay.`user` (
	`USER_NO`	INT	NOT NULL	AUTO_INCREMENT PRIMARY KEY	COMMENT '회원번호',
	`USER_ID`	VARCHAR(100)	NOT NULL	COMMENT '회원아이디',
	`USER_PW`	VARCHAR(100)	NOT NULL	COMMENT '회원 비밀번호(암호화 적용)',
	`USER_NM`	VARCHAR(20)	NOT NULL	COMMENT '회원닉네임',
	`USER_STATUS`	CHAR(1)	NOT NULL	COMMENT '탈퇴여부(A : 활동가능,  D:  탈퇴)',
	`ENROLL_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '회원가입일'
);

CREATE TABLE seconddisplay.`goods` (
	`GOODS_NO`	INT	NOT NULL	AUTO_INCREMENT PRIMARY KEY	COMMENT '상품게시글 번호',
	`USER_NO`	INT	NOT NULL	COMMENT '회원번호',
	`CATEGORY_NO`	INT	NOT NULL	COMMENT '상품 카테고리 번호',
	`GOODS_TITLE`	VARCHAR(50)	NOT NULL	COMMENT '상품 제목(상품 이름)',
	`GOODS_DESCR`	VARCHAR(1000)	NOT NULL	COMMENT '상품 상세 설명',
	`GOODS_PRICES`	INT	NOT NULL	COMMENT '상품 책정 가격',
	`VIEW_COUNT`	INT	NOT NULL	COMMENT '상품 조회수',
	`SELL_ENROLL_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '상품 등록일',
	`GOODS_STATUS`	CHAR(1)	NOT NULL	COMMENT '상품 상태(A:판매중 B:비공개  S:임시저장  D:삭제 E:판매완료 P:예약중)'
);

CREATE TABLE seconddisplay.`categories` (
	`CATEGORY_NO`	INT	NOT NULL	AUTO_INCREMENT PRIMARY KEY	COMMENT '상품 카테고리 번호',
	`CATEGORY_NAME`	VARCHAR(20)	NOT NULL	COMMENT '카테고리 이름'
);

CREATE TABLE seconddisplay.`files` (
	`FILE_NO`	INT	NOT NULL	AUTO_INCREMENT PRIMARY KEY	COMMENT '파일 번호',
	`GOODS_NO`	INT	NOT NULL	COMMENT '상품게시글 번호',
	`FILE_ORDER`	INT	NOT NULL	COMMENT '파일 순서(1번이 썸네일)',
	`FILE_PATH`	VARCHAR(500)	NOT NULL	COMMENT '파일경로'
);

CREATE TABLE seconddisplay.`chat_room` (
	`CHATROOM_NO`	INT	NOT NULL	AUTO_INCREMENT	PRIMARY KEY 	COMMENT '채팅방 번호',
	`GOODS_NO`	INT	NOT NULL	COMMENT '상품게시글 번호',
	`USER_NO`	INT	NOT NULL	COMMENT '구매 회원 번호',
	`CREATE_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '채팅방 생성일자'
);

CREATE TABLE seconddisplay.`chat_message` (
	`MESSAGE_NO`	INT	NOT NULL	AUTO_INCREMENT 	PRIMARY KEY	COMMENT '채팅 메세지 번호',
	`CHATROOM_NO`	INT	NOT NULL	COMMENT '채팅방 번호',
	`USER_NO`	INT	NOT NULL	COMMENT '구매 회원 번호',
	`READ_MESSAGE`	CHAR(1)	NOT NULL	DEFAULT 'N'	COMMENT '채팅 메시지 읽음 여부(N: 안읽음 Y: 읽음)',
	`MESSAGE`	VARCHAR(300)	NOT NULL	COMMENT '채팅 메세지',
	`MESSAGE_SEND_DT`	DATETIME	NOT NULL	DEFAULT NOW()	COMMENT '메세지 전송 날짜'
);


ALTER TABLE seconddisplay.`goods` ADD CONSTRAINT `FK_user_TO_goods_1` FOREIGN KEY (
	`USER_NO`
)
REFERENCES `user` (
	`USER_NO`
);

ALTER TABLE seconddisplay.`goods` ADD CONSTRAINT `FK_categories_TO_goods_1` FOREIGN KEY (
	`CATEGORY_NO`
)
REFERENCES seconddisplay.`categories` (
	`CATEGORY_NO`
);

ALTER TABLE seconddisplay.`files` ADD CONSTRAINT `FK_goods_TO_files_1` FOREIGN KEY (
	`GOODS_NO`
)
REFERENCES seconddisplay.`goods` (
	`GOODS_NO`
);

ALTER TABLE seconddisplay.`chat_room` ADD CONSTRAINT `FK_goods_TO_chat_room_1` FOREIGN KEY (
	`GOODS_NO`
)
REFERENCES seconddisplay.`goods` (
	`GOODS_NO`
);

ALTER TABLE seconddisplay.`chat_room` ADD CONSTRAINT `FK_user_TO_chat_room_1` FOREIGN KEY (
	`USER_NO`
)
REFERENCES seconddisplay.`user` (
	`USER_NO`
);

ALTER TABLE seconddisplay.`chat_message` ADD CONSTRAINT `FK_chat_room_TO_chat_message_1` FOREIGN KEY (
	`CHATROOM_NO`
)
REFERENCES seconddisplay.`chat_room` (
	`CHATROOM_NO`
);

ALTER TABLE seconddisplay.`chat_message` ADD CONSTRAINT `FK_chat_room_TO_chat_message_2` FOREIGN KEY (
	`USER_NO`
)
REFERENCES seconddisplay.`chat_room` (
	`USER_NO`
);

