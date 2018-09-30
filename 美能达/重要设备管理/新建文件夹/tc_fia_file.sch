/*
================================================================================
檔案代號:tc_fia_file
檔案名稱:重要设备基础资料档
檔案目的:
上游檔案:
下游檔案:
檔案類型:B
多語系檔案:N
============.========================.==========================================
create table tc_fia_file
(
tc_fia01       varchar2(20), NOT NULL,   /*设备编号                 */
tc_fia02       varchar2(40),             /*设备名称                 */
tc_fia03       varchar2(40),             /*规格型号                 */
tc_fia04       varchar2(20),             /*设备序列号               */
tc_fia05       varchar2(2) ,             /*设备类型                 */

tc_fia06       varchar2(50),             /*维护商                   */
tc_fia07       varchar2(50),             /*维护担当                 */
tc_fia08       varchar2(40),             /*联系方式                 */
tc_fia09       varchar2(40),             /*维保方式                 */
tc_fia10       number(15,0),             /*维保周期                 */
tc_fia11       varchar2(10),             /*维保周期单位             */
tc_fia12       date,                     /*本期维保日               */
tc_fia13       date,                     /*下期维保日               */

tc_fia14       varchar2(40),             /*管理部门                 */
tc_fia15       varchar2(40),             /*部门担当                 */
tc_fia16       varchar2(40),             /*存放位置                 */

tc_fia17       varchar2(40),             /*取得方式                 */
tc_fia18       varchar2(40),             /*供应厂商                 */
tc_fia19       varchar2(20),             /*制造厂商                 */
tc_fia20       varchar2(40),             /*购入价格                 */
tc_fia21       date,                     /*购入日期                 */
tc_fia22       number(5,3),              /*使用年限                 */
tc_fia23       number(15,3),             /*数量                     */

tc_fia24       varchar2(20),             /*设备状态                 */
tc_fia25       varchar2(2),              /*资料有效否               */
tc_fia26       varchar2(2),              /*审核码                   */

tc_fia27       varchar2(255),            /*自訂欄位-Textedit                      */
tc_fia28       varchar2(40),             /*自訂欄位-文字                          */
tc_fia29       varchar2(40),             /*自訂欄位-文字                          */
tc_fia30       varchar2(40),             /*自訂欄位-文字                          */
tc_fia31       varchar2(40),             /*自訂欄位-文字                          */
tc_fia33       varchar2(40),             /*自訂欄位-文字                          */
tc_fia34       number(15,3),             /*自訂欄位-數值                          */
tc_fia35       number(15,3),             /*自訂欄位-數值                          */
tc_fia36       number(15,3),             /*自訂欄位-數值                          */
tc_fia37       number(10),               /*自訂欄位-整數                          */
tc_fia38       number(10),               /*自訂欄位-整數                          */
tc_fia39       number(10),               /*自訂欄位-整數                          */
tc_fia40       date,                     /*自訂欄位-日期                          */
tc_fia41       date,                     /*自訂欄位-日期                          */
tc_fia42       date                      /*自訂欄位-日期                          */
);               */


alter table tc_fia_file add  constraint tpc_fia_pk primary key  (tc_fia01) enable validate;
 

fiaacti     varchar2(1),             /*資料有效碼                             */
fiauser     varchar2(10),            /*資料所有者                             */
fiagrup     varchar2(10),            /*資料所有部門                           */
fiamodu     varchar2(10),            /*最后修改人員                           */
fiadate     date,                    /*最后修改日期                           */
fiaoriu     varchar2(10),            /*資料建立者                             */
fiaorig     varchar2(10)             /*資料建立部門                           */

ALTER TABLE tc_fia_file ADD tc_fiaacti varchar2(1) ;
ALTER TABLE tc_fia_file ADD tc_fiauser varchar2(10);
ALTER TABLE tc_fia_file ADD tc_fiagrup varchar2(10);
ALTER TABLE tc_fia_file ADD tc_fiamodu varchar2(10);
ALTER TABLE tc_fia_file ADD tc_fiadate date        ;
ALTER TABLE tc_fia_file ADD tc_fiaoriu varchar2(10);
ALTER TABLE tc_fia_file ADD tc_fiaorig varchar2(10);

ALTER TABLE tc_fib_file ADD tc_fibacti varchar2(1) ;
ALTER TABLE tc_fib_file ADD tc_fibuser varchar2(10);
ALTER TABLE tc_fib_file ADD tc_fibgrup varchar2(10);
ALTER TABLE tc_fib_file ADD tc_fibmodu varchar2(10);
ALTER TABLE tc_fib_file ADD tc_fibdate date        ;
ALTER TABLE tc_fib_file ADD tc_fiboriu varchar2(10);
ALTER TABLE tc_fib_file ADD tc_fiborig varchar2(10);