INSERT INTO persons(id, name, display, idm, enabled, staff,create_at,update_at) VALUES ("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","テスト　次郎","テスト　次郎A",NULL,1,0,"2018-08-31 18:05:32.990875","2018-09-01 14:39:17.037220");
INSERT INTO recipients(person_id, number, amount, usestart, create_at) VALUES ("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","0000000000","テスト支給量",NULL,"2018-08-31 18:05:32.990875");
INSERT INTO persons(id, name, display, idm, enabled, staff,create_at,update_at) VALUES ("10351200-d3bd-49ae-a286-aa4c312f9d30","テスト　太郎","テスト　太郎（職員）",NULL,1,1,"2018-09-01 07:27:24.684993","2018-09-01 14:38:55.832833");
INSERT INTO persons(id, name, display, idm, enabled, staff,create_at,update_at) VALUES ("5f721f75-7d68-44c2-800a-e18d810fb140","テスト　次郎","テスト　次郎","0000000000",1,0,"2018-09-08 16:11:33.040562",NULL);
INSERT INTO recipients(person_id, number, amount, usestart, create_at) VALUES ("5f721f75-7d68-44c2-800a-e18d810fb140","0000000000","当該月の日数から8日を控除した日数／月","2018-08-16","2018-09-08 16:11:33.040562");
INSERT INTO users(id, userid, password, create_at, update_at) VALUES("4df7f1a7-b9ab-4b33-b723-32696b67a142","test","pbkdf2:sha256:50000$NGEAI2do$d974618fed59928a8564f7c3bcb945d52c567b4839dc5366a05847aa8d42e405","2018-09-08 16:52:09.815562",NULL);
INSERT INTO options(id, name, value, create_at, update_at) VALUES("a6df4eca-b8e8-4ca2-8e13-2e546abceef2","office_number","0000000000","2018-09-08 16:25:03.128804",NULL);
INSERT INTO options(id, name, value, create_at, update_at) VALUES("65d52d43-fe55-4771-a930-081d5c0dfab5","office_name","オフィスファーム","2018-09-08 16:25:03.130418",NULL);
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",3,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:16:49.438277","2018-08-31 22:59:53.505629");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",3,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:16:49.438277","2018-08-31 22:59:53.505629");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",5,1,0,0,"10:00","15:00","無断欠席","2018-08-31 18:17:18.853024","2018-08-31 22:57:59.544117");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",5,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:17:18.853024","2018-08-31 22:57:59.544117");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",6,0,1,0,NULL,NULL,"病欠（欠席加算有り）","2018-08-31 18:17:35.455846",NULL);
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",6,NULL,NULL,NULL,NULL,NULL,1,"2018-08-31 18:17:35.455846",NULL);
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",7,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:25:56.166862","2018-08-31 23:17:48.031816");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",7,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:25:56.166862","2018-08-31 23:17:48.031816");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",8,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:26:17.350879","2018-08-31 22:57:59.558024");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",8,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:26:17.350879","2018-08-31 22:57:59.558024");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",9,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:26:37.845405","2018-08-31 22:57:59.564678");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",9,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:26:37.845405","2018-08-31 22:57:59.564678");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",10,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:26:49.149046","2018-08-31 22:57:59.571419");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",10,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:26:49.149046","2018-08-31 22:57:59.571419");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",11,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:27:18.619631","2018-08-31 22:57:59.577639");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",11,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:27:18.619631","2018-08-31 22:57:59.577639");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",13,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:27:30.019396","2018-08-31 22:57:59.584757");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",13,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:27:30.019396","2018-08-31 22:57:59.584757");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",14,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:27:45.013374","2018-08-31 22:57:59.590670");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",14,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:27:45.013374","2018-08-31 22:57:59.590670");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",15,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:28:10.316209","2018-08-31 22:57:59.597147");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",15,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:28:10.316209","2018-08-31 22:57:59.597147");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",16,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:28:23.738020","2018-08-31 22:57:59.607592");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",16,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:28:23.738020","2018-08-31 22:57:59.607592");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",17,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:28:36.660614","2018-08-31 22:57:59.613934");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",17,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:28:36.660614","2018-08-31 22:57:59.613934");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",19,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:28:49.117748","2018-08-31 22:57:59.619522");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",19,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:28:49.117748","2018-08-31 22:57:59.619522");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",20,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:28:58.524796","2018-08-31 22:57:59.627314");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",20,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:28:58.524796","2018-08-31 22:57:59.627314");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",21,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:29:11.879359","2018-08-31 22:57:59.633619");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",21,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:29:11.879359","2018-08-31 22:57:59.633619");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",22,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:29:22.548190","2018-08-31 22:57:59.640564");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",22,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:29:22.548190","2018-08-31 22:57:59.640564");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",23,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:29:34.063115","2018-08-31 22:57:59.648061");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",23,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:29:34.063115","2018-08-31 22:57:59.648061");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",25,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:29:45.694126","2018-08-31 22:57:59.663318");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",25,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:29:45.694126","2018-08-31 22:57:59.663318");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",26,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:29:58.525881","2018-08-31 22:57:59.680122");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",26,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:29:58.525881","2018-08-31 22:57:59.680122");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",24,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:30:21.812296","2018-08-31 22:57:59.655552");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",24,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:30:21.812296","2018-08-31 22:57:59.655552");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",28,0,1,0,NULL,NULL,"病欠（欠席加算有り）","2018-08-31 18:30:32.037411",NULL);
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",28,NULL,NULL,NULL,NULL,NULL,1,"2018-08-31 18:30:32.037411",NULL);
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",29,0,0,0,"10:00","15:00",NULL,"2018-08-31 18:30:41.692220","2018-08-31 23:25:16.625366");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",29,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:30:41.692220","2018-08-31 23:25:16.625366");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",30,0,0,0,"10:00","15:00",NULL,"2018-08-31 18:30:53.227114","2018-08-31 23:01:34.673648");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",30,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:30:53.227114","2018-08-31 23:01:34.673648");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",4,1,0,0,"10:00","15:00",NULL,"2018-08-31 18:31:03.171672","2018-08-31 22:57:59.537176");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",4,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 18:31:03.171672","2018-08-31 22:57:59.537176");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",2,1,0,0,"10:00","15:00",NULL,"2018-08-31 23:15:49.496647","2018-08-31 23:15:49.524399");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",2,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 23:15:49.496647","2018-08-31 23:15:49.524399");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",27,1,0,0,"10:00","15:00",NULL,"2018-08-31 23:25:16.535835","2018-08-31 23:25:16.617196");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",27,"10:00","15:00",4.0,NULL,NULL,0,"2018-08-31 23:25:16.535835","2018-08-31 23:25:16.617196");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",31,0,0,0,"23:30","23:39",NULL,"2018-08-31 23:30:32.474180","2018-08-31 23:39:10.896708");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",31,"23:30","23:39",NULL,NULL,NULL,0,"2018-08-31 23:30:32.474180","2018-08-31 23:39:10.896708");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",1,0,1,0,NULL,NULL,"病欠（欠席加算有り）","2018-08-31 23:56:03.099969",NULL);
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201808",1,NULL,NULL,NULL,NULL,NULL,1,"2018-08-31 23:56:03.099969",NULL);
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("10351200-d3bd-49ae-a286-aa4c312f9d30","201809",1,"10:00","15:00",4.0,NULL,NULL,0,"2018-09-01 07:27:38.547781","2018-09-01 07:28:09.391371");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("10351200-d3bd-49ae-a286-aa4c312f9d30","201809",2,"10:00","15:00",4.0,NULL,NULL,0,"2018-09-01 14:40:34.412935",NULL);
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",3,1,0,0,"10:00","15:00",NULL,"2018-09-01 15:02:07.343548","2018-09-01 15:02:07.421700");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",3,"10:00","15:00",4.0,NULL,NULL,0,"2018-09-01 15:02:07.343548","2018-09-01 15:02:07.421700");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",1,1,0,0,"10:00","15:00",NULL,"2018-09-01 15:21:09.778579","2018-09-01 15:21:09.791184");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",1,"10:00","15:00",4.0,NULL,NULL,0,"2018-09-01 15:21:09.778579","2018-09-01 15:21:09.791184");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",2,1,0,0,"10:00","15:00",NULL,"2018-09-01 15:21:38.121443","2018-09-01 15:21:38.135525");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",2,"10:00","15:00",4.0,NULL,NULL,0,"2018-09-01 15:21:38.121443","2018-09-01 15:21:38.135525");
INSERT INTO performlogs(person_id, yymm, dd, enabled, absence, absence_add, work_in, work_out, remarks, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",4,1,0,0,"10:00","15:00",NULL,"2018-09-01 22:40:51.565400","2018-09-01 22:40:51.641840");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("f0efbdf0-1112-4e09-b9a4-da740a4d0c1f","201809",4,"10:00","15:00",4.0,NULL,NULL,0,"2018-09-01 22:40:51.565400","2018-09-01 22:40:51.641840");
INSERT INTO worklogs(person_id, yymm, dd, work_in, work_out, value, break_t, over_t, absence, create_at, update_at) VALUES("10351200-d3bd-49ae-a286-aa4c312f9d30","201809",3,"10:00","15:00",4.0,NULL,NULL,0,"2018-09-02 20:39:28.268512",NULL);
