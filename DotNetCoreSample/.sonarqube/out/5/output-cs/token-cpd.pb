˜
i/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Configurations/AppSettings.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 
Configurations -
{ 
public 

abstract 
class 
AppSettings %
{ 
} 
} Ì
r/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Configurations/ConfigureAppSettings.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 
Configurations -
{ 
public 

static 
class  
ConfigureAppSettings ,
{ 
public 
static 
IServiceCollection (
AddAppSettings) 7
(7 8
this8 <
IServiceCollection= O
servicesP X
,X Y
IConfigurationZ h
configurationi v
)v w
{		 	
services

 
.

 
	Configure

 
<

 
AppSettings

 *
>

* +
(

+ ,
_

, -
=>

. 0
configuration

1 >
.

> ?

GetSection

? I
(

I J
$str

J W
)

W X
.

X Y
Bind

Y ]
(

] ^
_

^ _
)

_ `
)

` a
;

a b
return 
services 
; 
} 	
} 
} ∫
r/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Configurations/ConfigureConnections.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 
Configurations -
{ 
public 

static 
class  
ConfigureConnections ,
{		 
public

 
static

 
IServiceCollection

 (!
AddConnectionProvider

) >
(

> ?
this

? C
IServiceCollection

D V
services

W _
,

_ `
IConfiguration 
configuration (
)( )
{ 	
string 

connection 
= 
configuration  -
.- .
GetConnectionString. A
(A B
$strB T
)T U
??V X
$strY k
;k l
services 
. 
AddDbContext !
<! "
InMemoryDbContext" 3
>3 4
(4 5
opt5 8
=>9 ;
opt 
. 
UseInMemoryDatabase '
(' (

connection( 2
)2 3
.3 4$
UseQueryTrackingBehavior4 L
(L M!
QueryTrackingBehaviorM b
.b c

NoTrackingc m
)m n
)n o
;o p
return 
services 
; 
} 	
} 
} ”
s/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Configurations/ServicesConfiguration.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 
Configurations -
{		 
public

 

static

 
class

 !
ServicesConfiguration

 -
{ 
public 
static 
IServiceCollection (!
ConfigureRepositories) >
(> ?
this? C
IServiceCollectionD V
servicesW _
)_ `
{ 	
services 
. 
	AddScoped 
( 
typeof %
(% &
IUserRepository& 5
)5 6
,6 7
typeof8 >
(> ?
UserRepository? M
)M N
)N O
;O P
return 
services 
; 
} 	
public 
static 
IServiceCollection (
ConfigureBusiness) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
)[ \
{ 	
services 
. 
	AddScoped 
( 
typeof %
(% &
IUserBusinessFacade& 9
)9 :
,: ;
typeof< B
(B C
UserBusinessFacadeC U
)U V
)V W
;W X
return 
services 
; 
} 	
public 
static 
IServiceCollection (
AddMiddleware) 6
(6 7
this7 ;
IServiceCollection< N
servicesO W
)W X
{ 	
services 
. 
AddMvc 
( 
) 
. 
AddJsonOptions ,
(, -
options- 4
=>5 7
{ 
options 
. 
SerializerSettings *
.* +!
ReferenceLoopHandling+ @
=A B!
ReferenceLoopHandlingC X
.X Y
IgnoreY _
;_ `
} 
) 
; 
return!! 
services!! 
;!! 
}"" 	
public$$ 
static$$ 
IServiceCollection$$ ( 
AddCorsConfiguration$$) =
($$= >
this$$> B
IServiceCollection$$C U
services$$V ^
)$$^ _
=>$$` b
services%% 
.%% 
AddCors%% 
(%% 
options%% $
=>%%% '
{&& 
options'' 
.'' 
	AddPolicy'' !
(''! "
$str''" ,
,'', -
new''. 1
	Microsoft''2 ;
.''; <

AspNetCore''< F
.''F G
Cors''G K
.''K L
Infrastructure''L Z
.''Z [
CorsPolicyBuilder''[ l
(''l m
)''m n
.(( 
AllowAnyHeader(( #
(((# $
)(($ %
.)) 
AllowAnyMethod)) #
())# $
)))$ %
.** 
AllowAnyOrigin** #
(**# $
)**$ %
.++ 
AllowCredentials++ %
(++% &
)++& '
.,, 
Build,, 
(,, 
),, 
),, 
;,, 
}-- 
)-- 
;-- 
}.. 
}// ÷
i/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Controllers/UserController.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 
Controllers *
{ 
public 

class 
UserController 
:  !

Controller" ,
<, -
User- 1
>1 2
{		 
public

 
UserController

 
(

 
IUserBusinessFacade

 1
businessfacade

2 @
,

@ A
ILogger

B I
<

I J
UserController

J X
>

X Y
logger

Z `
)

` a
:

b c
base

d h
(

h i
businessfacade

i w
,

w x
logger

y 
)	

 Ä
{


Å Ç
}


É Ñ
} 
} À
m/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Extensions/ExceptionMiddleware.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 

Extensions )
{		 
public

 

class

 
ExceptionMiddleware

 $
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
ILogger  
<  !
ExceptionMiddleware! 4
>4 5
_logger6 =
;= >
public 
ExceptionMiddleware "
(" #
RequestDelegate# 2
next3 7
,7 8
ILogger9 @
<@ A
ExceptionMiddlewareA T
>T U
loggerV \
)\ ]
{ 	
_logger 
= 
logger 
; 
_next 
= 
next 
; 
} 	
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
httpContext2 =
)= >
{ 	
try 
{ 
await 
_next 
( 
httpContext '
)' (
;( )
} 
catch 
( 
	Exception 
ex 
)  
{ 
_logger 
. 
LogError  
(  !
ex! #
.# $
ToString$ ,
(, -
)- .
). /
;/ 0
await  
HandleExceptionAsync *
(* +
httpContext+ 6
,6 7
ex8 :
): ;
;; <
} 
}   	
private"" 
static"" 
Task""  
HandleExceptionAsync"" 0
(""0 1
HttpContext""1 <
context""= D
,""D E
	Exception""F O
	exception""P Y
)""Y Z
{## 	
context$$ 
.$$ 
Response$$ 
.$$ 
ContentType$$ (
=$$) *
$str$$+ =
;$$= >
context%% 
.%% 
Response%% 
.%% 

StatusCode%% '
=%%( )
(%%* +
int%%+ .
)%%. /
HttpStatusCode%%/ =
.%%= >
InternalServerError%%> Q
;%%Q R
return'' 
context'' 
.'' 
Response'' #
.''# $

WriteAsync''$ .
(''. /
new''/ 2
ErrorDetails''3 ?
(''? @
)''@ A
{(( 

StatusCode)) 
=)) 
context)) $
.))$ %
Response))% -
.))- .

StatusCode)). 8
,))8 9
Message** 
=** 
	exception** #
.**# $
Message**$ +
}++ 
.++ 
ToString++ 
(++ 
)++ 
)++ 
;++ 
},, 	
}-- 
public// 

class// 
ErrorDetails// 
{00 
public11 
int11 

StatusCode11 
{11 
get11  #
;11# $
set11% (
;11( )
}11* +
public22 
string22 
Message22 
{22 
get22  #
;22# $
set22% (
;22( )
}22* +
public44 
override44 
string44 
ToString44 '
(44' (
)44( )
{55 	
return66 
JsonConvert66 
.66 
SerializeObject66 .
(66. /
this66/ 3
)663 4
;664 5
}77 	
}88 
}99 ¢
w/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Extensions/ExceptionMiddlewareExtensions.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 

Extensions )
{ 
public 

static 
class )
ExceptionMiddlewareExtensions 5
{ 
public 
static 
void .
"ConfigureCustomExceptionMiddleware =
(= >
this> B
IApplicationBuilderC V
appW Z
)Z [
{ 	
app		 
.		 
UseMiddleware		 
<		 
ExceptionMiddleware		 1
>		1 2
(		2 3
)		3 4
;		4 5
}

 	
} 
} Œ$
V/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Program.cs
	namespace 	
DotNetCoreSample
 
. 
API 
{		 
class

 	
CallerEnricher


 
:

 
ILogEventEnricher

 ,
{ 
public 
void 
Enrich 
( 
LogEvent #
logEvent$ ,
,, -$
ILogEventPropertyFactory. F
propertyFactoryG V
)V W
{ 	
var 
skip 
= 
$num 
; 
while 
( 
true 
) 
{ 
var 
stack 
= 
new 

StackFrame  *
(* +
skip+ /
,/ 0
true1 5
)5 6
;6 7
if 
( 
! 
stack 
. 
	HasMethod $
($ %
)% &
)& '
{ 
return 
; 
} 
var 
method 
= 
stack "
." #
	GetMethod# ,
(, -
)- .
;. /
if 
( 
method 
. 
DeclaringType (
.( )
Assembly) 1
!=2 4
typeof5 ;
(; <
Log< ?
)? @
.@ A
AssemblyA I
&&J L
methodM S
.S T
DeclaringTypeT a
.a b
Assemblyb j
!=k m
typeofn t
(t u
Serilogu |
.| }

Extensions	} á
.
á à
Logging
à è
.
è ê#
SerilogLoggerProvider
ê •
)
• ¶
.
¶ ß
Assembly
ß Ø
&&
∞ ≤
method
≥ π
.
π ∫
DeclaringType
∫ «
.
« »
Assembly
» –
!=
— ”
typeof
‘ ⁄
(
⁄ €
	Microsoft
€ ‰
.
‰ Â

Extensions
Â Ô
.
Ô 
Logging
 ˜
.
˜ ¯)
LoggerExternalScopeProvider
¯ ì
)
ì î
.
î ï
Assembly
ï ù
)
ù û
{ 
var 
caller 
=  
$"! #
{# $
stack$ )
.) *
GetFileLineNumber* ;
(; <
)< =
}= >
"> ?
;? @
logEvent 
. 
AddPropertyIfAbsent 0
(0 1
new1 4
LogEventProperty5 E
(E F
$strF L
,L M
newN Q
ScalarValueR ]
(] ^
caller^ d
)d e
)e f
)f g
;g h
return 
; 
} 
skip   
++   
;   
}!! 
}"" 	
}## 
public%% 

static%% 
class%% 
Program%% 
{&& 
public'' 
static'' 
void'' 
Main'' 
(''  
string''  &
[''& '
]''' (
args'') -
)''- .
=>''/ 1 
CreateWebHostBuilder''2 F
(''F G
args''G K
)''K L
.''L M
Build''M R
(''R S
)''S T
.''T U
Run''U X
(''X Y
)''Y Z
;''Z [
public)) 
static)) 
IWebHostBuilder)) % 
CreateWebHostBuilder))& :
()): ;
string)); A
[))A B
]))B C
args))D H
)))H I
=>))J L
WebHost** 
.**  
CreateDefaultBuilder** (
(**( )
args**) -
)**- .
.++ 

UseSerilog++ 
(++ 
(++ 
hostingContext++ '
,++' (
loggerConfiguration++) <
)++< =
=>++> @
loggerConfiguration++A T
.,, 
ReadFrom,, 
.,, 
Configuration,, '
(,,' (
hostingContext,,( 6
.,,6 7
Configuration,,7 D
),,D E
.-- 
Enrich-- 
.-- 
FromLogContext-- &
(--& '
)--' (
... 
Enrich.. 
... 
With.. 
(.. 
new..  
CallerEnricher..! /
(../ 0
)..0 1
)..1 2
)..2 3
.// 

UseStartup// 
<// 
Startup// 
>//  
(//  !
)//! "
;//" #
}00 
}11 ﬁ
V/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Startup.cs
	namespace 	
DotNetCoreSample
 
. 
API 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddMemoryCache #
(# $
)$ %
;% &
services 
. 
AddResponseCaching '
(' (
)( )
;) *
services 
. 
AddMvc 
( 
) 
. #
SetCompatibilityVersion 5
(5 6 
CompatibilityVersion6 J
.J K
Version_2_2K V
)V W
.W X
AddApplicationPartX j
(j k
typeofk q
(q r
UserController	r Ä
)
Ä Å
.
Å Ç
Assembly
Ç ä
)
ä ã
;
ã å
services 
. 

AddLogging 
(  
)  !
. !
ConfigureRepositories &
(& '
)' (
. 
ConfigureBusiness "
(" #
)# $
.   
AddMiddleware   
(   
)    
.!!  
AddCorsConfiguration!! %
(!!% &
)!!& '
."" !
AddConnectionProvider"" &
(""& '
Configuration""' 4
)""4 5
.## 
AddAppSettings## 
(##  
Configuration##  -
)##- .
;##. /
services%% 
.%% 
AddSwaggerGen%% "
(%%" #
s%%# $
=>%%% '
s%%( )
.%%) *

SwaggerDoc%%* 4
(%%4 5
$str%%5 9
,%%9 :
new%%; >
Info%%? C
{&& 
Title'' 
='' 
$str'' .
,''. /
Description(( 
=(( 
$str(( 6
})) 
))) 
))) 
;)) 
}** 	
public-- 
void-- 
	Configure-- 
(-- 
IApplicationBuilder-- 1
app--2 5
,--5 6
IHostingEnvironment--7 J
env--K N
)--N O
{.. 	
if// 
(// 
env// 
.// 
IsDevelopment// !
(//! "
)//" #
)//# $
{00 
app11 
.11 %
UseDeveloperExceptionPage11 -
(11- .
)11. /
;11/ 0
}22 
app44 
.44 
UseCors44 
(44 
$str44 "
)44" #
;44# $
app55 
.55 
UseStaticFiles55 
(55 
)55  
;55  !
app66 
.66 .
"ConfigureCustomExceptionMiddleware66 2
(662 3
)663 4
;664 5
app77 
.77 
UseMvc77 
(77 
)77 
;77 
app88 
.88 

UseSwagger88 
(88 
)88 
;88 
app99 
.99 
UseSwaggerUI99 
(99 
s99 
=>99 !
s99" #
.99# $
SwaggerEndpoint99$ 3
(993 4
$str994 N
,99N O
$str99P Y
)99Y Z
)99Z [
;99[ \
}:: 	
};; 
}<< 