/*
================================================================================
檔案代號:fia_file
檔案名稱:設備基本資料檔
檔案目的:
上游檔案:
下游檔案:
檔案類型:B
多語系檔案:N
============.========================.==========================================
*/
create table fia_file
(
fia01       varchar2(20) NOT NULL,   /*設備編號                               */
fia011      varchar2(10),            /*財產編號                               */
fia012      varchar2(4),             /*附號                                   */
fia02       varchar2(80),            /*名稱                                   */
fia03       varchar2(10),            /*類別                                   */
fia04       varchar2(30),            /*系列號                                 */
fia05       varchar2(30),            /*型號                                   */
fia06       varchar2(30),            /*銘牌                                   */
fia07       varchar2(10),            /*制造商                                 */
fia08       varchar2(10),            /*原產地                                 */
fia09       varchar2(10),            /*供應商                                 */
fia10       varchar2(10),            /*負責人                                 */
fia11       varchar2(10),            /*負責部門                               */
fia12       varchar2(10),            /*維修合約                               */
fia13       number(5),               /*優先級                                 */
fia14       varchar2(20),            /*位置                                   */
fia15       varchar2(20),            /*子位置1                                */
fia16       varchar2(20),            /*子位置2                                */
fia17       varchar2(20),            /*子位置3                                */
fia18       date,                    /*購買日期                               */
fia19       date,                    /*啟動日期                               */
fia20       date,                    /*擔保終止日期                           */
fia21       varchar2(1),             /*開立新工單時通知否                     */
fia22       varchar2(255),           /*備注                                   */
fia23       number(20,6),            /*材料成本                               */
fia24       number(20,6),            /*勞工成本                               */
fia25       varchar2(300),           /*安全說明                               */
fia40       varchar2(1),             /*No                                     */
fia41       varchar2(1),             /*No                                     */
fia42       varchar2(1),             /*No                                     */
fia43       varchar2(1),             /*No                                     */
fiaacti     varchar2(1),             /*資料有效碼                             */
fiauser     varchar2(10),            /*資料所有者                             */
fiagrup     varchar2(10),            /*資料所有部門                           */
fiamodu     varchar2(10),            /*最后修改人員                           */
fiadate     date,                    /*最后修改日期                           */
fiaud01     varchar2(255),           /*自訂欄位-Textedit                      */
fiaud02     varchar2(40),            /*自訂欄位-文字                          */
fiaud03     varchar2(40),            /*自訂欄位-文字                          */
fiaud04     varchar2(40),            /*自訂欄位-文字                          */
fiaud05     varchar2(40),            /*自訂欄位-文字                          */
fiaud06     varchar2(40),            /*自訂欄位-文字                          */
fiaud07     number(15,3),            /*自訂欄位-數值                          */
fiaud08     number(15,3),            /*自訂欄位-數值                          */
fiaud09     number(15,3),            /*自訂欄位-數值                          */
fiaud10     number(10),              /*自訂欄位-整數                          */
fiaud11     number(10),              /*自訂欄位-整數                          */
fiaud12     number(10),              /*自訂欄位-整數                          */
fiaud13     date,                    /*自訂欄位-日期                          */
fiaud14     date,                    /*自訂欄位-日期                          */
fiaud15     date,                    /*自訂欄位-日期                          */
fiaoriu     varchar2(10),            /*資料建立者                             */
fiaorig     varchar2(10)             /*資料建立部門                           */
);

alter table fia_file add  constraint fia_pk primary key  (fia01) enable validate;
 
