/*
================================================================================
檔案代號:oeh_file
檔案名稱:訂單實際交易稅別明細檔
檔案目的:
上游檔案:
下游檔案:N
檔案類型:T
多語系檔案:N
============.========================.==========================================
*/
create table oeh_file
(
oeh01       varchar2(20) DEFAULT ' ' NOT NULL, /*訂單單號*/
oeh02       number(5) DEFAULT '0' NOT NULL, /*序號*/
oeh03       varchar2(4) DEFAULT ' ' NOT NULL, /*稅別*/
oeh04       number(9,4) DEFAULT '0', /*稅率                                   */
oeh05       number(20,6) DEFAULT '0' NOT NULL, /*固定稅額*/
oeh06       varchar2(1) DEFAULT ' ' NOT NULL, /*含稅否*/
oeh07       number(20,6) DEFAULT '0' NOT NULL, /*未稅金額*/
oeh07t      number(20,6) DEFAULT '0' NOT NULL, /*含稅金額*/
oeh08       number(20,6) DEFAULT '0' NOT NULL, /*稅額*/
oeh09       number(20,6) DEFAULT '0' NOT NULL, /*留抵稅額*/
oehdate     date,                    /*最近修改日                             */
oehgrup     varchar2(10),            /*資料所有部門                           */
oehlegal    varchar2(10) DEFAULT ' ' NOT NULL, /*所屬法人*/
oehmodu     varchar2(10),            /*資料更改者                             */
oehorig     varchar2(10),            /*資料建立部門                           */
oehoriu     varchar2(10),            /*資料建立者                             */
oehplant    varchar2(10) DEFAULT ' ' NOT NULL, /*所屬營運中心*/
oehuser     varchar2(10)             /*資料所有者                             */
);

alter table oeh_file add  constraint oeh_pk primary key  (oeh01,oeh02) enable validate;
grant select on oeh_file to tiptopgp;
grant update on oeh_file to tiptopgp;
grant delete on oeh_file to tiptopgp;
grant insert on oeh_file to tiptopgp;
grant index on oeh_file to public;
grant select on oeh_file to ods;
