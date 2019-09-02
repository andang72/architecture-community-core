	-- MySQL v5.6.5
	-- =================================================  
	-- PACKAGE: FRAMEWORK   
	-- CREATE : 2018.11.6
	-- UPDATE : 
	-- =================================================	
	DROP TABLE IF EXISTS AC_UI_PROPERTY, AC_UI_SEQUENCER ;
	
	CREATE TABLE AC_UI_PROPERTY (
		PROPERTY_NAME	VARCHAR(100)   NOT NULL  COMMENT '프로퍼티 이름'  ,
		PROPERTY_VALUE	VARCHAR(1024)  NOT NULL  COMMENT '프로퍼티 값'  ,
		CONSTRAINT AC_UI_PROPERTY_PK PRIMARY KEY (PROPERTY_NAME)
	);
	
	ALTER TABLE  AC_UI_PROPERTY COMMENT '애플리케이션 전역에서 사용되는 프로퍼티';
	
	CREATE TABLE AC_UI_SEQUENCER(
	SEQUENCER_ID	INTEGER NOT NULL COMMENT '시퀀서 ID',
	NAME			VARCHAR(100) NOT NULL COMMENT '시퀀서 이름', 
	VALUE			INTEGER NOT NULL COMMENT '시퀀서 값',
	CONSTRAINT AC_UI_SEQUENCER_PK PRIMARY KEY (SEQUENCER_ID)
	);
	
	CREATE UNIQUE INDEX  `AC_UI_SEQUENCER_UIDX1` ON `AC_UI_SEQUENCER` (`NAME`);

	ALTER TABLE  `AC_UI_SEQUENCER`  COMMENT '애플리케이션 전역에서 사용되는 시퀀서';

	-- =================================================  
	-- PACKAGE: SECURITY   
	-- CREATE : 2018.11.6
	-- UPDATE : 
	-- =================================================	
	DROP TABLE IF EXISTS AC_UI_USER, AC_UI_ROLE, AC_UI_USER_ROLES, AC_UI_USER_LOGIN_TOKEN ;	
		-- User
		CREATE TABLE AC_UI_USER (
		  USER_ID                INTEGER NOT NULL,
		  USERNAME               VARCHAR(100) NOT NULL,
		  PASSWORD_HASH          VARCHAR(64)  NOT NULL,
		  NAME                   VARCHAR(100),		  
		  NAME_VISIBLE           TINYINT  DEFAULT 1 , 
		  FIRST_NAME             VARCHAR(100),		  
		  LAST_NAME              VARCHAR(100),		
		  EMAIL                  VARCHAR(100) NOT NULL,
		  EMAIL_VISIBLE          TINYINT  DEFAULT 1,
		  USER_ENABLED           TINYINT  DEFAULT 1, 
		  USER_EXTERNAL          TINYINT  DEFAULT 0, 
		  STATUS                 TINYINT  DEFAULT 0,
		  CREATION_DATE          DATETIME DEFAULT  NOW() NOT NULL,
		  MODIFIED_DATE          DATETIME DEFAULT  NOW() NOT NULL,		    
		  CONSTRAINT AC_UI_USER_PK PRIMARY KEY (USER_ID)
		);		
		
		CREATE UNIQUE INDEX AC_UI_USER_IDX_USERNAME ON AC_UI_USER (USERNAME);
		
		ALTER TABLE  `AC_UI_USER`  COMMENT '사용자 테이블';
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`USER_ID` IS 'ID'; */ 
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`USERNAME` IS '로그인 아이디'; */ 
        /* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`NAME` IS '전체 이름'; */
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`PASSWORD_HASH` IS '암호화된 패스워드'; */ 
        /* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`NAME_VISIBLE` IS '이름 공개 여부'; */        
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`FIRST_NAME` IS '이름'; */ 
        /* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`LAST_NAME` IS '성'; */        
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`EMAIL` IS '메일주소'; */ 
        /* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`EMAIL_VISIBLE` IS '메일주소 공개여부'; */           
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`USER_ENABLED` IS '계정 사용여부'; */     
        /* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`STATUS` IS '계정 상태'; */	    
        /* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`CREATION_DATE` IS '생성일자'; */	    
        /* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_USER`.`MODIFIED_DATE` IS '수정일자'; */	
        
        -- Role
		CREATE TABLE AC_UI_ROLE (
		  ROLE_ID                     INTEGER NOT NULL,
		  NAME                        VARCHAR(100)   NOT NULL,
		  DESCRIPTION              VARCHAR(1000)  NOT NULL,
		  CREATION_DATE           DATETIME DEFAULT  NOW() NOT NULL,
		  MODIFIED_DATE           DATETIME DEFAULT  NOW() NOT NULL,	
		  CONSTRAINT AC_UI_ROLE_PK PRIMARY KEY (ROLE_ID)
		);
		
		ALTER TABLE `AC_UI_ROLE`  COMMENT '롤 테이블';
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_ROLE`.`ROLE_ID` IS '롤 ID'; */ 
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_ROLE`.`NAME` IS '롤 이름'; */ 
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_ROLE`.`DESCRIPTION` IS '설명'; */ 	
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_ROLE`.`CREATION_DATE` IS '생성일자'; */ 
		/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_ROLE`.`MODIFIED_DATE` IS '수정일자'; */ 				
		
		CREATE UNIQUE INDEX AC_UI_ROLE_NAME_IDX ON AC_UI_ROLE (NAME)
		
		-- User Roles  
		CREATE TABLE AC_UI_USER_ROLES (
		  USER_ID                 INTEGER NOT NULL,
		  ROLE_ID                 INTEGER NOT NULL,
		  CONSTRAINT AC_UI_USER_ROLES_PK PRIMARY KEY (USER_ID, ROLE_ID)
		);

		ALTER TABLE `AC_UI_USER_ROLES`  COMMENT '사용자 롤 테이블';
		/* Moved to CREATE TABLE
		COMMENT ON COLUMN `AC_UI_USER_ROLES`.`USER_ID` IS '그룹 ID'; */ 
		/* Moved to CREATE TABLE
		COMMENT ON COLUMN `AC_UI_USER_ROLES`.`ROLE_ID` IS '롤 ID'; */ 
		
		
		-- User remember me
		CREATE TABLE AC_UI_USER_LOGIN_TOKEN (
			UUID			VARCHAR(100) NOT NULL,
			USERNAME		VARCHAR(100) NOT NULL, 
		 	TOKEN 			VARCHAR(100) NOT NULL, 
		 	LAST_USE_DATE	DATETIME(6) DEFAULT CURRENT_TIMESTAMP NOT NULL
		);
 
		ALTER TABLE `AC_UI_USER_LOGIN_TOKEN`  COMMENT '인증 정보 저장 테이블';
		/* Moved to CREATE TABLE
		COMMENT ON COLUMN `AC_UI_USER_LOGIN_TOKEN`.`UUID` IS '시퀀스 값'; */ 
		/* Moved to CREATE TABLE
		COMMENT ON COLUMN `AC_UI_USER_LOGIN_TOKEN`.`USERNAME` IS '로그인아이디'; */ 	
		/* Moved to CREATE TABLE
		COMMENT ON COLUMN `AC_UI_USER_LOGIN_TOKEN`.`TOKEN` IS '인증 토큰 값'; */ 
		/* Moved to CREATE TABLE
		COMMENT ON COLUMN `AC_UI_USER_LOGIN_TOKEN`.`LAST_USE_DATE` IS '마지막 사용일자'; */  
		
		
	--  COMPANY	
	DROP TABLE IF EXISTS AC_UI_COMPANY, AC_UI_COMPANY_PROPERTY ;
	
		CREATE TABLE AC_UI_COMPANY (
			  COMPANY_ID                INTEGER NOT NULL COMMENT '회사 ID',
			  DISPLAY_NAME             	VARCHAR(255)   NOT NULL COMMENT '출력시 보여줄 회사 이름' ,
			  NAME                      VARCHAR(100)   NOT NULL COMMENT '회사 이름',
			  DOMAIN_NAME				VARCHAR(100) COMMENT '도메인 명',
			  DESCRIPTION               VARCHAR(1000)  COMMENT '설명',
			  CREATION_DATE            	DATETIME DEFAULT  NOW() NOT NULL COMMENT '생성일자',
			  MODIFIED_DATE            	DATETIME DEFAULT  NOW() NOT NULL COMMENT '수정일자',	
			  CONSTRAINT AC_UI_COMPANY_PK 	PRIMARY KEY (COMPANY_ID)
		);
		
		CREATE INDEX AC_UI_COMPANY_DATE_IDX ON AC_UI_COMPANY(CREATION_DATE) ;		
		CREATE INDEX AC_UI_COMPANY_NAME_IDX ON AC_UI_COMPANY(NAME);			
		CREATE INDEX AC_UI_COMPANY_DOMAIN_IDX ON AC_UI_COMPANY(DOMAIN_NAME);			
		
		ALTER TABLE `AC_UI_COMPANY`  COMMENT '회사 테이블';
		
	    CREATE TABLE AC_UI_COMPANY_PROPERTY (
		  COMPANY_ID               INTEGER NOT NULL COMMENT '회사 ID',
		  PROPERTY_NAME          VARCHAR(100)   NOT NULL COMMENT '프로퍼티 이름',
		  PROPERTY_VALUE         VARCHAR(1024)  NOT NULL COMMENT '프로퍼티 값',
		  CONSTRAINT AC_UI_COMPANY_PROPERTY_PK PRIMARY KEY (COMPANY_ID, PROPERTY_NAME)
		);	
		
		ALTER TABLE `AC_UI_COMPANY_PROPERTY`  COMMENT '회사 프로퍼티 테이블';

		
		
	-- =================================================  
	-- PACKAGE: UI  
	-- COMPONENT : PAGE 
	-- CREATE : 2018.09.19
	-- UPDATE :
	-- 2018.09.17 - AC_UI_PAGE_BODY_VERSION.SCRIPT 추가 
	-- =================================================	
	DROP TABLE IF EXISTS AC_UI_PAGE, AC_UI_PAGE_BODY, AC_UI_PAGE_BODY_VERSION, AC_UI_PAGE_VERSION , AC_UI_PAGE_PROPERTY ;	
	
	CREATE TABLE AC_UI_PAGE(	
		PAGE_ID						INTEGER NOT NULL,
		OBJECT_TYPE					INTEGER NOT NULL,
		OBJECT_ID					INTEGER NOT NULL,
		NAME						VARCHAR(255) NOT NULL,	
		VERSION_ID					INTEGER DEFAULT 1 NOT NULL,
		USER_ID						INTEGER NOT NULL,
		READ_COUNT          		INTEGER DEFAULT 0  NOT NULL,
		PATTERN						VARCHAR(255) NULL,	
		CREATION_DATE				DATETIME NULL,
		MODIFIED_DATE				DATETIME NULL,			
		CONSTRAINT AC_UI_PAGE_PK PRIMARY KEY (PAGE_ID)
	);

	CREATE UNIQUE INDEX AC_UI_PAGE_IDX1 ON AC_UI_PAGE (NAME);
	CREATE INDEX AC_UI_PAGE_IDX2   ON AC_UI_PAGE (OBJECT_TYPE, OBJECT_ID, PAGE_ID);
	CREATE INDEX AC_UI_PAGE_IDX3   ON AC_UI_PAGE (USER_ID);

	CREATE TABLE AC_UI_PAGE_BODY
	(	
		BODY_ID						INTEGER NOT NULL,
		PAGE_ID						INTEGER NOT NULL,
		BODY_TYPE					INTEGER NOT NULL,
		BODY_TEXT					LONGTEXT,
		CONSTRAINT AC_UI_PAGE_BODY_PK PRIMARY KEY (BODY_ID)
    ) ;
	
		
	CREATE TABLE AC_UI_PAGE_BODY_VERSION
	(	
		BODY_ID					INTEGER NOT NULL,
		PAGE_ID						INTEGER NOT NULL,
		VERSION_ID				INTEGER DEFAULT 1 NOT NULL ,
		CONSTRAINT AC_UI_PAGE_BODY_VERSION_PK PRIMARY KEY (BODY_ID, PAGE_ID, VERSION_ID )
   );
   
   CREATE INDEX AC_UI_PAGE_BODY_VERSION_IDX1   ON AC_UI_PAGE_BODY_VERSION (PAGE_ID, VERSION_ID);

		
  CREATE TABLE AC_UI_PAGE_VERSION
   (	
	PAGE_ID					INTEGER NOT NULL,
	VERSION_ID				INTEGER DEFAULT 1 NOT NULL ,
	STATE					VARCHAR(20), 
	TITLE					VARCHAR(255), 
	SECURED          		TINYINT  DEFAULT 1,
	TEMPLATE				VARCHAR(255), 
	SCRIPT					VARCHAR(255), 
	PATTERN					VARCHAR(255), 	
	SUMMARY					VARCHAR(4000), 
	USER_ID					INTEGER	NOT NULL,
	CREATION_DATE			DATETIME NULL,
	MODIFIED_DATE			DATETIME NULL,	
	CONSTRAINT AC_UI_PAGE_VERSION_PK PRIMARY KEY (PAGE_ID, VERSION_ID)
   ) ;

		
	CREATE INDEX AC_UI_PAGE_VERSION_IDX1   ON AC_UI_PAGE_VERSION (CREATION_DATE);
	CREATE INDEX AC_UI_PAGE_VERSION_IDX2   ON AC_UI_PAGE_VERSION (MODIFIED_DATE);
	CREATE INDEX AC_UI_PAGE_VERSION_IDX3   ON AC_UI_PAGE_VERSION (TITLE);
	CREATE INDEX AC_UI_PAGE_VERSION_IDX4   ON AC_UI_PAGE_VERSION (PAGE_ID, STATE);

			
	CREATE TABLE AC_UI_PAGE_PROPERTY (
		  PAGE_ID				INTEGER NOT NULL,
		  VERSION_ID			INTEGER DEFAULT 1 NOT NULL,
		  PROPERTY_NAME          VARCHAR(100)   NOT NULL,
		  PROPERTY_VALUE         VARCHAR(1024)  NOT NULL,
		  CONSTRAINT AC_UI_PAGE_PROPERTY_PK PRIMARY KEY (PAGE_ID, VERSION_ID, PROPERTY_NAME)
	);	

	ALTER TABLE  `AC_UI_PAGE_PROPERTY`  COMMENT 'PAGE 프로퍼티 테이블';
	/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_PAGE_PROPERTY`.`PAGE_ID` IS 'PAGE ID'; */ 
	/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_PAGE_PROPERTY`.`VERSION_ID` IS 'PAGE VERSION'; */ 	
	/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_PAGE_PROPERTY`.`PROPERTY_NAME` IS '프로퍼티 이름'; */ 
	/* Moved to CREATE TABLE
COMMENT ON COLUMN `AC_UI_PAGE_PROPERTY`.`PROPERTY_VALUE` IS '프로퍼티 값'; */ 	 
		
	
	-- =================================================  
	--  VIEWCOUNT	
	-- =================================================	
	CREATE TABLE AC_UI_VIEWCOUNT(	
		ENTITY_TYPE					INTEGER NOT NULL COMMENT '객체 타입',
		ENTITY_ID					INTEGER NOT NULL COMMENT '객체 아이디',
		VIEWCOUNT					INTEGER NOT NULL COMMENT '카운트',
		CONSTRAINT AC_UI_VIEWCOUNT_PK PRIMARY KEY (ENTITY_TYPE, ENTITY_ID)
   	);		
   	ALTER TABLE  `AC_UI_VIEWCOUNT`  COMMENT '뷰 카운트 테이블';	
	