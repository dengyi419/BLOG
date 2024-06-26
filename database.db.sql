BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "database" (
	"id"	INTEGER NOT NULL,
	"email"	VARCHAR(50),
	"password"	VARCHAR(50),
	"user"	VARCHAR(50),
	"created"	DATETIME,
	UNIQUE("user"),
	PRIMARY KEY("id"),
	UNIQUE("email")
);
CREATE TABLE IF NOT EXISTS "post" (
	"id"	INTEGER NOT NULL,
	"text"	TEXT(1000) NOT NULL,
	"created"	DATETIME,
	"user_id"	INTEGER NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("user_id") REFERENCES "database"("id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "comment" (
	"id"	INTEGER NOT NULL,
	"text"	TEXT(1000) NOT NULL,
	"created"	DATETIME,
	"user_id"	INTEGER NOT NULL,
	"post_id"	INTEGER NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("post_id") REFERENCES "post"("id") ON DELETE CASCADE,
	FOREIGN KEY("user_id") REFERENCES "database"("id") ON DELETE CASCADE
);
INSERT INTO "database" VALUES (1,'111','pbkdf2:sha256:260000$ngXqAz28YjCIPR1z$69f6a41798d7b6229abadc7f9537a5e10659b6cc6b202bdd6cd8380e6c9e0c58','111','2022-12-31 18:18:16');
INSERT INTO "database" VALUES (2,'222','pbkdf2:sha256:260000$Te3CLlFws0h3l6BA$c242c5d6340e83363a84fe07418cb7b520d8c6ecf2b11a4a23441c9e4a5daeea','dengyi','2023-01-01 07:37:10');
INSERT INTO "database" VALUES (3,'www','pbkdf2:sha256:260000$3JahSqSnF0jBtPrG$e85af24ab14188f8582efbcc1adb1889b7ae5c3ec2c32431df39ec470a52509a','weewewe','2023-01-01 14:35:38');
INSERT INTO "database" VALUES (4,'ewe','pbkdf2:sha256:260000$7gvbxHWXHckkQJzD$87e453c5b69d8efec97464f65b0c3dc61b8de8d054f960e35bd5285f8337df44','wew','2023-01-03 11:35:55');
INSERT INTO "database" VALUES (5,'ewew','pbkdf2:sha256:260000$XMVVkPHN7FDvj3aV$89fd4140a317d7d57431fd86e228162388da62507eec1055e533d400563a8bbe','ewew','2023-01-04 14:48:29');
INSERT INTO "post" VALUES (1,'ssssss','2023-01-04 14:47:22',2);
INSERT INTO "post" VALUES (2,'ssssss','2023-01-04 14:48:44',5);
INSERT INTO "comment" VALUES (1,'dssdss','2023-01-03 11:36:24',4,2);
INSERT INTO "comment" VALUES (2,'sss','2023-01-04 14:47:52',4,1);
INSERT INTO "comment" VALUES (3,'sdsddsd','2023-01-04 14:48:38',5,1);
COMMIT;
