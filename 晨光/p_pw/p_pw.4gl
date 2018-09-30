# Prog. Version..: '5.10.01-08.05.05(00009)'     #
# Pattern name...: p_pw.4gl
# Descriptions...: 更改密码

DATABASE ds

GLOBALS "../../../tiptop/config/top.global"

DEFINE p_row,p_col     LIKE type_file.num5,
     #modify by ganlinbing 20130328
       #g_oldpwd        LIKE zx_file.zx10,
       #g_newpwd        LIKE zx_file.zx10,
       #g_repwd         LIKE zx_file.zx10
       g_oldpwd        LIKE type_file.chr50,
       g_newpwd        LIKE type_file.chr50,
       g_repwd         LIKE type_file.chr50
     #end modify
MAIN

    OPTIONS
        FORM LINE     FIRST + 2,               #畫面開始的位置
        MESSAGE LINE  LAST,                    #訊息顯示的位置
        PROMPT LINE   LAST,                    #提示訊息的位置
        INPUT NO WRAP                          #輸入的方式: 不打轉
    DEFER INTERRUPT                            #擷取中斷鍵

   IF (NOT cl_user()) THEN
      EXIT PROGRAM
   END IF

   WHENEVER ERROR CALL cl_err_msg_log

   IF (NOT cl_setup("CZZ")) THEN
      EXIT PROGRAM
   END IF

   LET p_row = ARG_VAL(1)
   LET p_col = ARG_VAL(2)
     CALL  cl_used(g_prog,g_time,1) RETURNING g_time #No:MOD-580088  HCN 20050818  #No.FUN-6A0081

   OPEN WINDOW p_pw_w AT p_row,p_col WITH FORM "czz/42f/p_pw"
       ATTRIBUTE (STYLE = g_win_style CLIPPED) #No:FUN-580092 HCN

   CALL cl_ui_init()


   LET g_action_choice = ""
   # 进程序先录入新旧密码，再进入菜单 lixwz
   CALL p_pw_i()
   CALL p_pw_menu()

   CLOSE WINDOW p_pw_w
     CALL  cl_used(g_prog,g_time,2) RETURNING g_time #No:MOD-580088  HCN 20050818  #No.FUN-6A0081
END MAIN


FUNCTION p_pw_menu()
    MENU ""
        BEFORE MENU

        ON ACTION pwd
            # 点击确认修改之后，进行密码修改 lixwz
            CALL p_pw_modify()
        ON ACTION exit
            LET g_action_choice = "exit"
            EXIT MENU
        ON ACTION controlg
            CALL cl_cmdask()
        ON IDLE g_idle_seconds
           CALL cl_on_idle()
           CONTINUE MENU
        COMMAND KEY(INTERRUPT)
            LET INT_FLAG=FALSE
            LET g_action_choice = "exit"
            EXIT MENU
    END MENU
END FUNCTION

FUNCTION p_pw_i()
    # 输入旧密码，新密码和确认密码 lixwz
    INPUT g_oldpwd,g_newpwd,g_repwd FROM old,new,renew
   #INPUT g_newpwd FORM new
   #INPUT g_repwd FORM renew

      BEFORE INPUT
         CALL cl_set_comp_entry("old,new,renew",TRUE)

      AFTER FIELD renew
         # 判断新密码和旧密码是否相等，不相等报错，重新输入  lixwz
         IF g_repwd <> g_newpwd THEN
            CALL cl_err('','czz-101',1)
            NEXT FIELD new
         END IF
      ON ACTION CANCEL
         LET g_action_choice = "exit"
         CALL cl_set_act_visible("pwd", FALSE)
         EXIT INPUT
   END INPUT

   IF INT_FLAG THEN
    LET INT_FLAG = 0
    CLOSE WINDOW p_pw_w
    CALL cl_used(g_prog,g_time,2) RETURNING g_time
     EXIT PROGRAM
  END IF
END FUNCTION

FUNCTION p_pw_modify()
DEFINE
       l_script    STRING,
       l_execute   STRING,
       l_return    STRING

DEFINE
  ch                            base.Channel,
  l_status                      SMALLINT,
  l_index                       SMALLINT,
  l_temp                        STRING,
  l_text                        STRING

    # 删除原来的脚本文件和修改密码的log日志  lixwz
    RUN "rm -rf /u1/dcms/pwd"
    RUN "rm -rf /u1/dcms/pwd.log"

    # 重写脚本  lixwz
    LET l_script = '#!usr/bin/expect ','\n',
                   '  set old [lindex $argv 0]','\n',
                   '  set new [lindex $argv 1]','\n',
                   '  spawn   passwd ','\n',
                   '  expect "password:" ','\n',
                   '  send "$old\\r"   ','\n',
                   '  sleep 1','\n',
                   '  expect "password:"','\n',
                   '  send "$new\\r"       ','\n',
                   '  sleep 1        ','\n',
                   '  expect "password:"','\n',
                   '  send "$new\\r"  ','\n',
                   '  expect eof','\n',
                   '  exit'

    RUN "echo '"||l_script||"' > /u1/dcms/pwd"

    RUN "chmod 775 /u1/dcms/pwd"

    LET l_execute = "expect /u1/dcms/pwd ",g_oldpwd," ",g_newpwd," > /u1/dcms/pwd.log"
    RUN l_execute
    SLEEP 2

     # 将新的log日志读取到l_text  lixwz
     LET ch = base.Channel.create()
     CALL ch.openFile('/u1/dcms/pwd.log','r')
     LET l_status = ch.read(l_temp)
     WHILE l_status
       LET l_text = l_text.trim(),l_temp.trim()
       LET l_status = ch.read(l_temp)
     END WHILE

     LET l_index = 0
     LET l_index = l_text.getIndexOf('successfully',1)
     #根据log日志的内容，判断密码修改的状态  lixwz
     IF l_index > 0 THEN
        CALL cl_err('密码修改成功','!',1)
        EXIT PROGRAM
     ELSE
        # 密码修改失败，请重新修改。 lixwz
        LET l_index = l_text.getIndexOf('Authentication token manipulation error',1)
        IF l_index > 0 THEN
           CALL cl_err('','czz-102',1)
        ELSE
           # 密码太短 lixwz
           LET l_index = l_text.getIndexOf('too short',1)
           IF l_index > 0 THEN
              CALL cl_err('','czz-103',1)
           ELSE
              # 密码重复  lixwz
              LET l_index = l_text.getIndexOf('Password unchanged',1)
              IF l_index > 0 THEN
                 CALL cl_err('','czz-108',1)
              ELSE
                 # 密码与旧密码太相似  lixwz
                 LET l_index = l_text.getIndexOf('too similar to the old',1)
                 IF l_index > 0 THEN
                    CALL cl_err('','czz-107',1)
                 ELSE
                    # 缺少数字或是字母 lixwz
                    LET l_index = l_text.getIndexOf('not contain enough DIFFERENT characters',1)
                    IF l_index > 0 THEN
                       CALL cl_err('','czz-104',1)
                    ELSE
                       # 太简单 lixwz
                       LET l_index = l_text.getIndexOf('too simplistic',1)
                       IF l_index > 0 THEN
                          CALL cl_err('','czz-105',1)
                       ELSE
                          # 某些字符不存在 lixwz
                          LET l_index = l_text.getIndexOf('based on a dictionary word',1)
                          IF l_index > 0 THEN
                             CALL cl_err('','czz-106',1)
                          ELSE
                             CALL cl_err(l_text,'!',1)
                          END IF
                       END IF
                    END IF
                 END IF
              END IF
           END IF
        END IF
       #CALL cl_err(l_text,'!',1)
        CALL p_pw_i()
        IF g_action_choice = "exit" THEN
           CALL cl_set_act_visible("pwd", FALSE)
        END IF
        CALL p_pw_menu()
        IF INT_FLAG OR g_action_choice = "exit" THEN
           EXIT PROGRAM
        END IF
     END IF

END FUNCTION

