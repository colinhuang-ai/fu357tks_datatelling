BEGIN TRANSACTION;
CREATE TABLE products (
        product_id TEXT PRIMARY KEY,
        project_name TEXT NOT NULL,
        block_zone TEXT NOT NULL,
        unit_code TEXT NOT NULL UNIQUE,
        property_type TEXT NOT NULL,
        net_area REAL NOT NULL,
        cost_price REAL NOT NULL,
        list_price REAL NOT NULL,
        status TEXT NOT NULL CHECK (status IN ('Đang bán', 'Sắp mở bán', 'Đã đặt cọc', 'Đã bán')),
        launch_date TEXT NOT NULL
    );
INSERT INTO "products" VALUES('PRD-1001','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F02U01','Căn hộ 2BR-2WC',67.5,3165000000.0,4030000000.0,'Đã bán','2026-02-25');
INSERT INTO "products" VALUES('PRD-1002','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F02U02','Căn hộ 1BR+1',44.1,2041000000.0,2295000000.0,'Đã bán','2026-05-07');
INSERT INTO "products" VALUES('PRD-1003','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F03U01','Căn hộ 1BR+1',44.6,2016000000.0,2395000000.0,'Sắp mở bán','2026-09-07');
INSERT INTO "products" VALUES('PRD-1004','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F03U02','Căn hộ 1BR+1',47.5,2170000000.0,2660000000.0,'Đã bán','2026-05-17');
INSERT INTO "products" VALUES('PRD-1005','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F04U01','Căn hộ 3BR-2WC',84.0,4298000000.0,5153000000.0,'Sắp mở bán','2026-09-23');
INSERT INTO "products" VALUES('PRD-1006','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F04U02','Căn hộ 2BR-2WC',68.5,3336000000.0,3997000000.0,'Đã bán','2025-10-30');
INSERT INTO "products" VALUES('PRD-1007','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F05U01','Căn hộ 1BR+1',43.9,1963000000.0,2458000000.0,'Đã bán','2025-11-28');
INSERT INTO "products" VALUES('PRD-1008','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F05U02','Căn hộ 3BR-2WC',82.1,4011000000.0,4992000000.0,'Đang bán','2025-10-15');
INSERT INTO "products" VALUES('PRD-1009','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F06U01','Căn hộ 2BR-2WC',65.6,3146000000.0,3811000000.0,'Đã bán','2026-03-08');
INSERT INTO "products" VALUES('PRD-1010','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F06U02','Căn hộ 3BR-2WC',85.7,4150000000.0,5373000000.0,'Đã bán','2026-03-13');
INSERT INTO "products" VALUES('PRD-1011','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F07U01','Căn hộ 2BR-2WC',62.0,2958000000.0,3537000000.0,'Đã bán','2026-02-05');
INSERT INTO "products" VALUES('PRD-1012','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F07U02','Căn hộ 3BR-2WC',80.9,4074000000.0,4945000000.0,'Đã bán','2026-02-01');
INSERT INTO "products" VALUES('PRD-1013','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F08U01','Căn hộ 2BR-2WC',68.5,3264000000.0,3912000000.0,'Sắp mở bán','2026-09-19');
INSERT INTO "products" VALUES('PRD-1014','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F08U02','Căn hộ 3BR-2WC',85.8,4084000000.0,5291000000.0,'Đang bán','2026-03-23');
INSERT INTO "products" VALUES('PRD-1015','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F09U01','Căn hộ 3BR-2WC',84.8,4079000000.0,5161000000.0,'Đã bán','2025-10-21');
INSERT INTO "products" VALUES('PRD-1016','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F09U02','Căn hộ 3BR-2WC',82.0,4119000000.0,5080000000.0,'Đã bán','2026-02-18');
INSERT INTO "products" VALUES('PRD-1017','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F10U01','Căn hộ 3BR-2WC',78.6,3780000000.0,4854000000.0,'Đã bán','2025-12-03');
INSERT INTO "products" VALUES('PRD-1018','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F10U02','Căn hộ 3BR-2WC',82.3,4278000000.0,5133000000.0,'Đang bán','2026-04-06');
INSERT INTO "products" VALUES('PRD-1019','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F11U01','Căn hộ 2BR-2WC',63.9,3098000000.0,3635000000.0,'Đã bán','2025-11-14');
INSERT INTO "products" VALUES('PRD-1020','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F11U02','Căn hộ 2BR-2WC',63.3,3120000000.0,3767000000.0,'Đã bán','2026-03-24');
INSERT INTO "products" VALUES('PRD-1021','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F12U01','Căn hộ 2BR-2WC',65.3,3005000000.0,3806000000.0,'Sắp mở bán','2026-10-04');
INSERT INTO "products" VALUES('PRD-1022','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F12U02','Căn hộ 2BR-2WC',63.0,3054000000.0,3848000000.0,'Đang bán','2026-02-12');
INSERT INTO "products" VALUES('PRD-1023','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F13U01','Căn hộ 2BR-2WC',68.4,3447000000.0,3951000000.0,'Sắp mở bán','2026-08-25');
INSERT INTO "products" VALUES('PRD-1024','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F13U02','Căn hộ 3BR-2WC',80.9,4135000000.0,5015000000.0,'Đang bán','2025-11-01');
INSERT INTO "products" VALUES('PRD-1025','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F14U01','Căn hộ 2BR-2WC',68.3,3393000000.0,4063000000.0,'Sắp mở bán','2026-08-28');
INSERT INTO "products" VALUES('PRD-1026','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F14U02','Căn hộ 2BR-2WC',63.1,2983000000.0,3662000000.0,'Sắp mở bán','2026-10-27');
INSERT INTO "products" VALUES('PRD-1027','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F15U01','Căn hộ 2BR-2WC',68.3,3181000000.0,4123000000.0,'Đang bán','2026-04-10');
INSERT INTO "products" VALUES('PRD-1028','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F15U02','Căn hộ 2BR-2WC',66.5,3349000000.0,3956000000.0,'Đang bán','2025-11-13');
INSERT INTO "products" VALUES('PRD-1029','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F16U01','Căn hộ 1BR+1',45.8,2141000000.0,2511000000.0,'Đã bán','2026-04-24');
INSERT INTO "products" VALUES('PRD-1030','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F16U02','Căn hộ 2BR-2WC',63.2,2931000000.0,3749000000.0,'Sắp mở bán','2026-10-09');
INSERT INTO "products" VALUES('PRD-1031','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F17U01','Căn hộ 2BR-2WC',67.4,3323000000.0,3932000000.0,'Đã bán','2026-01-10');
INSERT INTO "products" VALUES('PRD-1032','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F17U02','Căn hộ 3BR-2WC',84.2,4195000000.0,5162000000.0,'Đã bán','2026-01-17');
INSERT INTO "products" VALUES('PRD-1033','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F18U01','Căn hộ 2BR-2WC',64.3,2932000000.0,3600000000.0,'Đã bán','2025-12-26');
INSERT INTO "products" VALUES('PRD-1034','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F18U02','Căn hộ 3BR-2WC',82.3,3934000000.0,5158000000.0,'Sắp mở bán','2026-09-12');
INSERT INTO "products" VALUES('PRD-1035','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F19U01','Căn hộ 3BR-2WC',80.9,3916000000.0,5037000000.0,'Sắp mở bán','2026-11-03');
INSERT INTO "products" VALUES('PRD-1036','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F19U02','Căn hộ 1BR+1',45.6,2077000000.0,2458000000.0,'Đã bán','2026-01-13');
INSERT INTO "products" VALUES('PRD-1037','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F20U01','Căn hộ 3BR-2WC',78.2,4004000000.0,4767000000.0,'Đã bán','2026-02-28');
INSERT INTO "products" VALUES('PRD-1038','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F20U02','Căn hộ 2BR-2WC',68.9,3271000000.0,4185000000.0,'Đang bán','2025-12-11');
INSERT INTO "products" VALUES('PRD-1039','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F21U01','Căn hộ 3BR-2WC',85.1,4048000000.0,5403000000.0,'Đã bán','2026-01-30');
INSERT INTO "products" VALUES('PRD-1040','Imperia Smart City','Tòa Imperia Lake Z38','ISC-ImperiaLakeZ38-F21U02','Căn hộ 3BR-2WC',86.0,4158000000.0,5226000000.0,'Đang bán','2026-02-06');
INSERT INTO "products" VALUES('PRD-1041','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F02U01','Căn hộ 2BR-2WC',62.7,2986000000.0,3811000000.0,'Đã đặt cọc','2025-11-14');
INSERT INTO "products" VALUES('PRD-1042','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F02U02','Căn hộ 3BR-2WC',80.1,3908000000.0,4704000000.0,'Đang bán','2025-11-09');
INSERT INTO "products" VALUES('PRD-1043','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F03U01','Căn hộ 2BR-2WC',67.2,3287000000.0,3997000000.0,'Đã bán','2026-03-23');
INSERT INTO "products" VALUES('PRD-1044','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F03U02','Căn hộ 2BR-2WC',66.9,3224000000.0,3868000000.0,'Sắp mở bán','2026-11-06');
INSERT INTO "products" VALUES('PRD-1045','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F04U01','Căn hộ 2BR-2WC',63.5,3114000000.0,3797000000.0,'Đã đặt cọc','2025-10-07');
INSERT INTO "products" VALUES('PRD-1046','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F04U02','Căn hộ 3BR-2WC',83.8,4326000000.0,5211000000.0,'Đã bán','2026-04-24');
INSERT INTO "products" VALUES('PRD-1047','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F05U01','Căn hộ 2BR-2WC',62.9,2991000000.0,3605000000.0,'Đã bán','2025-10-24');
INSERT INTO "products" VALUES('PRD-1048','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F05U02','Căn hộ 1BR+1',46.1,1999000000.0,2520000000.0,'Đã bán','2026-02-20');
INSERT INTO "products" VALUES('PRD-1049','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F06U01','Căn hộ 1BR+1',47.6,2117000000.0,2498000000.0,'Đã bán','2026-04-11');
INSERT INTO "products" VALUES('PRD-1050','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F06U02','Căn hộ 2BR-2WC',64.3,2951000000.0,3922000000.0,'Sắp mở bán','2026-11-09');
INSERT INTO "products" VALUES('PRD-1051','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F07U01','Căn hộ 2BR-2WC',64.4,3166000000.0,3704000000.0,'Sắp mở bán','2026-09-02');
INSERT INTO "products" VALUES('PRD-1052','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F07U02','Căn hộ 3BR-2WC',82.6,4327000000.0,5125000000.0,'Sắp mở bán','2026-10-26');
INSERT INTO "products" VALUES('PRD-1053','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F08U01','Căn hộ 2BR-2WC',62.9,2932000000.0,3839000000.0,'Sắp mở bán','2026-08-27');
INSERT INTO "products" VALUES('PRD-1054','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F08U02','Căn hộ 3BR-2WC',82.9,4226000000.0,5256000000.0,'Đã bán','2026-05-05');
INSERT INTO "products" VALUES('PRD-1055','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F09U01','Căn hộ 1BR+1',45.5,1952000000.0,2542000000.0,'Sắp mở bán','2026-11-09');
INSERT INTO "products" VALUES('PRD-1056','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F09U02','Căn hộ 3BR-2WC',80.7,4123000000.0,5181000000.0,'Đã bán','2026-05-14');
INSERT INTO "products" VALUES('PRD-1057','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F10U01','Căn hộ 3BR-2WC',81.4,4038000000.0,4853000000.0,'Đã bán','2026-02-22');
INSERT INTO "products" VALUES('PRD-1058','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F10U02','Căn hộ 3BR-2WC',81.6,4109000000.0,5152000000.0,'Đã bán','2026-03-10');
INSERT INTO "products" VALUES('PRD-1059','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F11U01','Căn hộ 2BR-2WC',64.7,3250000000.0,3963000000.0,'Đang bán','2025-11-21');
INSERT INTO "products" VALUES('PRD-1060','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F11U02','Căn hộ 1BR+1',46.3,1988000000.0,2631000000.0,'Đã bán','2026-01-10');
INSERT INTO "products" VALUES('PRD-1061','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F12U01','Căn hộ 1BR+1',43.7,1977000000.0,2434000000.0,'Đã bán','2026-01-05');
INSERT INTO "products" VALUES('PRD-1062','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F12U02','Căn hộ 3BR-2WC',80.8,4017000000.0,4760000000.0,'Sắp mở bán','2026-10-19');
INSERT INTO "products" VALUES('PRD-1063','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F13U01','Căn hộ 1BR+1',45.6,2049000000.0,2463000000.0,'Đã bán','2026-03-16');
INSERT INTO "products" VALUES('PRD-1064','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F13U02','Căn hộ 2BR-2WC',64.7,3188000000.0,3693000000.0,'Đã bán','2025-11-20');
INSERT INTO "products" VALUES('PRD-1065','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F14U01','Căn hộ 3BR-2WC',81.5,4008000000.0,5223000000.0,'Sắp mở bán','2026-09-17');
INSERT INTO "products" VALUES('PRD-1066','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F14U02','Căn hộ 3BR-2WC',80.9,4060000000.0,5035000000.0,'Đã bán','2026-05-07');
INSERT INTO "products" VALUES('PRD-1067','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F15U01','Căn hộ 2BR-2WC',64.5,3101000000.0,3649000000.0,'Đang bán','2026-02-25');
INSERT INTO "products" VALUES('PRD-1068','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F15U02','Căn hộ 1BR+1',46.1,2038000000.0,2631000000.0,'Đã bán','2025-10-31');
INSERT INTO "products" VALUES('PRD-1069','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F16U01','Căn hộ 3BR-2WC',80.6,3831000000.0,5030000000.0,'Đã bán','2025-11-29');
INSERT INTO "products" VALUES('PRD-1070','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F16U02','Căn hộ 3BR-2WC',78.1,3925000000.0,4818000000.0,'Sắp mở bán','2026-11-22');
INSERT INTO "products" VALUES('PRD-1071','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F17U01','Căn hộ 2BR-2WC',64.8,3204000000.0,3637000000.0,'Đang bán','2025-12-22');
INSERT INTO "products" VALUES('PRD-1072','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F17U02','Căn hộ 3BR-2WC',78.9,3924000000.0,4950000000.0,'Sắp mở bán','2026-09-11');
INSERT INTO "products" VALUES('PRD-1073','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F18U01','Căn hộ 1BR+1',44.6,1950000000.0,2538000000.0,'Sắp mở bán','2026-10-08');
INSERT INTO "products" VALUES('PRD-1074','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F18U02','Căn hộ 2BR-2WC',62.2,2877000000.0,3619000000.0,'Đã bán','2025-10-26');
INSERT INTO "products" VALUES('PRD-1075','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F19U01','Căn hộ 1BR+1',44.4,2027000000.0,2383000000.0,'Đang bán','2025-12-27');
INSERT INTO "products" VALUES('PRD-1076','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F19U02','Căn hộ 3BR-2WC',82.6,4252000000.0,5196000000.0,'Đã bán','2026-05-02');
INSERT INTO "products" VALUES('PRD-1077','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F20U01','Căn hộ 2BR-2WC',64.4,3243000000.0,3786000000.0,'Sắp mở bán','2026-10-02');
INSERT INTO "products" VALUES('PRD-1078','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F20U02','Căn hộ 1BR+1',44.6,2041000000.0,2419000000.0,'Đang bán','2025-12-27');
INSERT INTO "products" VALUES('PRD-1079','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F21U01','Căn hộ 3BR-2WC',82.6,4015000000.0,5061000000.0,'Đang bán','2026-03-10');
INSERT INTO "products" VALUES('PRD-1080','Imperia Smart City','Tòa Imperia Lake Z39','ISC-ImperiaLakeZ39-F21U02','Căn hộ 3BR-2WC',84.1,4282000000.0,5304000000.0,'Đã bán','2025-12-29');
INSERT INTO "products" VALUES('PRD-1081','Imperia Smart City','Tòa Park 1','ISC-Park1-F02U01','Căn hộ 1BR+1',44.1,2036000000.0,2403000000.0,'Đã bán','2025-11-12');
INSERT INTO "products" VALUES('PRD-1082','Imperia Smart City','Tòa Park 1','ISC-Park1-F02U02','Căn hộ 1BR+1',45.6,2002000000.0,2426000000.0,'Đang bán','2025-11-10');
INSERT INTO "products" VALUES('PRD-1083','Imperia Smart City','Tòa Park 1','ISC-Park1-F03U01','Căn hộ 3BR-2WC',84.0,4103000000.0,5104000000.0,'Đang bán','2026-03-14');
INSERT INTO "products" VALUES('PRD-1084','Imperia Smart City','Tòa Park 1','ISC-Park1-F03U02','Căn hộ 1BR+1',48.1,2108000000.0,2672000000.0,'Sắp mở bán','2026-08-31');
INSERT INTO "products" VALUES('PRD-1085','Imperia Smart City','Tòa Park 1','ISC-Park1-F04U01','Căn hộ 1BR+1',48.1,2239000000.0,2637000000.0,'Sắp mở bán','2026-10-17');
INSERT INTO "products" VALUES('PRD-1086','Imperia Smart City','Tòa Park 1','ISC-Park1-F04U02','Căn hộ 2BR-2WC',66.1,3080000000.0,3843000000.0,'Đang bán','2025-11-18');
INSERT INTO "products" VALUES('PRD-1087','Imperia Smart City','Tòa Park 1','ISC-Park1-F05U01','Căn hộ 3BR-2WC',82.5,4292000000.0,5060000000.0,'Sắp mở bán','2026-10-12');
INSERT INTO "products" VALUES('PRD-1088','Imperia Smart City','Tòa Park 1','ISC-Park1-F05U02','Căn hộ 2BR-2WC',65.8,3133000000.0,3679000000.0,'Đã bán','2026-02-11');
INSERT INTO "products" VALUES('PRD-1089','Imperia Smart City','Tòa Park 1','ISC-Park1-F06U01','Căn hộ 1BR+1',44.2,2003000000.0,2424000000.0,'Sắp mở bán','2026-09-14');
INSERT INTO "products" VALUES('PRD-1090','Imperia Smart City','Tòa Park 1','ISC-Park1-F06U02','Căn hộ 3BR-2WC',79.3,3944000000.0,4986000000.0,'Đã bán','2026-03-26');
INSERT INTO "products" VALUES('PRD-1091','Imperia Smart City','Tòa Park 1','ISC-Park1-F07U01','Căn hộ 3BR-2WC',82.4,4075000000.0,5138000000.0,'Đã bán','2025-09-29');
INSERT INTO "products" VALUES('PRD-1092','Imperia Smart City','Tòa Park 1','ISC-Park1-F07U02','Căn hộ 2BR-2WC',64.6,3093000000.0,3971000000.0,'Đang bán','2025-11-06');
INSERT INTO "products" VALUES('PRD-1093','Imperia Smart City','Tòa Park 1','ISC-Park1-F08U01','Căn hộ 1BR+1',46.2,2119000000.0,2448000000.0,'Đã bán','2026-04-11');
INSERT INTO "products" VALUES('PRD-1094','Imperia Smart City','Tòa Park 1','ISC-Park1-F08U02','Căn hộ 1BR+1',46.6,2187000000.0,2451000000.0,'Đã bán','2025-11-10');
INSERT INTO "products" VALUES('PRD-1095','Imperia Smart City','Tòa Park 1','ISC-Park1-F09U01','Căn hộ 1BR+1',45.7,2091000000.0,2392000000.0,'Đang bán','2025-10-08');
INSERT INTO "products" VALUES('PRD-1096','Imperia Smart City','Tòa Park 1','ISC-Park1-F09U02','Căn hộ 3BR-2WC',85.0,4399000000.0,5323000000.0,'Đang bán','2026-04-27');
INSERT INTO "products" VALUES('PRD-1097','Imperia Smart City','Tòa Park 1','ISC-Park1-F10U01','Căn hộ 1BR+1',43.5,2018000000.0,2319000000.0,'Đã bán','2025-12-20');
INSERT INTO "products" VALUES('PRD-1098','Imperia Smart City','Tòa Park 1','ISC-Park1-F10U02','Căn hộ 3BR-2WC',80.4,3950000000.0,4793000000.0,'Đang bán','2026-02-27');
INSERT INTO "products" VALUES('PRD-1099','Imperia Smart City','Tòa Park 1','ISC-Park1-F11U01','Căn hộ 2BR-2WC',64.0,2931000000.0,3844000000.0,'Đã bán','2026-01-12');
INSERT INTO "products" VALUES('PRD-1100','Imperia Smart City','Tòa Park 1','ISC-Park1-F11U02','Căn hộ 2BR-2WC',62.3,3094000000.0,3540000000.0,'Đã bán','2025-12-24');
INSERT INTO "products" VALUES('PRD-1101','Imperia Smart City','Tòa Park 1','ISC-Park1-F12U01','Căn hộ 3BR-2WC',83.0,4039000000.0,5362000000.0,'Đã bán','2025-12-14');
INSERT INTO "products" VALUES('PRD-1102','Imperia Smart City','Tòa Park 1','ISC-Park1-F12U02','Căn hộ 1BR+1',44.9,1952000000.0,2392000000.0,'Đã bán','2026-05-04');
INSERT INTO "products" VALUES('PRD-1103','Imperia Smart City','Tòa Park 1','ISC-Park1-F13U01','Căn hộ 3BR-2WC',83.5,4328000000.0,5117000000.0,'Đang bán','2025-11-02');
INSERT INTO "products" VALUES('PRD-1104','Imperia Smart City','Tòa Park 1','ISC-Park1-F13U02','Căn hộ 2BR-2WC',65.3,3247000000.0,3888000000.0,'Đã bán','2025-11-19');
INSERT INTO "products" VALUES('PRD-1105','Imperia Smart City','Tòa Park 1','ISC-Park1-F14U01','Căn hộ 1BR+1',45.8,2126000000.0,2392000000.0,'Đang bán','2025-11-05');
INSERT INTO "products" VALUES('PRD-1106','Imperia Smart City','Tòa Park 1','ISC-Park1-F14U02','Căn hộ 3BR-2WC',84.8,4147000000.0,5296000000.0,'Đã bán','2026-03-08');
INSERT INTO "products" VALUES('PRD-1107','Imperia Smart City','Tòa Park 1','ISC-Park1-F15U01','Căn hộ 1BR+1',43.6,1938000000.0,2398000000.0,'Đã bán','2025-11-16');
INSERT INTO "products" VALUES('PRD-1108','Imperia Smart City','Tòa Park 1','ISC-Park1-F15U02','Căn hộ 3BR-2WC',82.3,4277000000.0,5114000000.0,'Sắp mở bán','2026-08-21');
INSERT INTO "products" VALUES('PRD-1109','Imperia Smart City','Tòa Park 1','ISC-Park1-F16U01','Căn hộ 2BR-2WC',64.0,3129000000.0,3708000000.0,'Đang bán','2025-12-23');
INSERT INTO "products" VALUES('PRD-1110','Imperia Smart City','Tòa Park 1','ISC-Park1-F16U02','Căn hộ 3BR-2WC',81.5,4245000000.0,5090000000.0,'Sắp mở bán','2026-09-29');
INSERT INTO "products" VALUES('PRD-1111','Imperia Smart City','Tòa Park 1','ISC-Park1-F17U01','Căn hộ 3BR-2WC',85.1,4192000000.0,5150000000.0,'Sắp mở bán','2026-09-29');
INSERT INTO "products" VALUES('PRD-1112','Imperia Smart City','Tòa Park 1','ISC-Park1-F17U02','Căn hộ 3BR-2WC',84.8,4322000000.0,5362000000.0,'Đã bán','2025-10-15');
INSERT INTO "products" VALUES('PRD-1113','Imperia Smart City','Tòa Park 1','ISC-Park1-F18U01','Căn hộ 1BR+1',44.0,1907000000.0,2310000000.0,'Đã bán','2026-05-01');
INSERT INTO "products" VALUES('PRD-1114','Imperia Smart City','Tòa Park 1','ISC-Park1-F18U02','Căn hộ 3BR-2WC',81.8,4042000000.0,5011000000.0,'Đã bán','2025-11-10');
INSERT INTO "products" VALUES('PRD-1115','Imperia Smart City','Tòa Park 1','ISC-Park1-F19U01','Căn hộ 1BR+1',47.7,2108000000.0,2478000000.0,'Đã bán','2026-01-13');
INSERT INTO "products" VALUES('PRD-1116','Imperia Smart City','Tòa Park 1','ISC-Park1-F19U02','Căn hộ 1BR+1',43.9,1880000000.0,2334000000.0,'Sắp mở bán','2026-11-01');
INSERT INTO "products" VALUES('PRD-1117','Imperia Smart City','Tòa Park 1','ISC-Park1-F20U01','Căn hộ 2BR-2WC',65.5,3137000000.0,3886000000.0,'Đã bán','2025-11-01');
INSERT INTO "products" VALUES('PRD-1118','Imperia Smart City','Tòa Park 1','ISC-Park1-F20U02','Căn hộ 1BR+1',48.2,2138000000.0,2635000000.0,'Đang bán','2025-11-16');
INSERT INTO "products" VALUES('PRD-1119','Imperia Smart City','Tòa Park 1','ISC-Park1-F21U01','Căn hộ 1BR+1',45.4,1962000000.0,2363000000.0,'Đã bán','2025-12-07');
INSERT INTO "products" VALUES('PRD-1120','Imperia Smart City','Tòa Park 1','ISC-Park1-F21U02','Căn hộ 2BR-2WC',67.9,3277000000.0,3922000000.0,'Đã bán','2026-01-31');
INSERT INTO "products" VALUES('PRD-1121','Imperia Smart City','Tòa Park 2','ISC-Park2-F02U01','Căn hộ 3BR-2WC',82.3,4171000000.0,4970000000.0,'Sắp mở bán','2026-09-06');
INSERT INTO "products" VALUES('PRD-1122','Imperia Smart City','Tòa Park 2','ISC-Park2-F02U02','Căn hộ 1BR+1',45.9,2007000000.0,2478000000.0,'Sắp mở bán','2026-11-05');
INSERT INTO "products" VALUES('PRD-1123','Imperia Smart City','Tòa Park 2','ISC-Park2-F03U01','Căn hộ 1BR+1',46.9,2141000000.0,2602000000.0,'Đã bán','2026-05-16');
INSERT INTO "products" VALUES('PRD-1124','Imperia Smart City','Tòa Park 2','ISC-Park2-F03U02','Căn hộ 2BR-2WC',64.0,2956000000.0,3636000000.0,'Đã bán','2026-03-31');
INSERT INTO "products" VALUES('PRD-1125','Imperia Smart City','Tòa Park 2','ISC-Park2-F04U01','Căn hộ 3BR-2WC',79.9,4070000000.0,4995000000.0,'Đang bán','2026-04-12');
INSERT INTO "products" VALUES('PRD-1126','Imperia Smart City','Tòa Park 2','ISC-Park2-F04U02','Căn hộ 3BR-2WC',82.5,4214000000.0,4931000000.0,'Đã bán','2026-02-28');
INSERT INTO "products" VALUES('PRD-1127','Imperia Smart City','Tòa Park 2','ISC-Park2-F05U01','Căn hộ 3BR-2WC',79.1,4139000000.0,4658000000.0,'Đã bán','2025-12-28');
INSERT INTO "products" VALUES('PRD-1128','Imperia Smart City','Tòa Park 2','ISC-Park2-F05U02','Căn hộ 2BR-2WC',67.4,3087000000.0,3888000000.0,'Đã bán','2025-10-18');
INSERT INTO "products" VALUES('PRD-1129','Imperia Smart City','Tòa Park 2','ISC-Park2-F06U01','Căn hộ 3BR-2WC',81.8,4042000000.0,5178000000.0,'Đang bán','2026-03-09');
INSERT INTO "products" VALUES('PRD-1130','Imperia Smart City','Tòa Park 2','ISC-Park2-F06U02','Căn hộ 2BR-2WC',63.4,3102000000.0,3857000000.0,'Sắp mở bán','2026-11-23');
INSERT INTO "products" VALUES('PRD-1131','Imperia Smart City','Tòa Park 2','ISC-Park2-F07U01','Căn hộ 3BR-2WC',79.2,3988000000.0,4810000000.0,'Đang bán','2026-03-14');
INSERT INTO "products" VALUES('PRD-1132','Imperia Smart City','Tòa Park 2','ISC-Park2-F07U02','Căn hộ 1BR+1',48.3,2115000000.0,2753000000.0,'Đã bán','2026-01-24');
INSERT INTO "products" VALUES('PRD-1133','Imperia Smart City','Tòa Park 2','ISC-Park2-F08U01','Căn hộ 3BR-2WC',82.0,4134000000.0,4814000000.0,'Sắp mở bán','2026-10-26');
INSERT INTO "products" VALUES('PRD-1134','Imperia Smart City','Tòa Park 2','ISC-Park2-F08U02','Căn hộ 3BR-2WC',82.4,3931000000.0,4886000000.0,'Sắp mở bán','2026-09-22');
INSERT INTO "products" VALUES('PRD-1135','Imperia Smart City','Tòa Park 2','ISC-Park2-F09U01','Căn hộ 1BR+1',45.1,2001000000.0,2356000000.0,'Đã bán','2025-11-09');
INSERT INTO "products" VALUES('PRD-1136','Imperia Smart City','Tòa Park 2','ISC-Park2-F09U02','Căn hộ 2BR-2WC',65.2,3030000000.0,3640000000.0,'Đã bán','2025-11-17');
INSERT INTO "products" VALUES('PRD-1137','Imperia Smart City','Tòa Park 2','ISC-Park2-F10U01','Căn hộ 1BR+1',44.0,1913000000.0,2282000000.0,'Đã bán','2025-10-11');
INSERT INTO "products" VALUES('PRD-1138','Imperia Smart City','Tòa Park 2','ISC-Park2-F10U02','Căn hộ 1BR+1',44.8,2106000000.0,2372000000.0,'Sắp mở bán','2026-09-23');
INSERT INTO "products" VALUES('PRD-1139','Imperia Smart City','Tòa Park 2','ISC-Park2-F11U01','Căn hộ 2BR-2WC',68.9,3307000000.0,3948000000.0,'Sắp mở bán','2026-09-02');
INSERT INTO "products" VALUES('PRD-1140','Imperia Smart City','Tòa Park 2','ISC-Park2-F11U02','Căn hộ 1BR+1',47.0,2056000000.0,2635000000.0,'Sắp mở bán','2026-10-07');
INSERT INTO "products" VALUES('PRD-1141','Imperia Smart City','Tòa Park 2','ISC-Park2-F12U01','Căn hộ 3BR-2WC',84.8,4410000000.0,5103000000.0,'Đã bán','2026-04-29');
INSERT INTO "products" VALUES('PRD-1142','Imperia Smart City','Tòa Park 2','ISC-Park2-F12U02','Căn hộ 1BR+1',48.0,2184000000.0,2520000000.0,'Đã bán','2026-05-03');
INSERT INTO "products" VALUES('PRD-1143','Imperia Smart City','Tòa Park 2','ISC-Park2-F13U01','Căn hộ 2BR-2WC',62.8,3107000000.0,3828000000.0,'Sắp mở bán','2026-08-30');
INSERT INTO "products" VALUES('PRD-1144','Imperia Smart City','Tòa Park 2','ISC-Park2-F13U02','Căn hộ 1BR+1',47.0,2200000000.0,2484000000.0,'Đã bán','2026-05-01');
INSERT INTO "products" VALUES('PRD-1145','Imperia Smart City','Tòa Park 2','ISC-Park2-F14U01','Căn hộ 2BR-2WC',65.5,3157000000.0,3878000000.0,'Sắp mở bán','2026-10-11');
INSERT INTO "products" VALUES('PRD-1146','Imperia Smart City','Tòa Park 2','ISC-Park2-F14U02','Căn hộ 1BR+1',44.3,2090000000.0,2323000000.0,'Đang bán','2025-11-28');
INSERT INTO "products" VALUES('PRD-1147','Imperia Smart City','Tòa Park 2','ISC-Park2-F15U01','Căn hộ 1BR+1',45.0,2093000000.0,2341000000.0,'Đang bán','2026-01-21');
INSERT INTO "products" VALUES('PRD-1148','Imperia Smart City','Tòa Park 2','ISC-Park2-F15U02','Căn hộ 2BR-2WC',65.3,3011000000.0,3744000000.0,'Đã bán','2026-01-12');
INSERT INTO "products" VALUES('PRD-1149','Imperia Smart City','Tòa Park 2','ISC-Park2-F16U01','Căn hộ 1BR+1',47.3,2226000000.0,2498000000.0,'Sắp mở bán','2026-09-06');
INSERT INTO "products" VALUES('PRD-1150','Imperia Smart City','Tòa Park 2','ISC-Park2-F16U02','Căn hộ 1BR+1',43.2,1856000000.0,2322000000.0,'Sắp mở bán','2026-08-20');
INSERT INTO "products" VALUES('PRD-1151','Imperia Smart City','Tòa Park 2','ISC-Park2-F17U01','Căn hộ 1BR+1',47.8,2223000000.0,2653000000.0,'Sắp mở bán','2026-10-05');
INSERT INTO "products" VALUES('PRD-1152','Imperia Smart City','Tòa Park 2','ISC-Park2-F17U02','Căn hộ 3BR-2WC',80.7,3917000000.0,4981000000.0,'Sắp mở bán','2026-10-16');
INSERT INTO "products" VALUES('PRD-1153','Imperia Smart City','Tòa Park 2','ISC-Park2-F18U01','Căn hộ 1BR+1',43.5,2014000000.0,2388000000.0,'Sắp mở bán','2026-10-09');
INSERT INTO "products" VALUES('PRD-1154','Imperia Smart City','Tòa Park 2','ISC-Park2-F18U02','Căn hộ 3BR-2WC',84.2,4206000000.0,5201000000.0,'Sắp mở bán','2026-11-20');
INSERT INTO "products" VALUES('PRD-1155','Imperia Smart City','Tòa Park 2','ISC-Park2-F19U01','Căn hộ 2BR-2WC',67.6,3369000000.0,4101000000.0,'Sắp mở bán','2026-10-19');
INSERT INTO "products" VALUES('PRD-1156','Imperia Smart City','Tòa Park 2','ISC-Park2-F19U02','Căn hộ 2BR-2WC',64.3,2959000000.0,3927000000.0,'Sắp mở bán','2026-11-02');
INSERT INTO "products" VALUES('PRD-1157','Imperia Smart City','Tòa Park 2','ISC-Park2-F20U01','Căn hộ 1BR+1',44.9,2037000000.0,2484000000.0,'Sắp mở bán','2026-10-11');
INSERT INTO "products" VALUES('PRD-1158','Imperia Smart City','Tòa Park 2','ISC-Park2-F20U02','Căn hộ 3BR-2WC',78.3,4049000000.0,4931000000.0,'Sắp mở bán','2026-09-17');
INSERT INTO "products" VALUES('PRD-1159','Imperia Smart City','Tòa Park 2','ISC-Park2-F21U01','Căn hộ 3BR-2WC',79.4,4051000000.0,5121000000.0,'Sắp mở bán','2026-10-15');
INSERT INTO "products" VALUES('PRD-1160','Imperia Smart City','Tòa Park 2','ISC-Park2-F21U02','Căn hộ 1BR+1',48.2,2264000000.0,2708000000.0,'Sắp mở bán','2026-10-19');
INSERT INTO "products" VALUES('PRD-1161','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F02U01','Duplex',120.5,7639000000.0,9589000000.0,'Đã bán','2026-03-28');
INSERT INTO "products" VALUES('PRD-1162','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F02U02','Penthouse',180.3,13706000000.0,16619000000.0,'Đã bán','2026-04-18');
INSERT INTO "products" VALUES('PRD-1163','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F03U01','Duplex',137.8,9134000000.0,11418000000.0,'Đang bán','2026-02-13');
INSERT INTO "products" VALUES('PRD-1164','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F03U02','Căn hộ 2BR-2WC',62.1,3064000000.0,3817000000.0,'Đã bán','2026-01-31');
INSERT INTO "products" VALUES('PRD-1165','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F04U01','Căn hộ 2BR-2WC',67.4,3281000000.0,4031000000.0,'Sắp mở bán','2026-10-30');
INSERT INTO "products" VALUES('PRD-1166','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F04U02','Căn hộ 2BR-2WC',63.5,3043000000.0,3858000000.0,'Sắp mở bán','2026-11-14');
INSERT INTO "products" VALUES('PRD-1167','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F05U01','Căn hộ 3BR-2WC',84.2,4063000000.0,5443000000.0,'Đã bán','2026-03-15');
INSERT INTO "products" VALUES('PRD-1168','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F05U02','Penthouse',213.6,15942000000.0,20430000000.0,'Đã bán','2025-11-22');
INSERT INTO "products" VALUES('PRD-1169','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F06U01','Penthouse',211.5,16520000000.0,21159000000.0,'Đang bán','2026-02-27');
INSERT INTO "products" VALUES('PRD-1170','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F06U02','Căn hộ 2BR-2WC',68.6,3228000000.0,4148000000.0,'Sắp mở bán','2026-09-25');
INSERT INTO "products" VALUES('PRD-1171','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F07U01','Duplex',134.6,8609000000.0,10651000000.0,'Đã bán','2025-12-06');
INSERT INTO "products" VALUES('PRD-1172','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F07U02','Căn hộ 2BR-2WC',62.8,3075000000.0,3811000000.0,'Sắp mở bán','2026-11-03');
INSERT INTO "products" VALUES('PRD-1173','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F08U01','Căn hộ 2BR-2WC',64.5,2951000000.0,3739000000.0,'Đã bán','2026-02-20');
INSERT INTO "products" VALUES('PRD-1174','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F08U02','Căn hộ 2BR-2WC',68.7,3249000000.0,4223000000.0,'Đã bán','2025-11-26');
INSERT INTO "products" VALUES('PRD-1175','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F09U01','Penthouse',210.2,15637000000.0,20064000000.0,'Đang bán','2026-02-04');
INSERT INTO "products" VALUES('PRD-1176','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F09U02','Penthouse',188.9,14254000000.0,17694000000.0,'Sắp mở bán','2026-10-23');
INSERT INTO "products" VALUES('PRD-1177','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F10U01','Duplex',125.9,8532000000.0,9833000000.0,'Đã bán','2025-10-14');
INSERT INTO "products" VALUES('PRD-1178','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F10U02','Duplex',139.4,8658000000.0,11618000000.0,'Đã bán','2025-09-29');
INSERT INTO "products" VALUES('PRD-1179','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F11U01','Penthouse',217.4,16289000000.0,20771000000.0,'Đã bán','2026-02-01');
INSERT INTO "products" VALUES('PRD-1180','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F11U02','Penthouse',170.8,13352000000.0,17170000000.0,'Đã bán','2026-03-26');
INSERT INTO "products" VALUES('PRD-1181','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F12U01','Penthouse',195.9,15258000000.0,18294000000.0,'Sắp mở bán','2026-09-21');
INSERT INTO "products" VALUES('PRD-1182','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F12U02','Penthouse',175.5,13771000000.0,16064000000.0,'Đã bán','2026-01-22');
INSERT INTO "products" VALUES('PRD-1183','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F13U01','Căn hộ 3BR-2WC',85.3,4237000000.0,5317000000.0,'Đã bán','2025-12-16');
INSERT INTO "products" VALUES('PRD-1184','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F13U02','Căn hộ 3BR-2WC',79.0,3990000000.0,4888000000.0,'Đã bán','2025-11-28');
INSERT INTO "products" VALUES('PRD-1185','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F14U01','Căn hộ 3BR-2WC',79.2,3967000000.0,5050000000.0,'Sắp mở bán','2026-09-27');
INSERT INTO "products" VALUES('PRD-1186','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F14U02','Duplex',134.6,8994000000.0,10367000000.0,'Đã bán','2026-04-20');
INSERT INTO "products" VALUES('PRD-1187','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F15U01','Căn hộ 2BR-2WC',63.7,3072000000.0,3732000000.0,'Sắp mở bán','2026-11-09');
INSERT INTO "products" VALUES('PRD-1188','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F15U02','Duplex',127.8,8601000000.0,10197000000.0,'Đã bán','2026-01-14');
INSERT INTO "products" VALUES('PRD-1189','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F16U01','Căn hộ 3BR-2WC',79.5,3908000000.0,4956000000.0,'Đã bán','2026-04-30');
INSERT INTO "products" VALUES('PRD-1190','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F16U02','Penthouse',218.8,16338000000.0,20439000000.0,'Đã bán','2025-11-06');
INSERT INTO "products" VALUES('PRD-1191','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F17U01','Penthouse',216.9,16089000000.0,20761000000.0,'Đã bán','2025-12-18');
INSERT INTO "products" VALUES('PRD-1192','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F17U02','Penthouse',199.3,14871000000.0,18595000000.0,'Đã bán','2026-03-13');
INSERT INTO "products" VALUES('PRD-1193','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F18U01','Penthouse',188.7,14505000000.0,18245000000.0,'Đã bán','2025-10-18');
INSERT INTO "products" VALUES('PRD-1194','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F18U02','Duplex',137.7,9290000000.0,10736000000.0,'Đang bán','2026-01-15');
INSERT INTO "products" VALUES('PRD-1195','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F19U01','Penthouse',186.5,13978000000.0,17655000000.0,'Đã bán','2025-11-25');
INSERT INTO "products" VALUES('PRD-1196','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F19U02','Căn hộ 3BR-2WC',82.9,4351000000.0,5042000000.0,'Đã bán','2026-01-01');
INSERT INTO "products" VALUES('PRD-1197','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F20U01','Căn hộ 2BR-2WC',68.2,3328000000.0,4052000000.0,'Đã bán','2026-03-26');
INSERT INTO "products" VALUES('PRD-1198','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F20U02','Căn hộ 2BR-2WC',67.9,3204000000.0,3902000000.0,'Đang bán','2026-04-21');
INSERT INTO "products" VALUES('PRD-1199','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F21U01','Penthouse',184.4,13348000000.0,17779000000.0,'Đã bán','2026-01-04');
INSERT INTO "products" VALUES('PRD-1200','The Matrix One Phase 2','Tòa B1 Matrix Chaise','TMO-B1MatrixChaise-F21U02','Căn hộ 2BR-2WC',64.2,3185000000.0,3883000000.0,'Đã bán','2025-11-12');
INSERT INTO "products" VALUES('PRD-1201','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F02U01','Duplex',110.5,7344000000.0,8683000000.0,'Đã bán','2026-02-21');
INSERT INTO "products" VALUES('PRD-1202','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F02U02','Căn hộ 3BR-2WC',82.5,4052000000.0,5145000000.0,'Đã bán','2025-12-10');
INSERT INTO "products" VALUES('PRD-1203','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F03U01','Căn hộ 2BR-2WC',63.0,2884000000.0,3832000000.0,'Đã bán','2026-04-10');
INSERT INTO "products" VALUES('PRD-1204','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F03U02','Duplex',112.4,7322000000.0,9116000000.0,'Đang bán','2026-05-14');
INSERT INTO "products" VALUES('PRD-1205','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F04U01','Căn hộ 2BR-2WC',64.9,3152000000.0,3833000000.0,'Đã bán','2025-10-22');
INSERT INTO "products" VALUES('PRD-1206','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F04U02','Duplex',120.2,7460000000.0,9907000000.0,'Đã bán','2026-03-04');
INSERT INTO "products" VALUES('PRD-1207','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F05U01','Căn hộ 2BR-2WC',64.7,3021000000.0,3890000000.0,'Đã bán','2026-03-14');
INSERT INTO "products" VALUES('PRD-1208','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F05U02','Căn hộ 3BR-2WC',80.4,4158000000.0,4735000000.0,'Sắp mở bán','2026-10-04');
INSERT INTO "products" VALUES('PRD-1209','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F06U01','Penthouse',218.9,16866000000.0,21704000000.0,'Đang bán','2025-12-05');
INSERT INTO "products" VALUES('PRD-1210','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F06U02','Penthouse',219.8,17131000000.0,21525000000.0,'Đã bán','2025-11-01');
INSERT INTO "products" VALUES('PRD-1211','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F07U01','Penthouse',185.5,14393000000.0,17192000000.0,'Đã bán','2025-11-17');
INSERT INTO "products" VALUES('PRD-1212','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F07U02','Duplex',120.7,8200000000.0,9439000000.0,'Sắp mở bán','2026-09-27');
INSERT INTO "products" VALUES('PRD-1213','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F08U01','Penthouse',202.7,14652000000.0,19832000000.0,'Đã bán','2026-02-28');
INSERT INTO "products" VALUES('PRD-1214','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F08U02','Penthouse',179.9,13910000000.0,17573000000.0,'Sắp mở bán','2026-10-08');
INSERT INTO "products" VALUES('PRD-1215','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F09U01','Căn hộ 2BR-2WC',66.9,3250000000.0,4010000000.0,'Sắp mở bán','2026-08-28');
INSERT INTO "products" VALUES('PRD-1216','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F09U02','Căn hộ 2BR-2WC',63.4,3049000000.0,3603000000.0,'Sắp mở bán','2026-10-19');
INSERT INTO "products" VALUES('PRD-1217','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F10U01','Penthouse',176.2,13384000000.0,17122000000.0,'Đã bán','2026-02-07');
INSERT INTO "products" VALUES('PRD-1218','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F10U02','Duplex',136.4,9198000000.0,11050000000.0,'Đã bán','2025-10-26');
INSERT INTO "products" VALUES('PRD-1219','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F11U01','Duplex',134.3,8744000000.0,11193000000.0,'Đã bán','2025-11-29');
INSERT INTO "products" VALUES('PRD-1220','The Matrix One Phase 2','Tòa B2 Matrix Chaise','TMO-B2MatrixChaise-F11U02','Căn hộ 3BR-2WC',81.4,4227000000.0,5077000000.0,'Sắp mở bán','2026-08-23');
CREATE TABLE sales_agents (
        agent_id TEXT PRIMARY KEY,
        full_name TEXT NOT NULL,
        agency_name TEXT NOT NULL,
        phone TEXT,
        email TEXT,
        position TEXT NOT NULL,
        hire_date TEXT NOT NULL,
        status TEXT NOT NULL CHECK (status IN ('Đang hoạt động', 'Tạm nghỉ'))
    );
INSERT INTO "sales_agents" VALUES('SA-1001','Trần Văn Phương','Khải Hoàn Land','0968825109','trần.văn.phương@khảihoànland.com','Chuyên viên tư vấn cao cấp','2023-08-22','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1002','Hồ Minh Duy','Mai Việt Land','0915767679','hồ.minh.duy@maiviệtland.com','Giám đốc sàn','2023-07-02','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1003','Bùi Thị Khang','Mai Việt Land','0928130016','bùi.thị.khang@maiviệtland.com','Trưởng nhóm kinh doanh','2023-01-11','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1004','Bùi Minh Linh','Khải Hoàn Land','0990430095','bùi.minh.linh@khảihoànland.com','Chuyên viên tư vấn','2023-06-02','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1005','Dương Minh Hương','Mai Việt Land','0913128076','dương.minh.hương@maiviệtland.com','Giám đốc sàn','2024-12-17','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1006','Lý Hoàng Tuấn','MIK Direct Sales','0974495810','sales.lý.hoàng.tuấn@mikgroup.vn','Trưởng nhóm kinh doanh','2025-07-27','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1007','Trần Đức Hương','MIK Direct Sales','0967607001','sales.trần.đức.hương@mikgroup.vn','Trưởng nhóm kinh doanh','2025-10-16','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1008','Vũ Thái Thảo','Sunland Realty','0911197901','vũ.thái.thảo@sunlandrealty.com','Chuyên viên tư vấn cao cấp','2024-02-05','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1009','Vũ Ngọc Tuấn','Mai Việt Land','0984115854','vũ.ngọc.tuấn@maiviệtland.com','Giám đốc sàn','2024-01-17','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1010','Nguyễn Hoàng Hải','Đông Tây Land','0975226343','nguyễn.hoàng.hải@đôngtâyland.com','Trưởng nhóm kinh doanh','2023-07-05','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1011','Hoàng Đức Trang','Mai Việt Land','0962280666','hoàng.đức.trang@maiviệtland.com','Chuyên viên tư vấn','2025-11-21','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1012','Đỗ Thanh Hùng','Era Vietnam','0958362686','đỗ.thanh.hùng@eravietnam.com','Chuyên viên tư vấn cao cấp','2024-11-04','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1013','Lý Khánh Hải','Era Vietnam','0976866594','lý.khánh.hải@eravietnam.com','Trưởng nhóm kinh doanh','2024-01-23','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1014','Lý Thu Khang','MIK Direct Sales','0918036535','sales.lý.thu.khang@mikgroup.vn','Giám đốc sàn','2025-12-24','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1015','Vũ Văn Linh','Era Vietnam','0949806990','vũ.văn.linh@eravietnam.com','Giám đốc sàn','2023-10-10','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1016','Trần Thu Linh','Sunland Realty','0929940548','trần.thu.linh@sunlandrealty.com','Giám đốc sàn','2023-01-20','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1017','Phạm Minh Hương','MIK Direct Sales','0957851957','sales.phạm.minh.hương@mikgroup.vn','Chuyên viên tư vấn cao cấp','2023-11-12','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1018','Vũ Bảo Phương','MIK Direct Sales','0976610054','sales.vũ.bảo.phương@mikgroup.vn','Chuyên viên tư vấn cao cấp','2025-03-20','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1019','Đỗ Hoàng Trinh','MIK Direct Sales','0938965534','sales.đỗ.hoàng.trinh@mikgroup.vn','Chuyên viên tư vấn cao cấp','2023-05-01','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1020','Đặng Khánh Phúc','Đông Tây Land','0995384339','đặng.khánh.phúc@đôngtâyland.com','Chuyên viên tư vấn','2024-07-08','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1021','Phạm Thanh Anh','Mai Việt Land','0913342482','phạm.thanh.anh@maiviệtland.com','Trưởng nhóm kinh doanh','2024-03-18','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1022','Lý Thị Anh','MIK Direct Sales','0983466725','sales.lý.thị.anh@mikgroup.vn','Trưởng nhóm kinh doanh','2024-05-08','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1023','Đặng Thị Đạt','MIK Direct Sales','0986069796','sales.đặng.thị.đạt@mikgroup.vn','Chuyên viên tư vấn','2024-03-19','Tạm nghỉ');
INSERT INTO "sales_agents" VALUES('SA-1024','Dương Thu Nam','Era Vietnam','0916245631','dương.thu.nam@eravietnam.com','Trưởng nhóm kinh doanh','2024-07-06','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1025','Hoàng Quang Trinh','Sunland Realty','0918913375','hoàng.quang.trinh@sunlandrealty.com','Giám đốc sàn','2023-05-21','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1026','Dương Hoàng Linh','Era Vietnam','0984974942','dương.hoàng.linh@eravietnam.com','Chuyên viên tư vấn cao cấp','2023-05-02','Tạm nghỉ');
INSERT INTO "sales_agents" VALUES('SA-1027','Hồ Thái Anh','Mai Việt Land','0989820972','hồ.thái.anh@maiviệtland.com','Chuyên viên tư vấn cao cấp','2023-07-12','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1028','Đặng Thái Khang','Mai Việt Land','0941590273','đặng.thái.khang@maiviệtland.com','Chuyên viên tư vấn','2024-06-17','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1029','Trần Thu Hùng','Khải Hoàn Land','0929939383','trần.thu.hùng@khảihoànland.com','Trưởng nhóm kinh doanh','2023-07-16','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1030','Vũ Minh Hùng','Era Vietnam','0987608167','vũ.minh.hùng@eravietnam.com','Chuyên viên tư vấn','2025-06-23','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1031','Bùi Minh Linh','Khải Hoàn Land','0991325128','bùi.minh.linh@khảihoànland.com','Chuyên viên tư vấn','2023-06-17','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1032','Trần Hoàng Tuấn','Khải Hoàn Land','0983029616','trần.hoàng.tuấn@khảihoànland.com','Chuyên viên tư vấn','2024-11-13','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1033','Hồ Thị Anh','Mai Việt Land','0958389610','hồ.thị.anh@maiviệtland.com','Chuyên viên tư vấn','2023-09-04','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1034','Đỗ Văn Nam','MIK Direct Sales','0966662860','sales.đỗ.văn.nam@mikgroup.vn','Chuyên viên tư vấn','2024-03-25','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1035','Lý Thái Cường','Mai Việt Land','0912738900','lý.thái.cường@maiviệtland.com','Giám đốc sàn','2024-06-08','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1036','Phạm Quang Đạt','Sunland Realty','0974500393','phạm.quang.đạt@sunlandrealty.com','Trưởng nhóm kinh doanh','2023-10-28','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1037','Nguyễn Thanh Hà','Era Vietnam','0990149616','nguyễn.thanh.hà@eravietnam.com','Chuyên viên tư vấn','2023-10-03','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1038','Vũ Hữu Phúc','Khải Hoàn Land','0941785635','vũ.hữu.phúc@khảihoànland.com','Chuyên viên tư vấn','2024-03-25','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1039','Phạm Thanh Đạt','Khải Hoàn Land','0952345545','phạm.thanh.đạt@khảihoànland.com','Chuyên viên tư vấn','2024-04-18','Đang hoạt động');
INSERT INTO "sales_agents" VALUES('SA-1040','Đỗ Khánh Trinh','MIK Direct Sales','0919269532','sales.đỗ.khánh.trinh@mikgroup.vn','Chuyên viên tư vấn','2023-03-22','Đang hoạt động');
CREATE TABLE sales_plan (
        plan_id TEXT PRIMARY KEY,
        period_month TEXT NOT NULL, -- Format YYYY-MM
        project_name TEXT NOT NULL,
        target_units INTEGER NOT NULL,
        target_revenue REAL NOT NULL,
        target_commission_budget REAL NOT NULL,
        notes TEXT
    );
INSERT INTO "sales_plan" VALUES('PLN-2026-01-ISC','2026-01','Imperia Smart City',25,80000000000.0,2800000000.0,'Kế hoạch bán hàng tháng 01/2026 - Dự án Imperia Smart City');
INSERT INTO "sales_plan" VALUES('PLN-2026-01-TMO','2026-01','The Matrix One Phase 2',16,104000000000.0,3640000000.0,'Kế hoạch bán hàng tháng 01/2026 - Dự án The Matrix One Phase 2');
INSERT INTO "sales_plan" VALUES('PLN-2026-01-IOP','2026-01','Imperia Ocean Park',17,64600000000.0,2261000000.0,'Kế hoạch bán hàng tháng 01/2026 - Dự án Imperia Ocean Park');
INSERT INTO "sales_plan" VALUES('PLN-2026-01-IGP','2026-01','Imperia Grand Plaza Đức Hòa',13,110500000000.0,3868000000.0,'Kế hoạch bán hàng tháng 01/2026 - Dự án Imperia Grand Plaza Đức Hòa');
INSERT INTO "sales_plan" VALUES('PLN-2026-02-ISC','2026-02','Imperia Smart City',19,60800000000.0,2128000000.0,'Kế hoạch bán hàng tháng 02/2026 - Dự án Imperia Smart City');
INSERT INTO "sales_plan" VALUES('PLN-2026-02-TMO','2026-02','The Matrix One Phase 2',10,65000000000.0,2275000000.0,'Kế hoạch bán hàng tháng 02/2026 - Dự án The Matrix One Phase 2');
INSERT INTO "sales_plan" VALUES('PLN-2026-02-IOP','2026-02','Imperia Ocean Park',14,53200000000.0,1862000000.0,'Kế hoạch bán hàng tháng 02/2026 - Dự án Imperia Ocean Park');
INSERT INTO "sales_plan" VALUES('PLN-2026-02-IGP','2026-02','Imperia Grand Plaza Đức Hòa',9,76500000000.0,2678000000.0,'Kế hoạch bán hàng tháng 02/2026 - Dự án Imperia Grand Plaza Đức Hòa');
INSERT INTO "sales_plan" VALUES('PLN-2026-03-ISC','2026-03','Imperia Smart City',15,48000000000.0,1680000000.0,'Kế hoạch bán hàng tháng 03/2026 - Dự án Imperia Smart City');
INSERT INTO "sales_plan" VALUES('PLN-2026-03-TMO','2026-03','The Matrix One Phase 2',11,71500000000.0,2502000000.0,'Kế hoạch bán hàng tháng 03/2026 - Dự án The Matrix One Phase 2');
INSERT INTO "sales_plan" VALUES('PLN-2026-03-IOP','2026-03','Imperia Ocean Park',17,64600000000.0,2261000000.0,'Kế hoạch bán hàng tháng 03/2026 - Dự án Imperia Ocean Park');
INSERT INTO "sales_plan" VALUES('PLN-2026-03-IGP','2026-03','Imperia Grand Plaza Đức Hòa',12,102000000000.0,3570000000.0,'Kế hoạch bán hàng tháng 03/2026 - Dự án Imperia Grand Plaza Đức Hòa');
INSERT INTO "sales_plan" VALUES('PLN-2026-04-ISC','2026-04','Imperia Smart City',22,70400000000.0,2464000000.0,'Kế hoạch bán hàng tháng 04/2026 - Dự án Imperia Smart City');
INSERT INTO "sales_plan" VALUES('PLN-2026-04-TMO','2026-04','The Matrix One Phase 2',15,97500000000.0,3413000000.0,'Kế hoạch bán hàng tháng 04/2026 - Dự án The Matrix One Phase 2');
INSERT INTO "sales_plan" VALUES('PLN-2026-04-IOP','2026-04','Imperia Ocean Park',18,68400000000.0,2394000000.0,'Kế hoạch bán hàng tháng 04/2026 - Dự án Imperia Ocean Park');
INSERT INTO "sales_plan" VALUES('PLN-2026-04-IGP','2026-04','Imperia Grand Plaza Đức Hòa',14,119000000000.0,4165000000.0,'Kế hoạch bán hàng tháng 04/2026 - Dự án Imperia Grand Plaza Đức Hòa');
INSERT INTO "sales_plan" VALUES('PLN-2026-05-ISC','2026-05','Imperia Smart City',16,51200000000.0,1792000000.0,'Kế hoạch bán hàng tháng 05/2026 - Dự án Imperia Smart City');
INSERT INTO "sales_plan" VALUES('PLN-2026-05-TMO','2026-05','The Matrix One Phase 2',17,110500000000.0,3868000000.0,'Kế hoạch bán hàng tháng 05/2026 - Dự án The Matrix One Phase 2');
INSERT INTO "sales_plan" VALUES('PLN-2026-05-IOP','2026-05','Imperia Ocean Park',22,83600000000.0,2926000000.0,'Kế hoạch bán hàng tháng 05/2026 - Dự án Imperia Ocean Park');
INSERT INTO "sales_plan" VALUES('PLN-2026-05-IGP','2026-05','Imperia Grand Plaza Đức Hòa',9,76500000000.0,2678000000.0,'Kế hoạch bán hàng tháng 05/2026 - Dự án Imperia Grand Plaza Đức Hòa');
INSERT INTO "sales_plan" VALUES('PLN-2026-06-ISC','2026-06','Imperia Smart City',25,80000000000.0,2800000000.0,'Kế hoạch bán hàng tháng 06/2026 - Dự án Imperia Smart City');
INSERT INTO "sales_plan" VALUES('PLN-2026-06-TMO','2026-06','The Matrix One Phase 2',18,117000000000.0,4095000000.0,'Kế hoạch bán hàng tháng 06/2026 - Dự án The Matrix One Phase 2');
INSERT INTO "sales_plan" VALUES('PLN-2026-06-IOP','2026-06','Imperia Ocean Park',18,68400000000.0,2394000000.0,'Kế hoạch bán hàng tháng 06/2026 - Dự án Imperia Ocean Park');
INSERT INTO "sales_plan" VALUES('PLN-2026-06-IGP','2026-06','Imperia Grand Plaza Đức Hòa',14,119000000000.0,4165000000.0,'Kế hoạch bán hàng tháng 06/2026 - Dự án Imperia Grand Plaza Đức Hòa');
INSERT INTO "sales_plan" VALUES('PLN-2026-07-ISC','2026-07','Imperia Smart City',21,67200000000.0,2352000000.0,'Kế hoạch bán hàng tháng 07/2026 - Dự án Imperia Smart City');
INSERT INTO "sales_plan" VALUES('PLN-2026-07-TMO','2026-07','The Matrix One Phase 2',18,117000000000.0,4095000000.0,'Kế hoạch bán hàng tháng 07/2026 - Dự án The Matrix One Phase 2');
INSERT INTO "sales_plan" VALUES('PLN-2026-07-IOP','2026-07','Imperia Ocean Park',14,53200000000.0,1862000000.0,'Kế hoạch bán hàng tháng 07/2026 - Dự án Imperia Ocean Park');
INSERT INTO "sales_plan" VALUES('PLN-2026-07-IGP','2026-07','Imperia Grand Plaza Đức Hòa',10,85000000000.0,2975000000.0,'Kế hoạch bán hàng tháng 07/2026 - Dự án Imperia Grand Plaza Đức Hòa');
INSERT INTO "sales_plan" VALUES('PLN-2026-08-ISC','2026-08','Imperia Smart City',10,32000000000.0,1120000000.0,'Kế hoạch bán hàng tháng 08/2026 - Dự án Imperia Smart City (Số liệu chốt tới 15/08/2026)');
INSERT INTO "sales_plan" VALUES('PLN-2026-08-TMO','2026-08','The Matrix One Phase 2',8,52000000000.0,1820000000.0,'Kế hoạch bán hàng tháng 08/2026 - Dự án The Matrix One Phase 2 (Số liệu chốt tới 15/08/2026)');
INSERT INTO "sales_plan" VALUES('PLN-2026-08-IOP','2026-08','Imperia Ocean Park',9,34200000000.0,1197000000.0,'Kế hoạch bán hàng tháng 08/2026 - Dự án Imperia Ocean Park (Số liệu chốt tới 15/08/2026)');
INSERT INTO "sales_plan" VALUES('PLN-2026-08-IGP','2026-08','Imperia Grand Plaza Đức Hòa',7,59500000000.0,2083000000.0,'Kế hoạch bán hàng tháng 08/2026 - Dự án Imperia Grand Plaza Đức Hòa (Số liệu chốt tới 15/08/2026)');
CREATE TABLE sales_transactions (
        transaction_id TEXT PRIMARY KEY,
        product_id TEXT NOT NULL UNIQUE,
        agent_id TEXT NOT NULL,
        transaction_date TEXT NOT NULL,
        contract_type TEXT NOT NULL CHECK (contract_type IN ('Văn bản thỏa thuận cọc', 'Hợp đồng mua bán')),
        gross_price REAL NOT NULL,
        discount_amount REAL NOT NULL,
        net_revenue REAL NOT NULL,
        commission_rate REAL NOT NULL,
        commission_amount REAL NOT NULL,
        payment_status TEXT NOT NULL CHECK (payment_status IN ('Đã thanh toán', 'Chờ duyệt đợt 2', 'Chờ làm HĐMB')),
        FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE RESTRICT,
        FOREIGN KEY (agent_id) REFERENCES sales_agents (agent_id) ON DELETE RESTRICT
    );
INSERT INTO "sales_transactions" VALUES('TX-2026-0001','PRD-1090','SA-1002','2026-07-18','Hợp đồng mua bán',4986000000.0,299200000.0,4686800000.0,0.035,164040000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0002','PRD-1188','SA-1005','2026-02-06','Hợp đồng mua bán',10197000000.0,305900000.0,9891100000.0,0.025,247280000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0003','PRD-1189','SA-1016','2026-05-29','Hợp đồng mua bán',4956000000.0,247800000.0,4708200000.0,0.045,211870000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0004','PRD-1006','SA-1038','2026-07-02','Hợp đồng mua bán',3997000000.0,279800000.0,3717200000.0,0.03,111520000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0005','PRD-1009','SA-1028','2026-07-15','Hợp đồng mua bán',3811000000.0,266800000.0,3544200000.0,0.035,124050000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0006','PRD-1047','SA-1027','2026-06-10','Hợp đồng mua bán',3605000000.0,216300000.0,3388700000.0,0.04,135550000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0007','PRD-1004','SA-1040','2026-08-12','Hợp đồng mua bán',2660000000.0,186200000.0,2473800000.0,0.035,86580000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0008','PRD-1142','SA-1006','2026-05-06','Hợp đồng mua bán',2520000000.0,151200000.0,2368800000.0,0.03,71060000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0009','PRD-1179','SA-1021','2026-05-17','Hợp đồng mua bán',20771000000.0,830800000.0,19940200000.0,0.045,897310000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0010','PRD-1015','SA-1003','2026-07-20','Hợp đồng mua bán',5161000000.0,206400000.0,4954600000.0,0.04,198180000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0011','PRD-1113','SA-1008','2026-06-12','Hợp đồng mua bán',2310000000.0,161700000.0,2148300000.0,0.035,75190000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0012','PRD-1195','SA-1014','2026-05-08','Hợp đồng mua bán',17655000000.0,882800000.0,16772200000.0,0.03,503170000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0013','PRD-1128','SA-1001','2026-07-23','Hợp đồng mua bán',3888000000.0,194400000.0,3693600000.0,0.025,92340000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0014','PRD-1120','SA-1007','2026-04-18','Hợp đồng mua bán',3922000000.0,235300000.0,3686700000.0,0.03,110600000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0015','PRD-1093','SA-1007','2026-04-27','Hợp đồng mua bán',2448000000.0,73400000.0,2374600000.0,0.035,83110000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0016','PRD-1186','SA-1008','2026-06-21','Hợp đồng mua bán',10367000000.0,725700000.0,9641300000.0,0.04,385650000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0017','PRD-1101','SA-1020','2026-07-05','Hợp đồng mua bán',5362000000.0,321700000.0,5040300000.0,0.035,176410000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0018','PRD-1069','SA-1027','2026-07-14','Hợp đồng mua bán',5030000000.0,352100000.0,4677900000.0,0.035,163730000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0019','PRD-1180','SA-1011','2026-04-26','Hợp đồng mua bán',17170000000.0,1201900000.0,15968100000.0,0.035,558880000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0020','PRD-1210','SA-1009','2026-01-30','Hợp đồng mua bán',21525000000.0,1291500000.0,20233500000.0,0.045,910510000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0021','PRD-1041','SA-1027','2026-08-09','Văn bản thỏa thuận cọc',3811000000.0,152400000.0,3658600000.0,0.035,128050000.0,'Chờ làm HĐMB');
INSERT INTO "sales_transactions" VALUES('TX-2026-0022','PRD-1016','SA-1005','2026-02-26','Hợp đồng mua bán',5080000000.0,152400000.0,4927600000.0,0.035,172470000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0023','PRD-1213','SA-1034','2026-07-15','Hợp đồng mua bán',19832000000.0,595000000.0,19237000000.0,0.04,769480000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0024','PRD-1031','SA-1008','2026-01-17','Hợp đồng mua bán',3932000000.0,118000000.0,3814000000.0,0.045,171630000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0025','PRD-1032','SA-1010','2026-03-07','Hợp đồng mua bán',5162000000.0,361300000.0,4800700000.0,0.035,168020000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0026','PRD-1117','SA-1015','2026-04-30','Hợp đồng mua bán',3886000000.0,116600000.0,3769400000.0,0.035,131930000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0027','PRD-1094','SA-1025','2026-05-20','Hợp đồng mua bán',2451000000.0,122600000.0,2328400000.0,0.045,104780000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0028','PRD-1106','SA-1028','2026-07-09','Hợp đồng mua bán',5296000000.0,370700000.0,4925300000.0,0.025,123130000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0029','PRD-1144','SA-1028','2026-05-25','Hợp đồng mua bán',2484000000.0,149000000.0,2335000000.0,0.025,58380000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0030','PRD-1029','SA-1013','2026-08-13','Hợp đồng mua bán',2511000000.0,100400000.0,2410600000.0,0.03,72320000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0031','PRD-1046','SA-1012','2026-06-28','Hợp đồng mua bán',5211000000.0,156300000.0,5054700000.0,0.035,176910000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0032','PRD-1097','SA-1037','2026-04-02','Hợp đồng mua bán',2319000000.0,69600000.0,2249400000.0,0.045,101220000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0033','PRD-1058','SA-1004','2026-04-11','Hợp đồng mua bán',5152000000.0,309100000.0,4842900000.0,0.035,169500000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0034','PRD-1017','SA-1015','2026-05-08','Hợp đồng mua bán',4854000000.0,242700000.0,4611300000.0,0.03,138340000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0035','PRD-1211','SA-1010','2026-06-02','Hợp đồng mua bán',17192000000.0,1203400000.0,15988600000.0,0.035,559600000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0036','PRD-1205','SA-1011','2026-07-03','Hợp đồng mua bán',3833000000.0,268300000.0,3564700000.0,0.04,142590000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0037','PRD-1167','SA-1021','2026-07-29','Hợp đồng mua bán',5443000000.0,163300000.0,5279700000.0,0.035,184790000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0038','PRD-1045','SA-1013','2026-08-05','Văn bản thỏa thuận cọc',3797000000.0,151900000.0,3645100000.0,0.03,109350000.0,'Chờ làm HĐMB');
INSERT INTO "sales_transactions" VALUES('TX-2026-0039','PRD-1183','SA-1008','2026-06-11','Hợp đồng mua bán',5317000000.0,159500000.0,5157500000.0,0.025,128940000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0040','PRD-1164','SA-1017','2026-03-04','Hợp đồng mua bán',3817000000.0,190800000.0,3626200000.0,0.03,108790000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0041','PRD-1218','SA-1017','2026-03-14','Hợp đồng mua bán',11050000000.0,552500000.0,10497500000.0,0.035,367410000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0042','PRD-1190','SA-1035','2026-06-04','Hợp đồng mua bán',20439000000.0,1226300000.0,19212700000.0,0.035,672440000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0043','PRD-1049','SA-1040','2026-05-03','Hợp đồng mua bán',2498000000.0,74900000.0,2423100000.0,0.045,109040000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0044','PRD-1036','SA-1039','2026-07-28','Hợp đồng mua bán',2458000000.0,172100000.0,2285900000.0,0.04,91440000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0045','PRD-1104','SA-1021','2026-02-22','Hợp đồng mua bán',3888000000.0,233300000.0,3654700000.0,0.045,164460000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0046','PRD-1001','SA-1038','2026-05-22','Hợp đồng mua bán',4030000000.0,282100000.0,3747900000.0,0.035,131180000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0047','PRD-1119','SA-1003','2026-03-19','Hợp đồng mua bán',2363000000.0,141800000.0,2221200000.0,0.045,99950000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0048','PRD-1048','SA-1019','2026-03-17','Hợp đồng mua bán',2520000000.0,100800000.0,2419200000.0,0.025,60480000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0049','PRD-1011','SA-1037','2026-02-13','Hợp đồng mua bán',3537000000.0,176800000.0,3360200000.0,0.04,134410000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0050','PRD-1184','SA-1027','2026-05-19','Hợp đồng mua bán',4888000000.0,195500000.0,4692500000.0,0.03,140780000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0051','PRD-1061','SA-1034','2026-02-09','Hợp đồng mua bán',2434000000.0,146000000.0,2288000000.0,0.025,57200000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0052','PRD-1064','SA-1024','2026-04-01','Hợp đồng mua bán',3693000000.0,221600000.0,3471400000.0,0.045,156210000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0053','PRD-1148','SA-1029','2026-01-18','Hợp đồng mua bán',3744000000.0,149800000.0,3594200000.0,0.04,143770000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0054','PRD-1037','SA-1025','2026-05-27','Hợp đồng mua bán',4767000000.0,143000000.0,4624000000.0,0.025,115600000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0055','PRD-1088','SA-1037','2026-02-15','Hợp đồng mua bán',3679000000.0,147200000.0,3531800000.0,0.045,158930000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0056','PRD-1182','SA-1027','2026-03-30','Hợp đồng mua bán',16064000000.0,963800000.0,15100200000.0,0.045,679510000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0057','PRD-1074','SA-1034','2026-05-31','Hợp đồng mua bán',3619000000.0,217100000.0,3401900000.0,0.045,153090000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0058','PRD-1200','SA-1003','2026-04-25','Hợp đồng mua bán',3883000000.0,194200000.0,3688800000.0,0.035,129110000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0059','PRD-1124','SA-1032','2026-07-09','Hợp đồng mua bán',3636000000.0,181800000.0,3454200000.0,0.03,103630000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0060','PRD-1002','SA-1005','2026-05-11','Hợp đồng mua bán',2295000000.0,114800000.0,2180200000.0,0.04,87210000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0061','PRD-1174','SA-1036','2026-02-21','Hợp đồng mua bán',4223000000.0,168900000.0,4054100000.0,0.045,182430000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0062','PRD-1091','SA-1038','2026-05-18','Hợp đồng mua bán',5138000000.0,359700000.0,4778300000.0,0.03,143350000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0063','PRD-1192','SA-1007','2026-07-04','Hợp đồng mua bán',18595000000.0,557800000.0,18037200000.0,0.04,721490000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0064','PRD-1080','SA-1032','2026-05-01','Hợp đồng mua bán',5304000000.0,212200000.0,5091800000.0,0.035,178210000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0065','PRD-1126','SA-1024','2026-07-01','Hợp đồng mua bán',4931000000.0,345200000.0,4585800000.0,0.045,206360000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0066','PRD-1063','SA-1018','2026-05-12','Hợp đồng mua bán',2463000000.0,73900000.0,2389100000.0,0.025,59730000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0067','PRD-1196','SA-1001','2026-01-27','Hợp đồng mua bán',5042000000.0,252100000.0,4789900000.0,0.045,215550000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0068','PRD-1115','SA-1010','2026-08-10','Hợp đồng mua bán',2478000000.0,74300000.0,2403700000.0,0.045,108170000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0069','PRD-1161','SA-1035','2026-04-15','Hợp đồng mua bán',9589000000.0,383600000.0,9205400000.0,0.045,414240000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0070','PRD-1191','SA-1033','2026-04-02','Hợp đồng mua bán',20761000000.0,1453300000.0,19307700000.0,0.03,579230000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0071','PRD-1012','SA-1031','2026-04-17','Hợp đồng mua bán',4945000000.0,346200000.0,4598800000.0,0.04,183950000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0072','PRD-1054','SA-1012','2026-07-04','Hợp đồng mua bán',5256000000.0,367900000.0,4888100000.0,0.03,146640000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0073','PRD-1168','SA-1040','2026-01-21','Hợp đồng mua bán',20430000000.0,1225800000.0,19204200000.0,0.025,480100000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0074','PRD-1141','SA-1008','2026-05-28','Hợp đồng mua bán',5103000000.0,357200000.0,4745800000.0,0.03,142370000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0075','PRD-1132','SA-1006','2026-07-18','Hợp đồng mua bán',2753000000.0,192700000.0,2560300000.0,0.025,64010000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0076','PRD-1162','SA-1027','2026-06-13','Hợp đồng mua bán',16619000000.0,831000000.0,15788000000.0,0.045,710460000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0077','PRD-1206','SA-1018','2026-05-19','Hợp đồng mua bán',9907000000.0,297200000.0,9609800000.0,0.045,432440000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0078','PRD-1197','SA-1004','2026-06-23','Hợp đồng mua bán',4052000000.0,162100000.0,3889900000.0,0.025,97250000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0079','PRD-1107','SA-1017','2026-01-23','Hợp đồng mua bán',2398000000.0,167900000.0,2230100000.0,0.035,78050000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0080','PRD-1203','SA-1017','2026-08-13','Hợp đồng mua bán',3832000000.0,115000000.0,3717000000.0,0.025,92920000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0081','PRD-1007','SA-1002','2026-05-16','Hợp đồng mua bán',2458000000.0,73700000.0,2384300000.0,0.03,71530000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0082','PRD-1081','SA-1015','2026-06-15','Hợp đồng mua bán',2403000000.0,120200000.0,2282800000.0,0.035,79900000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0083','PRD-1136','SA-1010','2026-05-03','Hợp đồng mua bán',3640000000.0,182000000.0,3458000000.0,0.04,138320000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0084','PRD-1193','SA-1010','2026-07-24','Hợp đồng mua bán',18245000000.0,1277200000.0,16967800000.0,0.04,678710000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0085','PRD-1201','SA-1024','2026-06-20','Hợp đồng mua bán',8683000000.0,521000000.0,8162000000.0,0.04,326480000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0086','PRD-1178','SA-1016','2026-03-31','Hợp đồng mua bán',11618000000.0,580900000.0,11037100000.0,0.04,441480000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0087','PRD-1202','SA-1020','2026-06-12','Hợp đồng mua bán',5145000000.0,308700000.0,4836300000.0,0.03,145090000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0088','PRD-1033','SA-1009','2026-05-19','Hợp đồng mua bán',3600000000.0,252000000.0,3348000000.0,0.045,150660000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0089','PRD-1127','SA-1008','2026-03-14','Hợp đồng mua bán',4658000000.0,326100000.0,4331900000.0,0.025,108300000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0090','PRD-1135','SA-1027','2026-01-23','Hợp đồng mua bán',2356000000.0,70700000.0,2285300000.0,0.035,79990000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0091','PRD-1039','SA-1014','2026-02-05','Hợp đồng mua bán',5403000000.0,162100000.0,5240900000.0,0.025,131020000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0092','PRD-1076','SA-1037','2026-06-03','Hợp đồng mua bán',5196000000.0,207800000.0,4988200000.0,0.03,149650000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0093','PRD-1068','SA-1035','2026-04-08','Hợp đồng mua bán',2631000000.0,157900000.0,2473100000.0,0.045,111290000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0094','PRD-1020','SA-1015','2026-04-19','Hợp đồng mua bán',3767000000.0,150700000.0,3616300000.0,0.045,162730000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0095','PRD-1123','SA-1016','2026-07-29','Hợp đồng mua bán',2602000000.0,130100000.0,2471900000.0,0.03,74160000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0096','PRD-1219','SA-1031','2026-03-09','Hợp đồng mua bán',11193000000.0,447700000.0,10745300000.0,0.045,483540000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0097','PRD-1019','SA-1035','2026-01-22','Hợp đồng mua bán',3635000000.0,109000000.0,3526000000.0,0.025,88150000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0098','PRD-1056','SA-1021','2026-06-13','Hợp đồng mua bán',5181000000.0,310900000.0,4870100000.0,0.035,170450000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0099','PRD-1207','SA-1004','2026-07-28','Hợp đồng mua bán',3890000000.0,233400000.0,3656600000.0,0.03,109700000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0100','PRD-1043','SA-1003','2026-04-28','Hợp đồng mua bán',3997000000.0,119900000.0,3877100000.0,0.045,174470000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0101','PRD-1010','SA-1029','2026-05-02','Hợp đồng mua bán',5373000000.0,161200000.0,5211800000.0,0.025,130300000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0102','PRD-1173','SA-1036','2026-08-04','Hợp đồng mua bán',3739000000.0,112200000.0,3626800000.0,0.03,108800000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0103','PRD-1112','SA-1004','2026-05-23','Hợp đồng mua bán',5362000000.0,160900000.0,5201100000.0,0.025,130030000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0104','PRD-1171','SA-1034','2026-04-17','Hợp đồng mua bán',10651000000.0,319500000.0,10331500000.0,0.035,361600000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0105','PRD-1057','SA-1016','2026-05-06','Hợp đồng mua bán',4853000000.0,145600000.0,4707400000.0,0.035,164760000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0106','PRD-1217','SA-1009','2026-03-21','Hợp đồng mua bán',17122000000.0,856100000.0,16265900000.0,0.025,406650000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0107','PRD-1060','SA-1035','2026-06-05','Hợp đồng mua bán',2631000000.0,131600000.0,2499400000.0,0.025,62480000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0108','PRD-1199','SA-1019','2026-03-12','Hợp đồng mua bán',17779000000.0,711200000.0,17067800000.0,0.045,768050000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0109','PRD-1100','SA-1004','2026-05-07','Hợp đồng mua bán',3540000000.0,106200000.0,3433800000.0,0.045,154520000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0110','PRD-1102','SA-1034','2026-06-11','Hợp đồng mua bán',2392000000.0,143500000.0,2248500000.0,0.04,89940000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0111','PRD-1114','SA-1036','2026-02-09','Hợp đồng mua bán',5011000000.0,350800000.0,4660200000.0,0.045,209710000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0112','PRD-1099','SA-1025','2026-05-18','Hợp đồng mua bán',3844000000.0,153800000.0,3690200000.0,0.04,147610000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0113','PRD-1177','SA-1003','2026-01-21','Hợp đồng mua bán',9833000000.0,590000000.0,9243000000.0,0.025,231080000.0,'Đã thanh toán');
INSERT INTO "sales_transactions" VALUES('TX-2026-0114','PRD-1137','SA-1012','2026-07-09','Hợp đồng mua bán',2282000000.0,68500000.0,2213500000.0,0.035,77470000.0,'Chờ duyệt đợt 2');
INSERT INTO "sales_transactions" VALUES('TX-2026-0115','PRD-1066','SA-1004','2026-05-13','Hợp đồng mua bán',5035000000.0,352500000.0,4682500000.0,0.025,117060000.0,'Chờ duyệt đợt 2');
CREATE VIEW v_sales_performance AS
    SELECT 
        sa.agent_id,
        sa.full_name,
        sa.agency_name,
        sa.position,
        COUNT(st.transaction_id) AS total_units_sold,
        COALESCE(SUM(st.net_revenue), 0) AS total_net_revenue,
        COALESCE(SUM(st.commission_amount), 0) AS total_commission_earned
    FROM sales_agents sa
    LEFT JOIN sales_transactions st ON sa.agent_id = st.agent_id
    GROUP BY sa.agent_id, sa.full_name, sa.agency_name, sa.position;
CREATE VIEW v_project_summary AS
    SELECT 
        p.project_name,
        COUNT(p.product_id) AS total_products,
        SUM(CASE WHEN p.status = 'Đang bán' THEN 1 ELSE 0 END) AS units_for_sale,
        SUM(CASE WHEN p.status = 'Sắp mở bán' THEN 1 ELSE 0 END) AS units_upcoming,
        SUM(CASE WHEN p.status IN ('Đã bán', 'Đã đặt cọc') THEN 1 ELSE 0 END) AS units_sold_or_reserved,
        COALESCE(SUM(st.net_revenue), 0) AS total_revenue_realized
    FROM products p
    LEFT JOIN sales_transactions st ON p.product_id = st.product_id
    GROUP BY p.project_name;
CREATE VIEW v_plan_vs_actual AS
    SELECT 
        sp.period_month,
        sp.project_name,
        sp.target_units,
        sp.target_revenue,
        COUNT(st.transaction_id) AS actual_units_sold,
        COALESCE(SUM(st.net_revenue), 0) AS actual_net_revenue,
        ROUND((COALESCE(SUM(st.net_revenue), 0) / sp.target_revenue) * 100, 2) AS revenue_achievement_pct
    FROM sales_plan sp
    LEFT JOIN products p ON sp.project_name = p.project_name
    LEFT JOIN sales_transactions st ON p.product_id = st.product_id 
        AND strftime('%Y-%m', st.transaction_date) = sp.period_month
    GROUP BY sp.period_month, sp.project_name;
COMMIT;
