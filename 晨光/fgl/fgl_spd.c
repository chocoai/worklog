#include <stdio.h>
#include <f2c/fglExt.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
//#include <stdlib.h>
#include <errno.h>
#include <time.h>
#include <sys/types.h>
#include <fcntl.h>
#include <signal.h>
#include <unistd.h>
#include <netinet/in.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/wait.h>
#include <netdb.h>
#include <iconv.h>

#define MAX_BUFFER_DATA 0x23000
#define MAX_HOST_DATA 0x100

static int GlobalRemotePort;
static char GlobalRemoteHost[MAX_HOST_DATA];

int fgl_spd( int in_num );

static int SocketWrite(int nSocket,char * pBuffer,int nLen,int nTimeout);
static int  SocketRead(int nSocket,void * pBuffer,int nLen,int nTimeout);
static void SysSleep(long nTime);
static void SetSocketNotBlock(int nSocket);
static int ListenSocket(int nSocket,int nMaxQueue);
static int CheckSocketResult(int nResult);
static int BindPort(int nSocket,int nPort);
static int CheckSocketValid(int nSocket);
static int CloseSocket(int nSocket);
static int ConnectSocket(int nSocket,const char * szHost,int nPort);
static int CreateSocket();
static int code_convert(char *from_charset,char *to_charset,char *inbuf,size_t inlen,char *outbuf,size_t outlen);
static int u2g(char *inbuf,int inlen,char *outbuf,int outlen);
static int g2u(char *inbuf,size_t inlen,char *outbuf,size_t outlen); 
static int compare( char *src, char *dst, int n);
static char GetBase64Value(char ch);
static int Base64Decode( char *OrgString, char *Base64String, int Base64StringLen, int bForceDecode );

int fgl_spd( int in_num )
{
  signal (SIGPIPE,SIG_IGN);
  signal (SIGALRM,SIG_IGN);

  unsigned char server_ip[MAX_HOST_DATA+1]={'\0'};  

  int server_port = -1;
  int sign_port = -1;

  int send_len=-1;
  unsigned char send_buf[MAX_BUFFER_DATA+1]={'\0'};

  int send_gb_len=-1;
  unsigned char send_gb_buf[MAX_BUFFER_DATA+1]={'\0'}; 

  unsigned char signflag_buf[MAX_HOST_DATA+1]={'\0'};
  int signflag = -1; 

  unsigned char flag_buf[MAX_HOST_DATA+1]={'\0'};
  int flag = -1; 

  int recv_len=-1;
  unsigned char recv_buf[MAX_BUFFER_DATA+1]={'\0'}; 

  int recv_u8_len=-1;
  unsigned char recv_u8_buf[MAX_BUFFER_DATA+1]={'\0'};


  unsigned char message_length[MAX_HOST_DATA+1]={'\0'};
  int message_len=-1;

  int body_len=-1;

  unsigned char* request=NULL;
  unsigned char* respones=NULL;

  char *str_ptr_start=NULL;
  char *str_ptr_begin=NULL;
  char *str_ptr_end=NULL;


  unsigned char post[300]={'\0'};
  unsigned char host[100]={'\0'};
  unsigned char content_len[100]={'\0'};
  unsigned char content_type[100]={'\0'}; 

  int nLen=-1;

  popvchar(send_buf,MAX_BUFFER_DATA);
  popint(&sign_port); 
  popint(&server_port);
  popvchar(server_ip,MAX_HOST_DATA);


  printf("POP IP                       	=: %s\n",server_ip);
  printf("POP SERVER PORT    		=: %d\n",server_port);
  printf("POP SIGN PORT    	  	=: %d\n",sign_port);
  send_len=strlen(send_buf);
  printf("POP MESSAGE LENGTH 		=: %d\n",send_len);
  printf("POP MESSAGE       		=: \n%s\n",send_buf);


  str_ptr_begin=strstr(send_buf,"<signFlag>");

  str_ptr_end=strstr(str_ptr_begin,"</signFlag>");

  memset (signflag_buf,0x00,sizeof(signflag_buf));    

  
  memcpy(signflag_buf,str_ptr_begin+10,str_ptr_end-str_ptr_begin-10);

  signflag = atoi(signflag_buf);

  printf("SIGN FLAG      		=: %d\n",signflag);

  //printf("\n\nCONVERT UTF-8 TO GBK!\n\n");

  u2g(send_buf,strlen(send_buf),send_gb_buf,MAX_BUFFER_DATA+1);

  send_gb_len=strlen(send_gb_buf);

  //printf("CONVERT TO GB MESSAGE LENGTH 		=: %d\n",send_gb_len);
  //printf("GB MESSAGE       		=: \n%s\n",send_gb_buf);

  if(1==signflag)
  {
    //printf("\n\nSIGN REQUEST!\n\n");

    int nSocket=CreateSocket();
    if(!CheckSocketValid(nSocket))
    {  
      printf("\n\nCREATE SOCKET ERROR!\n\n");

      //printf("PUSH MESSAGE LENGTH	=: %d\n",recv_u8_len);
      //printf("PUSH MESSAGE		=: \n%s\n",recv_u8_buf);

      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);

      return 2;
    }

    char * szRemoteHost=server_ip;
    GlobalRemotePort = -1;
    GlobalRemotePort=sign_port;

    memset (GlobalRemoteHost,0x00,sizeof(GlobalRemoteHost));    
    strcpy(GlobalRemoteHost,szRemoteHost);
 
    if(ConnectSocket(nSocket,GlobalRemoteHost,GlobalRemotePort)<=0)
    {
      printf("\n\nCONNECT NETSAFE CLIENT SIGN ERROR!\n\n");

      CloseSocket(nSocket);
      //printf("PUSH MESSAGE LENGTH 	=: %d\n",recv_u8_len);
      //printf("PUSH MESSAGE	  	=: \n%s\n",recv_u8_buf);

      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
    }


    str_ptr_start=send_gb_buf;

    str_ptr_begin=strstr(send_gb_buf,"<body>"); 

    str_ptr_end=strstr(str_ptr_begin,"</body>"); 

    send_gb_len=strlen(str_ptr_begin); 


    memset(send_buf,'\0',sizeof(send_buf));
    send_len=-1;

    request = send_buf; 

    //memcpy(request+6,str_ptr_begin,str_ptr_end-str_ptr_begin+7);
    memcpy(request,str_ptr_begin,str_ptr_end-str_ptr_begin+7);

    send_len=strlen(request);

    //printf("READY SIGN MESSAGE LENGTH		=: %d\n",send_len);
    //printf("READY SIGN MESSAGE		=: \n%s\n",send_buf);


    //memset(message_length,'\0',sizeof(message_len));
    //message_len=body_len+6;

    //sprintf(message_length,"%-6d",message_len); 

    //memcpy(request,message_length,6);

    //send_len=strlen(request);


    sprintf(post,"POST %s HTTP/1.0\r\n","/servlet/ABC95599.Trans");

    sprintf(content_len,"Content-Length: %d\r\n",send_len);

    sprintf(content_type,"Content-Type: %s\r\n\r\n","INFOSEC_SIGN/1.0");


    request = recv_buf; 

    strcpy(request,post);
    strcat(request,content_len);
    strcat(request,content_type);
    strcat(request,send_buf);

    recv_len=strlen(recv_buf);

    //printf("SEND SIGN REQUEST LENGTH:%d\n",recv_len); 
    //printf("SEND SIGN REQUEST:\n%s\n",request); 

    //nLen=SocketWrite(nSocket,request,send_len,30);
    nLen=SocketWrite(nSocket,request,recv_len,30);
    //if(nLen!=send_len)
    if(nLen!=recv_len)
    {
      printf("\n\nSEND SIGN REQUEST ERROR\n\n");
      CloseSocket(nSocket);
      if(request != NULL) free(request);
      request = NULL;
      //printf("PUSH MESSAGE LENGTH	=: %d\n",recv_u8_len);
      //printf("PUSH MESSAGE		=: \n%s\n",recv_u8_buf);
      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
    } 

   
    //printf("\n\nTHE FOLLOWING IS THE SIGN RESPONSE!\n\n");

    int i=0;
    int j=0;
    int k=0;

    memset(recv_buf,'\0',sizeof(recv_buf));
    recv_len=-1;  

    respones=recv_u8_buf;

    while(((nLen=SocketRead(nSocket,respones+j,1,5))==1)&&(j<MAX_BUFFER_DATA))
    {
      if(i < 3)
      {
         if(*(respones+j) == '\r' || *(respones+j) == '\n')
         {
           i++;
         }
         else
         {
           i = 0;
         }
      }
      else
      {
        recv_buf[k]=*(respones+j);
        k++;

        if( *(respones+j) == '\n')   
          break;
      }
      j++;
    }
 
    recv_u8_len=strlen(recv_u8_buf);

    char *content_length_ptr_begin=NULL;
    char *content_length_ptr_end=NULL; 

    content_length_ptr_begin=strstr(recv_u8_buf,"Content-Length:");
    content_length_ptr_end=strstr(content_length_ptr_begin,"\r\n"); 

    memset(message_length,'\0',sizeof(message_len));
 
    memcpy(message_length,content_length_ptr_begin+15,(content_length_ptr_end-content_length_ptr_begin-15));
    
    message_len=strlen(message_length);

    message_len = atoi(message_length);


    memset(recv_u8_buf,'\0',sizeof(recv_u8_buf));
    recv_u8_len=-1;

    //printf("\n\nTHE FOLLOWING IS THE SIGN RESPONSE!\n\n");

    respones=recv_buf;

    nLen=SocketRead(nSocket,respones,message_len,5);


    if(message_len!=nLen)
    {
      printf("\n\nRECEIVE SIGN RESPONSE ERROR\n\n");
      CloseSocket(nSocket);
      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
    }

    recv_len=strlen(recv_buf);

    //printf("SIGN MESSAGE LENGTH		=: %d\n",recv_len);
    //printf("SIGN MESSAGE		=: \n%s\n",recv_buf);

    CloseSocket(nSocket);
    nSocket=-1;


    memset(send_buf,'\0',sizeof(send_buf));
    send_len=-1;  
     

    char *sign_ptr_begin=NULL;
    char *sign_ptr_end=NULL;

    sign_ptr_begin=strstr(recv_buf,"<sign>");
    sign_ptr_end=strstr(recv_buf,"</sign>"); 
   
    memcpy(send_buf,sign_ptr_begin+6,(sign_ptr_end-sign_ptr_begin-6));


    memset(recv_buf,'\0',sizeof(recv_buf)); 
    recv_len=-1;

    strcpy(recv_buf,send_buf);
   
    request = send_gb_buf;

    memset(send_buf,'\0',sizeof(send_buf));
    send_len=-1;  

    memcpy(send_buf,request,(str_ptr_begin-str_ptr_start+6));

    strcat(send_buf,"<signature>");
    strcat(send_buf,recv_buf);
    strcat(send_buf,"</signature>");
    strcat(send_buf,str_ptr_end);

    send_len=strlen(send_buf);

    memset(send_gb_buf,'\0',sizeof(send_gb_buf));
    send_gb_len=-1;

    strcpy(send_gb_buf,send_buf);

    send_gb_len=strlen(send_gb_buf);

  }

  memset(message_length,'\0',sizeof(message_len));
  message_len=send_gb_len+6;
  sprintf(message_length,"%-6d",message_len);


  memset(send_buf,'\0',sizeof(send_buf));
  send_len=-1;  
  
  memcpy(send_buf,message_length,6);

  request=send_buf;

  memcpy(request+6,send_gb_buf,send_gb_len);

  send_len=strlen(send_buf);

  memset(send_gb_buf,'\0',sizeof(send_gb_buf));
  send_gb_len=-1;

  strcpy(send_gb_buf,send_buf);

  send_gb_len=strlen(send_gb_buf);


  //printf("REQUEST MESSAGE LENGTH		=: %d\n",send_gb_len);
  //printf("REQUEST MESSAGE		=: \n%s\n",send_gb_buf);

  int nSocket=CreateSocket();
  if(!CheckSocketValid(nSocket))
  {   
    printf("\n\nCREATE SOCKET ERROR!\n\n");
 
    //printf("PUSH MESSAGE LENGTH		=: %d\n",recv_u8_len);
    //printf("PUSH MESSAGE		=: \n%s\n",recv_u8_buf);

    pushint(-1); 
    pushvchar(recv_u8_buf,recv_u8_len); 
    return 2;   
  }


  char * szRemoteHost=server_ip;
  GlobalRemotePort=server_port;
  strcpy(GlobalRemoteHost,szRemoteHost);
  
  if(ConnectSocket(nSocket,GlobalRemoteHost,GlobalRemotePort)<=0)
  {
    printf("\n\nCONNECT NETSAFE CLIENT ERROR!\n\n");

    CloseSocket(nSocket);
    //printf("PUSH MESSAGE LENGTH		=:%d\n",recv_u8_len);
    //printf("PUSH MESSAGE		=:\n%s\n",recv_u8_buf);
    pushint(-1); 
    pushvchar(recv_u8_buf,recv_u8_len); 
    return 2;   
  }

  request = NULL;
  request = send_gb_buf;

  //printf("SEND REQUEST LENGTH		=: %d\n",send_gb_len); 
  //printf("SEND REQUEST			=: \n%s\n",send_gb_buf); 

  nLen=SocketWrite(nSocket,request,send_gb_len,30);
  if(nLen!=send_gb_len)	
  {
    printf("\n\nSEND MESSAGE REQUEST ERROR\n\n");
    CloseSocket(nSocket); 
    //printf("PUSH MESSAGE LENGTH		=:%d\n",recv_u8_len);
    //printf("PUSH MESSAGE		=:\n%s\n",recv_u8_buf);
    pushint(-1);
    pushvchar(recv_u8_buf,recv_u8_len);
    return 2;
  }  


  //printf("\n\nTHE FOLLOWING IS THE RESPONSE:\n\n");


  memset(message_length,'\0',sizeof(message_len));
  message_len=-1;

  respones=message_length;
  nLen=SocketRead(nSocket,respones,6,5);

  if(6!=nLen)
  {
      printf("\n\nRECEIVE RESPONSE LENGTH ERROR\n\n");
      CloseSocket(nSocket);
      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
  }


  message_len = atoi(message_length);

  message_len=message_len-6;

  respones=NULL;
  memset(recv_buf,'\0',sizeof(recv_buf)); 


  respones=recv_buf;

  nLen=SocketRead(nSocket,respones,message_len,5);

  if(message_len!=nLen)
  {
      printf("\n\nRECEIVE RESPONSE ERROR\n\n");
      CloseSocket(nSocket);
      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
  }

  recv_len=strlen(recv_buf);
  //printf("RESPONSE MESSAGE LENGTH		=: %d\n",recv_len);
  //printf("RESPONSE MESSAGE		=: \n%s\n",recv_buf);

  CloseSocket(nSocket);
  nSocket=-1;


  str_ptr_begin=strstr(recv_buf,"<signFlag>");
   
  str_ptr_end=strstr(str_ptr_begin,"</signFlag>");

  memset (signflag_buf,0x00,sizeof(signflag_buf));


  memcpy(signflag_buf,str_ptr_begin+10,str_ptr_end-str_ptr_begin-10);
  signflag = atoi(signflag_buf);
  printf("SIGN FLAG                     =: %d\n",signflag);


  str_ptr_begin=strstr(recv_buf,"<returnCode>");
   
  str_ptr_end=strstr(str_ptr_begin,"</returnCode>");

  memset (flag_buf,0x00,sizeof(flag_buf));


  memcpy(flag_buf,str_ptr_begin+12,str_ptr_end-str_ptr_begin-12);

  printf("RETURN CODE =: %s\n",flag_buf);

  flag=strcmp(flag_buf,"AAAAAAA");   

  //printf("RETURN CODE FLAG =: %d\n",flag);

  if(0!=flag)
  {


    //if(0==strcmp(flag_buf,"EGG0521")
    //{
    //  pushint(-3);
    //  pushvchar(flag_buf,strlen(flag_buf));
    //  return 2;

     
    //}ELSE
    //{
      memset(recv_u8_buf,'\0',sizeof(recv_u8_buf));
      recv_u8_len=-1;

      g2u(recv_buf,strlen(recv_buf),recv_u8_buf,MAX_BUFFER_DATA+1);

      recv_u8_len = strlen(recv_u8_buf);

   
      printf("\n\n RETURN CODE ERROR\n\n");
      pushint(-2);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
    //}
  }


  if(1==signflag)
  {

    str_ptr_start=recv_buf;

    str_ptr_begin=strstr(recv_buf,"<packet>");
   
    str_ptr_end=strstr(str_ptr_begin,"</head>");
  
    memset(send_gb_buf,'\0',sizeof(send_gb_buf));
    send_gb_len=-1;  

    memcpy(send_gb_buf,str_ptr_start,str_ptr_end-str_ptr_start+7);

    //printf("\n\nVERIFY SIGN REQUEST!\n\n");

    int nSocket=CreateSocket();
    if(!CheckSocketValid(nSocket))
    {  
      printf("\n\nCREATE SOCKET ERROR!\n\n");

      //printf("PUSH MESSAGE LENGTH	=: %d\n",recv_u8_len);
      //printf("PUSH MESSAGE		=: \n%s\n",recv_u8_buf);

      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);

      return 2;
    }

    char * szRemoteHost=server_ip;
    GlobalRemotePort = -1;
    GlobalRemotePort=sign_port;

    memset (GlobalRemoteHost,0x00,sizeof(GlobalRemoteHost));    
    strcpy(GlobalRemoteHost,szRemoteHost);
 
    if(ConnectSocket(nSocket,GlobalRemoteHost,GlobalRemotePort)<=0)
    {
      printf("\n\nCONNECT NETSAFE CLIENT SIGN ERROR!\n\n");

      CloseSocket(nSocket);
      //printf("PUSH MESSAGE LENGTH 	=: %d\n",recv_u8_len);
      //printf("PUSH MESSAGE	  	=: \n%s\n",recv_u8_buf);

      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
    }


    str_ptr_start=recv_buf;

    str_ptr_begin=strstr(recv_buf,"<signature>"); 

    str_ptr_end=strstr(str_ptr_begin,"</signature>"); 

    recv_len=strlen(str_ptr_begin); 


    memset(send_buf,'\0',sizeof(send_buf));
    send_len=-1;

    request = send_buf; 

    memcpy(request,str_ptr_begin+11,str_ptr_end-str_ptr_begin-11);

    send_len=strlen(request);

    printf("READY VERIFY SIGN MESSAGE LENGTH		=: %d\n",send_len);
    //printf("READY VERIFY SIGN MESSAGE		=: \n%s\n",send_buf);


    //memset(message_length,'\0',sizeof(message_len));
    //message_len=body_len+6;

    //sprintf(message_length,"%-6d",message_len); 

    //memcpy(request,message_length,6);

    //send_len=strlen(request);


    sprintf(post,"POST %s HTTP/1.0\r\n","/servlet/ABC95599.Trans");

    sprintf(content_len,"Content-Length: %d\r\n",send_len);

    sprintf(content_type,"Content-Type: %s\r\n\r\n","INFOSEC_VERIFY_SIGN/1.0");

    memset(recv_buf,'\0',sizeof(recv_buf));
    recv_len=-1;

    request = recv_buf; 

    strcpy(request,post);
    strcat(request,content_len);
    strcat(request,content_type);
    strcat(request,send_buf);

    recv_len=strlen(recv_buf);

    printf("SEND SIGN REQUEST LENGTH:%d\n",recv_len); 
    //printf("SEND SIGN REQUEST:\n%s\n",request); 

    //nLen=SocketWrite(nSocket,request,send_len,30);
    nLen=SocketWrite(nSocket,request,recv_len,30);
    //if(nLen!=send_len)
    if(nLen!=recv_len)
    {
      printf("\n\nSEND SIGN REQUEST ERROR\n\n");
      CloseSocket(nSocket);
      if(request != NULL) free(request);
      request = NULL;
      //printf("PUSH MESSAGE LENGTH	=: %d\n",recv_u8_len);
      //printf("PUSH MESSAGE		=: \n%s\n",recv_u8_buf);
      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
    } 

   
    //printf("\n\nTHE FOLLOWING IS THE SIGN RESPONSE!\n\n");

    int i=0;
    int j=0;
    int k=0;

    memset(recv_buf,'\0',sizeof(recv_buf));
    recv_len=-1;  

    respones=recv_u8_buf;

    while(((nLen=SocketRead(nSocket,respones+j,1,5))==1)&&(j<MAX_BUFFER_DATA))
    {
      if(i < 3)
      {
         if(*(respones+j) == '\r' || *(respones+j) == '\n')
         {
           i++;
         }
         else
         {
           i = 0;
         }
      }
      else
      {
        recv_buf[k]=*(respones+j);
        k++;

        if( *(respones+j) == '\n')   
          break;
      }
      j++;
    }
 
    recv_u8_len=strlen(recv_u8_buf);

    char *content_length_ptr_begin=NULL;
    char *content_length_ptr_end=NULL; 

    content_length_ptr_begin=strstr(recv_u8_buf,"Content-Length:");
    content_length_ptr_end=strstr(content_length_ptr_begin,"\r\n"); 

    memset(message_length,'\0',sizeof(message_len));
 
    memcpy(message_length,content_length_ptr_begin+15,(content_length_ptr_end-content_length_ptr_begin-15));
    
    message_len=strlen(message_length);

    message_len = atoi(message_length);


    memset(recv_u8_buf,'\0',sizeof(recv_u8_buf));
    recv_u8_len=-1;

    printf("\n\nTHE FOLLOWING IS THE VERIFY SIGN RESPONSE!\n\n");

    respones=recv_buf;

    nLen=SocketRead(nSocket,respones,message_len,5);


    if(message_len!=nLen)
    {
      printf("\n\nRECEIVE SIGN RESPONSE ERROR\n\n");
      CloseSocket(nSocket);
      pushint(-1);
      pushvchar(recv_u8_buf,recv_u8_len);
      return 2;
    }

    recv_len=strlen(recv_buf);

    printf("VERIFY SIGN MESSAGE LENGTH		=: %d\n",recv_len);
    //printf("VERIFY SIGN MESSAGE		=: \n%s\n",recv_buf);

    CloseSocket(nSocket);
    nSocket=-1;

    str_ptr_start=recv_buf;

    str_ptr_begin=strstr(recv_buf,"<sic>");
   
    str_ptr_end=strstr(str_ptr_begin,"</sic>");
  
     
    memset(send_buf,'\0',sizeof(send_buf)); 

    memcpy(send_buf,str_ptr_begin+5,(str_ptr_end-str_ptr_begin-5));

    
    
    memset(recv_buf,'\0',sizeof(recv_buf)); 
    recv_len=-1;

    strcpy(recv_buf,send_gb_buf);

    strcat(recv_buf,send_buf);

    strcat(recv_buf,"</packet>");


    /*

   
    request = send_gb_buf;

    memset(send_buf,'\0',sizeof(send_buf));
    send_len=-1;  

    memcpy(send_buf,request,(str_ptr_begin-str_ptr_start+6));

    strcat(send_buf,"<signature>");
    strcat(send_buf,recv_buf);
    strcat(send_buf,"</signature>");
    strcat(send_buf,str_ptr_end);

    send_len=strlen(send_buf);

    memset(send_gb_buf,'\0',sizeof(send_gb_buf));
    send_gb_len=-1;

    strcpy(send_gb_buf,send_buf);

    send_gb_len=strlen(send_gb_buf);
    */

  }

  memset(recv_u8_buf,'\0',sizeof(recv_u8_buf));
  recv_u8_len=-1;

  g2u(recv_buf,strlen(recv_buf),recv_u8_buf,MAX_BUFFER_DATA+1);

  recv_u8_len = strlen(recv_u8_buf);

  printf("PUSH MESSAGE LENGTH		=: %d\n",recv_u8_len); 
  printf("PUSH MESSAGE			=: \n%s\n",recv_u8_buf); 

  pushint(recv_u8_len);
  pushvchar(recv_u8_buf,recv_u8_len+1);

  return 2;
}

static int SocketWrite(int nSocket,char * pBuffer,int nLen,int nTimeout)
{
       if(nSocket==-1)
         return -1;

	int nOffset=0;
	int nWrite;
	int nLeft=nLen;
	int nLoop=0;
	int nTotal=0;
	int nNewTimeout=nTimeout*10;
	while((nLoop<=nNewTimeout)&&(nLeft>0))
	{
		nWrite=send(nSocket,pBuffer+nOffset,nLeft,0);
		if(nWrite==0)
		{
			return -1;
                }
                if(nWrite==-1)
	 	{
	   		if(errno!=EAGAIN)
	   		{
	     			return -1;
	  		}
 		}
        	if(nWrite<0)
		{
          		return nWrite;
		}	
		nOffset+=nWrite;
		nLeft-=nWrite;
		nTotal+=nWrite;
		if(nLeft>0)
		{
        		SysSleep(100);
		}
		nLoop++;
	}
  return nTotal;
}

static int  SocketRead(int nSocket,void * pBuffer,int nLen,int nTimeout)
{

       if(nSocket==-1)
         return -1;

        int nOffset=0;
        int nRead;
        int nLeft=nLen;
        int nLoop=0;
        int nTotal=0;
        int nNewTimeout=nTimeout*10;
        while((nLoop<=nNewTimeout)&&(nLeft>0))
        {
		nRead=recv(nSocket,pBuffer+nOffset,nLeft,0);
		if(nRead==-1)
		{
			if(errno==0)
				return -1;
			if(errno==EAGAIN)
				return 0;

			return nRead;
		}

                nOffset+=nRead;
                nLeft-=nRead;
                nTotal+=nRead;  
                if(nLeft>0)
                {
                    SysSleep(100);
                }

 	        nLoop++;
        }

   return nTotal;

}

static void SysSleep(long nTime)
//	延时nTime毫秒，毫秒是千分之一秒
{
        struct	timespec localTimeSpec;
        struct	timespec localLeftSpec;
	localTimeSpec.tv_sec=nTime/1000;
	localTimeSpec.tv_nsec=(nTime%1000)*1000000;
	nanosleep(&localTimeSpec,&localLeftSpec);
}

static int CloseSocket(int nSocket)
{
	int rc=0;
	if(!CheckSocketValid(nSocket))
	{
		return rc;
	}
	shutdown(nSocket,SHUT_RDWR);
	close(nSocket);
	rc=1;
	return rc;
}	

static int CheckSocketValid(int nSocket)
{
//	check socket valid

	if(nSocket==-1)
		return 0;
	else
		return 1;
}

static int BindPort(int nSocket,int nPort)
{
	int rc;
	int optval=1;
	rc=setsockopt(nSocket,SOL_SOCKET,SO_REUSEADDR,
		(const char *)&optval,sizeof(int));
	if(!CheckSocketResult(rc))
		return 0;

   	struct sockaddr_in name;
   	memset(&name,0,sizeof(struct sockaddr_in));
   	name.sin_family=AF_INET;
   	name.sin_port=htons((unsigned short)nPort);
	name.sin_addr.s_addr=INADDR_ANY;
    	rc=bind(nSocket,(struct sockaddr *)&name,sizeof(struct sockaddr_in));
	if(!CheckSocketResult(rc))
		return 0;
	return 1;
}

static int CheckSocketResult(int nResult)
{
//	check result;
	if(nResult==-1)
		return 0;
	else
		return 1;
}

static int ListenSocket(int nSocket,int nMaxQueue)
{
	int rc=0;
	rc=listen(nSocket,nMaxQueue);
	return CheckSocketResult(rc);
}

static void SetSocketNotBlock(int nSocket)
{
    long fileattr;
    fileattr=fcntl(nSocket,F_GETFL);
    fcntl(nSocket,F_SETFL,fileattr|O_NDELAY);
}

static int ConnectSocket(int nSocket,const char * szHost,int nPort)
{

  //struct hostent *pHost=NULL;
  //struct hostent localHost;
  struct sockaddr_in name;
  //struct in_addr in;

  //struct hostent_data pHostData;
  //int h_errorno=0;
  //int h_rc=gethostbyname_r(szHost,pHost,&pHostData);

  //if((pHost==0)||(h_rc!=0))
  //{
  //  return 0;
  //}


  //memcpy(&in.s_addr, pHost->h_addr_list[0],sizeof(in.s_addr));

  //memset(&name,0x0,sizeof(struct sockaddr_in));

 
  name.sin_family=AF_INET;
  name.sin_port=htons((unsigned short)nPort);
  //printf("TEST:%s",szHost);
  //name.sin_addr.s_addr=in.s_addr;
  name.sin_addr.s_addr=inet_addr(szHost);
  int rc=connect(nSocket,(struct sockaddr *)&name,sizeof(struct sockaddr_in));

  if(rc>=0)
  {
    return 1;
  }

return 0;
}

static int CreateSocket()
{
	int nSocket;
	nSocket=(int)socket(PF_INET,SOCK_STREAM,0);
	return nSocket;
}
  
static int code_convert(char *from_charset,char *to_charset,char *inbuf,size_t inlen,char *outbuf,size_t outlen)
{
  iconv_t cd;
  int rc;
  char **pin = &inbuf;
  char **pout = &outbuf;

  cd = iconv_open(to_charset,from_charset);
  if (cd==0) return -1;
  memset(outbuf,0,outlen);
  if (iconv(cd,pin,&inlen,pout,&outlen)==-1)
    return -1;
  iconv_close(cd);
  return 0;
}

static int u2g(char *inbuf,int inlen,char *outbuf,int outlen)
{
  return code_convert("UTF-8","GBK",inbuf,inlen,outbuf,outlen);
}

static int g2u(char *inbuf,size_t inlen,char *outbuf,size_t outlen)
{
  return code_convert("GBK","UTF-8",inbuf,inlen,outbuf,outlen);
}

static char GetBase64Value(char ch)
{
if ((ch >= 'A') && (ch <= 'Z'))   // A ~ Z
   return ch - 'A';
if ((ch >= 'a') && (ch <= 'z'))   // a ~ z
   return ch - 'a' + 26;
if ((ch >= '0') && (ch <= '9'))   // 0 ~ 9
   return ch - '0' + 52;
switch (ch)
{
case '+':
   return 62;
case '/':
   return 63;
case '=':
   return 0;
default:
   return 0;
}
}

static int Base64Decode( char *OrgString, char *Base64String, int Base64StringLen, int bForceDecode )
{
if( Base64StringLen % 4 && !bForceDecode )
{
   OrgString[0] = '\0';
   return -1;
}
unsigned char Base64Encode[4];
int OrgStringLen=0;

while( Base64StringLen > 2 )
{
   Base64Encode[0] = GetBase64Value(Base64String[0]);
   Base64Encode[1] = GetBase64Value(Base64String[1]);
   Base64Encode[2] = GetBase64Value(Base64String[2]);
   Base64Encode[3] = GetBase64Value(Base64String[3]);

   *OrgString ++ = (Base64Encode[0] << 2) | (Base64Encode[1] >> 4);
   *OrgString ++ = (Base64Encode[1] << 4) | (Base64Encode[2] >> 2);
   *OrgString ++ = (Base64Encode[2] << 6) | (Base64Encode[3]);

   Base64String += 4;
   Base64StringLen -= 4;
   OrgStringLen += 3;
}

return OrgStringLen;
}

static int compare( char *src, char *dst, int n)
{
  int  i = 0;
  int  j = 0;

  for ( i = 0; i < n; ++i )
  {
    if ( src[i] == dst[i] )
      j++;
    else
      break;
  }

  if ( j == n )
    return 1;
  else
    return 0;
}
