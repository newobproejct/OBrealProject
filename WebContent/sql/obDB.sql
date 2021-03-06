
----------------------------------------------------------------------------------------------------------
-- 시퀸스
----------------------------------

CREATE SEQUENCE obhotel_user_seq START WITH 2 INCREMENT BY 1;
CREATE SEQUENCE obhotel_admin_seq START WITH 2 INCREMENT BY 1;
CREATE SEQUENCE obhotel_board_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE obhotel_board_file_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE obhotel_board_reply_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE obhotel_room_type_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE obhotel_room_file_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE obhotel_room_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE obhotel_room_eval_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE obhotel_reservation_seq START WITH 1 INCREMENT BY 1;
commit;

----------------------------------------------------------------------------------------------------------
-- 로그인
-------------------------------

CREATE TABLE obhotel_user (
	id			NUMBER NOT NULL,		-- 사용자 고유번호
	account		VARCHAR2(20) NOT NULL,	-- 계정명
	password	VARCHAR2(20) NOT NULL,	-- 비밀번호
	nickname	VARCHAR2(20) NOT NULL,	-- 사용자명
	birthday	DATE NOT NULL,			-- 생일
	zipcode		VARCHAR(5) NOT NULL,	-- 우편번호
	address1	VARCHAR2(200) NOT NULL,	-- 주소1  (서울시) // (경주시) // (부산)
	address2	VARCHAR2(200) NOT NULL,	-- 주소2  마포구 ~~~~
	email		VARCHAR2(80) NOT NULL,	-- 이메일 (FIXME: 길이 조절 필요)
	e_confirm	NUMBER(1) NOT NULL,		-- 이메일 소식 수신 여부  // 이벤트 소식 수신 여부
	tel			VARCHAR(11) NOT NULL,	-- 연락처
	CONSTRAINT obhotel_user_pk PRIMARY KEY (id)  -- obhotel_user_pk 라는 이름으로 id를 primary key로 지정
);

-------------------------------
-- 관리자 목록
-------------------------------

CREATE TABLE obhotel_admin (
	id			NUMBER NOT NULL,		-- 관리자 고유번호
	user_id		NUMBER NOT NULL,		-- 사용자 고유번호
	lv			NUMBER NOT NULL,		-- 관리자 레벨
	CONSTRAINT obhotel_admin_pk PRIMARY KEY (id), --obhotel_admin_pk라는 별칭으로 id를 프라이머리키로 지정
	CONSTRAINT obhotel_admin_user_id_fk FOREIGN KEY (user_id) REFERENCES obhotel_user (id) 
    -- obhotel_admin_user_id_fk 라는 별칭으로 외래키 지정 (obhotel_user의 id를 참조하며)
);

-------------------------------
-- 쿼리 샘플
-------------------------------

INSERT INTO obhotel_user VALUES (1, 'admin', '1234', 'admin', sysdate, '12345', '서울시', '마포구 노고산동', 'admin@obhotel.com', 0, '01012345678');
INSERT INTO obhotel_admin VALUES (1, 1, 1);

-- INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, '아이디', '비밀번호', '닉네임', '생일', '우편번호', '주소1', '주소2', '이메일', 수신동의0/1, '연락처 00000000000');
-- INSERT INTO obhotel_admin VALUES (obhotel_admin_seq.nextval, 사용자고유번호, 관리자레벨);

INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user1', '1234', '사용자1', '99/2/1', 23456, '주소x1', '주소1', 'user1@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user2', '1234', '사용자2', '99/3/1', 46912, '주소x2', '주소2', 'user2@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user3', '1234', '사용자3', '99/4/1', 70368, '주소x3', '주소3', 'user3@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user4', '1234', '사용자4', '99/5/1', 93824, '주소x4', '주소4', 'user4@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user5', '1234', '사용자5', '99/6/1', 17280, '주소x5', '주소5', 'user5@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user6', '1234', '사용자6', '99/7/1', 40736, '주소x6', '주소6', 'user6@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user7', '1234', '사용자7', '99/8/1', 64192, '주소x7', '주소7', 'user7@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user8', '1234', '사용자8', '99/9/1', 87648, '주소x8', '주소8', 'user8@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user9', '1234', '사용자9', '99/10/1', 11104, '주소x9', '주소9', 'user9@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user10', '1234', '사용자10', '99/11/1', 34560, '주소x10', '주소10', 'user10@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user11', '1234', '사용자11', '99/1/1', 58016, '주소x11', '주소11', 'user11@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user12', '1234', '사용자12', '99/2/1', 81472, '주소x12', '주소12', 'user12@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user13', '1234', '사용자13', '99/3/1', 4928, '주소x13', '주소13', 'user13@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user14', '1234', '사용자14', '99/4/1', 28384, '주소x14', '주소14', 'user14@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user15', '1234', '사용자15', '99/5/1', 51840, '주소x15', '주소15', 'user15@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user16', '1234', '사용자16', '99/6/1', 75296, '주소x16', '주소16', 'user16@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user17', '1234', '사용자17', '99/7/1', 98752, '주소x17', '주소17', 'user17@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user18', '1234', '사용자18', '99/8/1', 22208, '주소x18', '주소18', 'user18@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user19', '1234', '사용자19', '99/9/1', 45664, '주소x19', '주소19', 'user19@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user20', '1234', '사용자20', '99/10/1', 69120, '주소x20', '주소20', 'user20@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user21', '1234', '사용자21', '99/11/1', 92576, '주소x21', '주소21', 'user21@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user22', '1234', '사용자22', '99/1/1', 16032, '주소x22', '주소22', 'user22@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user23', '1234', '사용자23', '99/2/1', 39488, '주소x23', '주소23', 'user23@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user24', '1234', '사용자24', '99/3/1', 62944, '주소x24', '주소24', 'user24@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user25', '1234', '사용자25', '99/4/1', 86400, '주소x25', '주소25', 'user25@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user26', '1234', '사용자26', '99/5/1', 9856, '주소x26', '주소26', 'user26@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user27', '1234', '사용자27', '99/6/1', 33312, '주소x27', '주소27', 'user27@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user28', '1234', '사용자28', '99/7/1', 56768, '주소x28', '주소28', 'user28@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user29', '1234', '사용자29', '99/8/1', 80224, '주소x29', '주소29', 'user29@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user30', '1234', '사용자30', '99/9/1', 3680, '주소x30', '주소30', 'user30@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user31', '1234', '사용자31', '99/10/1', 27136, '주소x31', '주소31', 'user31@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user32', '1234', '사용자32', '99/11/1', 50592, '주소x32', '주소32', 'user32@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user33', '1234', '사용자33', '99/1/1', 74048, '주소x33', '주소33', 'user33@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user34', '1234', '사용자34', '99/2/1', 97504, '주소x34', '주소34', 'user34@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user35', '1234', '사용자35', '99/3/1', 20960, '주소x35', '주소35', 'user35@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user36', '1234', '사용자36', '99/4/1', 44416, '주소x36', '주소36', 'user36@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user37', '1234', '사용자37', '99/5/1', 67872, '주소x37', '주소37', 'user37@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user38', '1234', '사용자38', '99/6/1', 91328, '주소x38', '주소38', 'user38@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user39', '1234', '사용자39', '99/7/1', 14784, '주소x39', '주소39', 'user39@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user40', '1234', '사용자40', '99/8/1', 38240, '주소x40', '주소40', 'user40@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user41', '1234', '사용자41', '99/9/1', 61696, '주소x41', '주소41', 'user41@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user42', '1234', '사용자42', '99/10/1', 85152, '주소x42', '주소42', 'user42@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user43', '1234', '사용자43', '99/11/1', 8608, '주소x43', '주소43', 'user43@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user44', '1234', '사용자44', '99/1/1', 32064, '주소x44', '주소44', 'user44@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user45', '1234', '사용자45', '99/2/1', 55520, '주소x45', '주소45', 'user45@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user46', '1234', '사용자46', '99/3/1', 78976, '주소x46', '주소46', 'user46@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user47', '1234', '사용자47', '99/4/1', 2432, '주소x47', '주소47', 'user47@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user48', '1234', '사용자48', '99/5/1', 25888, '주소x48', '주소48', 'user48@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user49', '1234', '사용자49', '99/6/1', 49344, '주소x49', '주소49', 'user49@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user50', '1234', '사용자50', '99/7/1', 72800, '주소x50', '주소50', 'user50@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user51', '1234', '사용자51', '99/8/1', 96256, '주소x51', '주소51', 'user51@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user52', '1234', '사용자52', '99/9/1', 19712, '주소x52', '주소52', 'user52@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user53', '1234', '사용자53', '99/10/1', 43168, '주소x53', '주소53', 'user53@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user54', '1234', '사용자54', '99/11/1', 66624, '주소x54', '주소54', 'user54@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user55', '1234', '사용자55', '99/1/1', 90080, '주소x55', '주소55', 'user55@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user56', '1234', '사용자56', '99/2/1', 13536, '주소x56', '주소56', 'user56@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user57', '1234', '사용자57', '99/3/1', 36992, '주소x57', '주소57', 'user57@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user58', '1234', '사용자58', '99/4/1', 60448, '주소x58', '주소58', 'user58@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user59', '1234', '사용자59', '99/5/1', 83904, '주소x59', '주소59', 'user59@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user60', '1234', '사용자60', '99/6/1', 7360, '주소x60', '주소60', 'user60@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user61', '1234', '사용자61', '99/7/1', 30816, '주소x61', '주소61', 'user61@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user62', '1234', '사용자62', '99/8/1', 54272, '주소x62', '주소62', 'user62@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user63', '1234', '사용자63', '99/9/1', 77728, '주소x63', '주소63', 'user63@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user64', '1234', '사용자64', '99/10/1', 1184, '주소x64', '주소64', 'user64@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user65', '1234', '사용자65', '99/11/1', 24640, '주소x65', '주소65', 'user65@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user66', '1234', '사용자66', '99/1/1', 48096, '주소x66', '주소66', 'user66@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user67', '1234', '사용자67', '99/2/1', 71552, '주소x67', '주소67', 'user67@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user68', '1234', '사용자68', '99/3/1', 95008, '주소x68', '주소68', 'user68@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user69', '1234', '사용자69', '99/4/1', 18464, '주소x69', '주소69', 'user69@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user70', '1234', '사용자70', '99/5/1', 41920, '주소x70', '주소70', 'user70@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user71', '1234', '사용자71', '99/6/1', 65376, '주소x71', '주소71', 'user71@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user72', '1234', '사용자72', '99/7/1', 88832, '주소x72', '주소72', 'user72@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user73', '1234', '사용자73', '99/8/1', 12288, '주소x73', '주소73', 'user73@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user74', '1234', '사용자74', '99/9/1', 35744, '주소x74', '주소74', 'user74@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user75', '1234', '사용자75', '99/10/1', 59200, '주소x75', '주소75', 'user75@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user76', '1234', '사용자76', '99/11/1', 82656, '주소x76', '주소76', 'user76@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user77', '1234', '사용자77', '99/1/1', 6112, '주소x77', '주소77', 'user77@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user78', '1234', '사용자78', '99/2/1', 29568, '주소x78', '주소78', 'user78@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user79', '1234', '사용자79', '99/3/1', 53024, '주소x79', '주소79', 'user79@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user80', '1234', '사용자80', '99/4/1', 76480, '주소x80', '주소80', 'user80@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user81', '1234', '사용자81', '99/5/1', 99936, '주소x81', '주소81', 'user81@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user82', '1234', '사용자82', '99/6/1', 23392, '주소x82', '주소82', 'user82@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user83', '1234', '사용자83', '99/7/1', 46848, '주소x83', '주소83', 'user83@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user84', '1234', '사용자84', '99/8/1', 70304, '주소x84', '주소84', 'user84@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user85', '1234', '사용자85', '99/9/1', 93760, '주소x85', '주소85', 'user85@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user86', '1234', '사용자86', '99/10/1', 17216, '주소x86', '주소86', 'user86@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user87', '1234', '사용자87', '99/11/1', 40672, '주소x87', '주소87', 'user87@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user88', '1234', '사용자88', '99/1/1', 64128, '주소x88', '주소88', 'user88@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user89', '1234', '사용자89', '99/2/1', 87584, '주소x89', '주소89', 'user89@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user90', '1234', '사용자90', '99/3/1', 11040, '주소x90', '주소90', 'user90@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user91', '1234', '사용자91', '99/4/1', 34496, '주소x91', '주소91', 'user91@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user92', '1234', '사용자92', '99/5/1', 57952, '주소x92', '주소92', 'user92@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user93', '1234', '사용자93', '99/6/1', 81408, '주소x93', '주소93', 'user93@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user94', '1234', '사용자94', '99/7/1', 4864, '주소x94', '주소94', 'user94@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user95', '1234', '사용자95', '99/8/1', 28320, '주소x95', '주소95', 'user95@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user96', '1234', '사용자96', '99/9/1', 51776, '주소x96', '주소96', 'user96@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user97', '1234', '사용자97', '99/10/1', 75232, '주소x97', '주소97', 'user97@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user98', '1234', '사용자98', '99/11/1', 98688, '주소x98', '주소98', 'user98@gmail.com', 0, '00000000011');
INSERT INTO obhotel_user VALUES (obhotel_user_seq.nextval, 'user99', '1234', '사용자99', '99/1/1', 22144, '주소x99', '주소99', 'user99@gmail.com', 0, '00000000011');
commit;


----------------------------------------------------------------------------------------------------------
-- 공지사항, 이벤트 (게시판)
-------------------------------

CREATE TABLE obhotel_board (
	id			NUMBER NOT NULL,		-- 게시물 고유번호
	user_id		NUMBER NOT NULL,		-- 작성자 고유번호
	board_type		NUMBER NOT NULL,		-- 게시물 종류 (0:잘못된값/1:공지사항/2:이벤트/3:방명록/4:ex-프리미엄후기 )
	title		VARCHAR2(40) NOT NULL,	-- 제목
	content		VARCHAR2(400) NOT NULL,	-- 내용
	write_date	DATE NOT NULL,			-- 작성일
	read_count	NUMBER NOT NULL,		-- 조회수
    --- 게시판 db에는 회원 정보 password가 들어가면 안될듯 다 세션에 받아 일치하는지 값 비교
	
	CONSTRAINT obhotel_board_pk PRIMARY KEY (id),
	CONSTRAINT obhotel_board_user_id_fk FOREIGN KEY (user_id) REFERENCES obhotel_user (id)
    -- update insert --> vo.get 해서 외래키 값 꼭 넣어주기  // 삭제할때는 게시물 고유번호 id 값만 지우도록
    --간략하게 id를 프라이머리키로 지정
    --obhotel_user 아이디를 참고하여 user_id
);

-- INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, ...);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 2, '이벤트제목1', '이벤트내용1', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 2, '이벤트제목2', '이벤트내용2', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 2, '이벤트제목3', '이벤트내용3', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 2, '이벤트제목4', '이벤트내용4', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 2, '이벤트제목5', '이벤트내용5', sysdate, 0);



INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 1, '공지사항제목1', '공지사항내용1', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 1, '공지사항제목2', '공지사항내용2', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 1, '공지사항제목3', '공지사항내용3', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 1, '공지사항제목4', '공지사항내용4', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 1, '공지사항제목5', '공지사항내용5', sysdate, 0);



INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목1', '방명록내용1', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목3', '방명록내용2', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목3', '방명록내용3', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목4', '방명록내용4', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목5', '방명록내용5', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목6', '방명록내용6', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목7', '방명록내용7', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목8', '방명록내용8', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목9', '방명록내용9', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목10', '방명록내용10', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목11', '방명록내용11', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목012', '방명록내용012', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목013', '방명록내용013', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목014', '방명록내용014', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목015', '방명록내용015', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목016', '방명록내용016', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목017', '방명록내용017', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목018', '방명록내용018', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목019', '방명록내용019', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목020', '방명록내용020', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목021', '방명록내용021', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목022', '방명록내용022', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목023', '방명록내용023', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목024', '방명록내용024', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목025', '방명록내용025', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목026', '방명록내용026', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목027', '방명록내용027', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목028', '방명록내용028', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목029', '방명록내용029', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목030', '방명록내용030', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목031', '방명록내용031', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목032', '방명록내용032', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목033', '방명록내용033', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목034', '방명록내용034', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목035', '방명록내용035', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목036', '방명록내용036', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목037', '방명록내용037', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목038', '방명록내용038', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목039', '방명록내용039', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목040', '방명록내용040', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목041', '방명록내용041', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목042', '방명록내용042', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목043', '방명록내용043', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목044', '방명록내용044', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목045', '방명록내용045', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목046', '방명록내용046', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목047', '방명록내용047', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목048', '방명록내용048', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목049', '방명록내용049', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목050', '방명록내용050', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목051', '방명록내용051', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목052', '방명록내용052', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목053', '방명록내용053', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목054', '방명록내용054', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목055', '방명록내용055', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목056', '방명록내용056', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목057', '방명록내용057', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목058', '방명록내용058', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목059', '방명록내용059', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목060', '방명록내용060', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목061', '방명록내용061', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목062', '방명록내용062', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목063', '방명록내용063', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목064', '방명록내용064', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목065', '방명록내용065', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목066', '방명록내용066', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목067', '방명록내용067', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목068', '방명록내용068', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목069', '방명록내용069', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목070', '방명록내용070', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목071', '방명록내용071', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목072', '방명록내용072', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목073', '방명록내용073', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목074', '방명록내용074', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목075', '방명록내용075', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목076', '방명록내용076', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목077', '방명록내용077', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목078', '방명록내용078', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목079', '방명록내용079', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목080', '방명록내용080', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목081', '방명록내용081', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목082', '방명록내용082', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목083', '방명록내용083', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목084', '방명록내용084', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목085', '방명록내용085', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목086', '방명록내용086', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목087', '방명록내용087', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목088', '방명록내용088', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목089', '방명록내용089', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목090', '방명록내용090', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목091', '방명록내용091', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목092', '방명록내용092', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목093', '방명록내용093', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목094', '방명록내용094', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목095', '방명록내용095', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목096', '방명록내용096', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목097', '방명록내용097', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목098', '방명록내용098', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목099', '방명록내용099', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목100', '방명록내용100', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목101', '방명록내용101', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목102', '방명록내용102', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목103', '방명록내용103', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목104', '방명록내용104', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목105', '방명록내용105', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목106', '방명록내용106', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목107', '방명록내용107', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목108', '방명록내용108', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목109', '방명록내용109', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목110', '방명록내용110', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목111', '방명록내용111', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목112', '방명록내용112', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목113', '방명록내용113', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목114', '방명록내용114', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목115', '방명록내용115', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목116', '방명록내용116', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목117', '방명록내용117', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목118', '방명록내용118', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목119', '방명록내용119', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목120', '방명록내용120', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목121', '방명록내용121', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목122', '방명록내용122', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목123', '방명록내용123', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목124', '방명록내용124', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목125', '방명록내용125', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목126', '방명록내용126', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목127', '방명록내용127', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목128', '방명록내용128', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목129', '방명록내용129', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목130', '방명록내용130', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목131', '방명록내용131', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목132', '방명록내용132', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목133', '방명록내용133', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목134', '방명록내용134', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목135', '방명록내용135', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목136', '방명록내용136', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목137', '방명록내용137', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목138', '방명록내용138', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목139', '방명록내용139', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목140', '방명록내용140', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목141', '방명록내용141', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목142', '방명록내용142', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목143', '방명록내용143', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목144', '방명록내용144', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목145', '방명록내용145', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목146', '방명록내용146', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목147', '방명록내용147', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목148', '방명록내용148', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목149', '방명록내용149', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목150', '방명록내용150', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목151', '방명록내용151', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목152', '방명록내용152', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목153', '방명록내용153', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목154', '방명록내용154', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목155', '방명록내용155', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목156', '방명록내용156', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목157', '방명록내용157', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목158', '방명록내용158', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목159', '방명록내용159', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목160', '방명록내용160', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목161', '방명록내용161', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목162', '방명록내용162', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목163', '방명록내용163', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목164', '방명록내용164', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목165', '방명록내용165', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목166', '방명록내용166', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목167', '방명록내용167', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목168', '방명록내용168', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목169', '방명록내용169', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목170', '방명록내용170', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목171', '방명록내용171', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목172', '방명록내용172', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목173', '방명록내용173', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목174', '방명록내용174', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목175', '방명록내용175', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목176', '방명록내용176', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목177', '방명록내용177', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목178', '방명록내용178', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목179', '방명록내용179', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목180', '방명록내용180', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목181', '방명록내용181', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목182', '방명록내용182', sysdate, 0);
INSERT INTO obhotel_board VALUES (obhotel_board_seq.nextval, 1, 3, '방명록제목183', '방명록내용183', sysdate, 0);




commit;





-------------------------------
-- 게시판 첨부파일
-------------------------------

CREATE TABLE obhotel_board_file (
	id			NUMBER NOT NULL,		-- 첨부파일 고유번호
	board_id	NUMBER NOT NULL,		-- 게시물 고유번호
	filename		VARCHAR2(256) NOT NULL,	-- 파일명 (SHA-256 반환값 + 확장자 . 포함 총 4자 = 70)
	saved_filename	VARCHAR2(256) NOT NULL,	-- 파일명 (SHA-256 반환값 + 확장자 . 포함 총 4자 = 70)
	filesize	NUMBER NOT NULL,		-- 첨부파일 크기
	CONSTRAINT obhotel_board_file_pk PRIMARY KEY (id),
	CONSTRAINT obhotel_board_file_aid_fk FOREIGN KEY (board_id) REFERENCES obhotel_board (id) on delete cascade
    --ON DELETE CASCADE : 기준 테이블의 데이터가 삭제되었을 때 외래 키 테이블의 데이터들도 자동으로 삭제
    --obhotel_board 테이블에 delete from obhotel_borad where id = '5'; 를 하면 obhotel_board_file; 에 있는 board_id = '5'도 함께 지워짐
    
    --추가적으로 : ON UPDATE CASCADE : 기준 테이블의 데이터가 변경되었을 때 외래 키 테이블도 자동으로 변경
    
);


-------------------------------
-- 쿼리 샘플
-------------------------------


-- INSERT INTO obhotel_board_file VALUES (obhotel_board_file_seq.nextval, ...);


INSERT INTO obhotel_board_file VALUES (obhotel_board_file_seq.nextval, 1, 'event01.jpg', 'event01.jpg', 248000);
INSERT INTO obhotel_board_file VALUES (obhotel_board_file_seq.nextval, 2, 'event02.jpg', 'event02.jpg', 248000);
INSERT INTO obhotel_board_file VALUES (obhotel_board_file_seq.nextval, 3, 'event03.jpg', 'event03.jpg', 248000);
INSERT INTO obhotel_board_file VALUES (obhotel_board_file_seq.nextval, 4, 'event04.jpg', 'event04.jpg', 248000);
INSERT INTO obhotel_board_file VALUES (obhotel_board_file_seq.nextval, 5, 'event05.jpg', 'event05.jpg', 248000);

commit;


-------------------------------
-- 게시판 댓글
-------------------------------

CREATE TABLE obhotel_board_reply (
	id			NUMBER NOT NULL,		-- 첨부파일 고유번호
	board_id	NUMBER NOT NULL,		-- 게시물 고유번호
	user_id		NUMBER NOT NULL,		-- 작성자 고유번호
	content		VARCHAR2(400) NOT NULL,	-- 내용
	write_date	DATE NOT NULL,			-- 작성일

	CONSTRAINT obhotel_board_reply_pk PRIMARY KEY (id),
	CONSTRAINT obhotel_board_reply_bid_fk FOREIGN KEY (board_id) REFERENCES obhotel_board (id) on delete cascade,
	CONSTRAINT obhotel_board_reply_uid_fk FOREIGN KEY (user_id) REFERENCES obhotel_user (id) on delete cascade
    --on delete cascade
    --같은 의미 obhotel_board (게시판에 id, 회원 id 가 삭제瑛뻥?코맨트 테이블에 데이터도 모두 삭제!) 
);


-------------------------------
-- 쿼리 샘플
-------------------------------

-- INSERT INTO obhotel_board_reply VALUES (obhotel_board_reply_seq.nextval, 11, 1, '댓글내용1', sysdate);

INSERT INTO obhotel_board_reply VALUES (obhotel_board_reply_seq.nextval, 11, 1, '댓글내용1', sysdate);





----------------------------------------------------------------------------------------------------------
-- 방 정보
-------------------------------

CREATE TABLE obhotel_room_type (
	id			NUMBER NOT NULL,		-- 방정보 고유번호
	room_type		NUMBER NOT NULL,		-- 방 유형 (1:standard/2:deluxe/3:twin-deluxe/4:superior/5:luxury) 6:펜션
	max_pax		NUMBER NOT NULL,		-- 수용 가능 인원
	cost		NUMBER NOT NULL,		-- 1일 사용요금
	CONSTRAINT obhotel_room_type PRIMARY KEY (id)
);

-------------------------------
-- 방 정보 첨부 파일
-------------------------------

CREATE TABLE obhotel_room_file (
	id			NUMBER NOT NULL,		-- 방 샘플 이미지 파일 고유번호
	room_type_id		NUMBER NOT NULL,		-- 방 고유번호
	filename	VARCHAR2(70) NOT NULL,	-- 파일명 (SHA-256 반환값 + 확장자 . 포함 총 4자 = 70)
	CONSTRAINT obhotel_room_file_pk PRIMARY KEY (id),
	CONSTRAINT obhotel_room_file_rtype_id_fk FOREIGN KEY (room_type_id) REFERENCES obhotel_room_type (id) on delete cascade
    --obhotel_room_type 테이블 id(방정보 고유번호)를 참조한다  ==obhotel_room_type테이블에서 (id) 값을 지우면 obhotel_room_file에 있는 일치하는 데이터 delet됨 위에랑 같음
    --
);

-------------------------------
-- 방 현황
-------------------------------
CREATE TABLE obhotel_room (
	id			NUMBER NOT NULL,			-- 현황 고유번호
	room_type_id		NUMBER NOT NULL,	-- 방정보 고유번호 -- 방 유형 (1:standard/2:deluxe/3:twin-deluxe/4:superior/5:luxury)
    room_name VARCHAR2(200) NOT NULL,    -- 룸 이름 // 펜션 이름  ex)하늘아래펜션      호텔이름 ex) 비트호텔 
	room_num	VARCHAR2(200) NOT NULL,		--   국화방 , 진달래방, 민들레방,     ex )300호실    
    room_content VARCHAR2(200) NOT NULL,   -- 방 간단한 소개
	room_address1	VARCHAR2(200) NOT NULL,	-- 주소1  (서울시) // (경주시) // (부산)
	room_address2	VARCHAR2(200) NOT NULL,	-- 주소2  마포구 ~~~~
	CONSTRAINT obhotel_room PRIMARY KEY (id),
	CONSTRAINT obhotel_room_rtype_id_fk FOREIGN KEY (room_type_id) REFERENCES obhotel_room_type (id) on delete cascade
);

-------------------------------
-- 방 평가
-------------------------------

CREATE TABLE obhotel_room_eval (
	id			NUMBER NOT NULL,		-- 방 평가 고유번호
	user_id		NUMBER NOT NULL,		-- 작성자 고유번호
	rate		NUMBER NOT NULL,		-- 평점 (기준은 정하지 않음 의논하기)
	content		VARCHAR2(80) NOT NULL,	-- 한줄평
	write_date	DATE NOT NULL,			-- 작성일
	CONSTRAINT obhotel_room_eval_pk PRIMARY KEY (id),
	CONSTRAINT obhotel_room_eval_user_id_fk FOREIGN KEY (user_id) REFERENCES obhotel_user (id) on delete cascade
);

-------------------------------
-- 쿼리 샘플
-------------------------------

-- INSERT INTO obhotel_room_type VALUES (obhotel_room_seq_type.nextval, ...);
-- INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, ...);
-- INSERT INTO obhotel_room_eval VALUES (obhotel_room_eval_seq.nextval, ...);

INSERT INTO obhotel_room_type VALUES (obhotel_room_type_seq.nextval, 1,  2, 10);
INSERT INTO obhotel_room_type VALUES (obhotel_room_type_seq.nextval, 2,  4, 20);
INSERT INTO obhotel_room_type VALUES (obhotel_room_type_seq.nextval, 3,  6, 30);
INSERT INTO obhotel_room_type VALUES (obhotel_room_type_seq.nextval, 4,  8, 40);
INSERT INTO obhotel_room_type VALUES (obhotel_room_type_seq.nextval, 5, 10, 50);
INSERT INTO obhotel_room_type VALUES (obhotel_room_type_seq.nextval, 6, 10, 50);

INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 1, 'standard1.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 1, 'standard2.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 1, 'standard3.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 2, 'deluxe1.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 2, 'deluxe2.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 2, 'deluxe3.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 3, 'twin-deluxe1.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 3, 'twin-deluxe2.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 3, 'twin-deluxe3.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 4, 'superior1.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 4, 'superior2.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 4, 'superior3.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 5, 'luxury1.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 5, 'luxury2.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 5, 'luxury3.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 6, 'luxury1.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 6, 'someday2.jpg');
INSERT INTO obhotel_room_file VALUES (obhotel_room_file_seq.nextval, 6, 'someday3.jpg');


INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 1,'비트캠프', '101' ,'노트북무료대여', '서울시','마포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 1,'비트캠프', '102' ,'pc방급 ', '서울시','마포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 1,'비트캠프', '103' ,'동영상강의 무료', '서울시','마포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 1,'비트캠프', '104' ,'ㅋㅋㅋㅋㅋㅋㅋㅋ', '서울시','마포구');

INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 2,'안녕호텔', '201' ,'안녕호텔-간단한내용test', '서울시','강서구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 2,'안녕호텔', '202' ,'안녕호텔-간단한내용test', '서울시','강서구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 2,'안녕호텔', '203' ,'안녕호텔-간단한내용test', '서울시','강서구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 2,'안녕호텔', '204' ,'안녕호텔-간단한내용test', '서울시','강서구');

INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 3,'해운대호텔', '301','영화(해운대) 24시간 무료!' , '부산광역시','해운대구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 3,'해운대호텔', '302','아이디어가 없어 아이디어 생각중' , '부산광역시','해운대구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 3,'해운대호텔', '303','이벤트룸 ' , '부산광역시','해운대구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 3,'해운대호텔', '304','객실내 워터파크 오픈' , '부산광역시','해운대구');
-- 방 유형 (1:standard/2:deluxe/3:twin-deluxe/4:superior/5:luxury)
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 4,'사상호텔', '401','내용을 채울까' , '부산광역시','사상구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 4,'사상호텔','402','크크크크크크' , '부산광역시','사상구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 4,'사상호텔', '403','아무거나 써야지' , '부산광역시','사상구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 4,'사상호텔', '404','하하하하하하' , '부산광역시','사상구');

INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 5,'갈매기호텔', '401','경치가 끝내주는 방' , '인천광역시','소래포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 5,'갈매기호텔', '402','마취방 그냥 들어오면 기절' , '인천광역시','소래포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 5,'갈매기호텔', '403','파티허용' , '인천광역시','소래포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval, 5,'갈매기호텔', '404','흡연가능한 방입니다' , '인천광역시','소래포구');

INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval,6,'하늘아래팬션', '진달래','진달래향기와 함께하는 편안한 숙소' , '인천광역시','소래포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval,6,'하늘아래팬션', '민들레', '민들레를 좋아합니까 함께해요', '인천광역시','소래포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval,6,'하늘아래팬션', '국화' ,'국화빵 국화빵', '인천광역시','소래포구');
INSERT INTO obhotel_room VALUES (obhotel_room_seq.nextval,6,'하늘아래팬션', '장미' ,'장미장미 빨간장미', '인천광역시','소래포구');


commit;




----------------------------------------------------------------------------------------------------------
-- 예약 // 빈방찾기 고민중.. eclipse 에서 obhotel_reservation 데이터를 입력할시 추가적으로 DAO 이용해서 상태여부 1,0으로 할지. 적용X
-- 빈방찾기 obhotel_room_type 테이블이랑 obhotel_reservation 비교해서 1. 예약목록에 없는 방만 표시하기 
-------------------------------

CREATE TABLE obhotel_reservation (
	id			NUMBER NOT NULL,		-- 예약 고유번호
	user_id		NUMBER NOT NULL,		-- 사용자 고유번호
	room_id		NUMBER NOT NULL,		-- 방정보 고유번호 (예약시 선택한 방 종류)
	s_date		DATE NOT NULL,			-- 숙박 시작일
	e_date		DATE NOT NULL,			-- 숙박 종료일
	r_date		DATE NOT NULL,			-- 예약일
	pax			NUMBER NOT NULL,		-- 입실 예정 인원
	breakfast	NUMBER(1) NOT NULL,		-- 조식 여부
	CONSTRAINT obhotel_reservation_pk PRIMARY KEY (id),
	CONSTRAINT obhotel_reservation_user_id_fk FOREIGN KEY (user_id) REFERENCES obhotel_user (id) on delete cascade,
	CONSTRAINT obhotel_reservation_room_id_fk FOREIGN KEY (room_id) REFERENCES obhotel_room (id) on delete cascade
);

-------------------------------
-- 쿼리 샘플
-------------------------------

-- INSERT INTO obhotel_reservation VALUES (obhotel_reservation_seq.nextval, ...);

INSERT INTO obhotel_reservation VALUES (obhotel_reservation_seq.nextval, 1, 1, '2017/01/10', '2017/01/15', sysdate, 2, 1);
INSERT INTO obhotel_reservation VALUES (obhotel_reservation_seq.nextval, 1, 2, '2017/01/20', '2017/01/25', sysdate, 3, 1);
commit;
