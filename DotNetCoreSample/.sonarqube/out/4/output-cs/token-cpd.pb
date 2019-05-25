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
}// ê2
e/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Controllers/Controller.cs
	namespace		 	
DotNetCoreSample		
 
.		 
API		 
.		 
Controllers		 *
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 

Controller 
< 
T 
> 
:  
ControllerBase! /
where0 5
T6 7
:8 9
	BaseModel: C
{ 
private 
readonly 
IBusinessFacade (
<( )
T) *
>* +
_businessfacade, ;
;; <
public 
readonly 
ILogger 
<  

Controller  *
<* +
T+ ,
>, -
>- .
_logger/ 6
;6 7
public 

Controller 
( 
IBusinessFacade )
<) *
T* +
>+ ,
businessfacade- ;
,; <
ILogger= D
<D E

ControllerE O
<O P
TP Q
>Q R
>R S
loggerT Z
)Z [
{ 	
_businessfacade 
= 
businessfacade ,
;, -
_logger 
= 
logger 
; 
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
ActionResult &
<& '
List' +
<+ ,
T, -
>- .
>. /
>/ 0
Get1 4
(4 5
CancellationToken5 F
ctG I
=J K
defaultL S
)S T
{ 	
return 
new 
ObjectResult #
(# $
await$ )
_businessfacade* 9
.9 :
GetAllAsync: E
(E F
ctF H
)H I
)I J
;J K
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
<& '
T' (
>( )
>) *
Get+ .
(. /
long/ 3
id4 6
,6 7
CancellationToken8 I
ctJ L
=M N
defaultO V
)V W
{   	
var!! 
t!! 
=!! 
await!! 
_businessfacade!! )
.!!) *
GetByIdAsync!!* 6
(!!6 7
id!!7 9
,!!9 :
ct!!; =
)!!= >
;!!> ?
if"" 
("" 
t"" 
=="" 
null"" 
)"" 
return"" !
NotFound""" *
(""* +
)""+ ,
;"", -
return$$ 
Ok$$ 
($$ 
t$$ 
)$$ 
;$$ 
}%% 	
['' 	
HttpPost''	 
]'' 
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
>((& '
Post((( ,
(((, -
[((- .
FromBody((. 6
]((6 7
T((8 9
input((: ?
,((? @
CancellationToken((A R
ct((S U
=((V W
default((X _
)((_ `
{)) 	
if** 
(** 
input** 
==** 
null** 
)** 
return** %

BadRequest**& 0
(**0 1
)**1 2
;**2 3
await,, 
_businessfacade,, !
.,,! "
AddAsync,," *
(,,* +
input,,+ 0
,,,0 1
ct,,2 4
),,4 5
;,,5 6
return.. 

StatusCode.. 
(.. 
$num.. !
)..! "
;.." #
}// 	
[11 	
HttpPut11	 
]11 
public22 
async22 
Task22 
<22 
ActionResult22 &
>22& '
Put22( +
(22+ ,
[22, -
FromBody22- 5
]225 6
T227 8
input229 >
,22> ?
CancellationToken22@ Q
ct22R T
=22U V
default22W ^
)22^ _
{33 	
if44 
(44 
input44 
==44 
null44 
)44 
return44 %

BadRequest44& 0
(440 1
)441 2
;442 3
if55 
(55 
await55 
_businessfacade55 %
.55% &
GetByIdAsync55& 2
(552 3
input553 8
.558 9
Id559 ;
,55; <
ct55= ?
)55? @
==55A C
null55D H
)55H I
return55J P
NotFound55Q Y
(55Y Z
)55Z [
;55[ \
await77 
_businessfacade77 !
.77! "
UpdateAsync77" -
(77- .
input77. 3
,773 4
ct775 7
)777 8
;778 9
return99 
Ok99 
(99 
)99 
;99 
}:: 	
[<< 	

HttpDelete<<	 
(<< 
$str<< 
)<< 
]<< 
public== 
async== 
Task== 
<== 
ActionResult== &
>==& '
DeleteAsync==( 3
(==3 4
long==4 8
id==9 ;
,==; <
CancellationToken=== N
ct==O Q
===R S
default==T [
)==[ \
{>> 	
var?? 
t?? 
=?? 
await?? 
_businessfacade?? )
.??) *
GetByIdAsync??* 6
(??6 7
id??7 9
,??9 :
ct??; =
)??= >
;??> ?
if@@ 
(@@ 
t@@ 
==@@ 
null@@ 
)@@ 
return@@ !
NotFound@@" *
(@@* +
)@@+ ,
;@@, -
awaitBB 
_businessfacadeBB !
.BB! "
DeleteAsyncBB" -
(BB- .
tBB. /
,BB/ 0
ctBB1 3
)BB3 4
;BB4 5
returnDD 
OkDD 
(DD 
)DD 
;DD 
}EE 	
}FF 
}GG ÷
i/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.API/Controllers/UserController.cs
	namespace 	
DotNetCoreSample
 
. 
API 
. 
Controllers *
{ 
public 

class 
UserController 
:  !

Controller" ,
<, -
User- 1
>1 2
{ 
public		 
UserController		 
(		 
IUserBusinessFacade		 1
businessfacade		2 @
,		@ A
ILogger		B I
<		I J
UserController		J X
>		X Y
logger		Z `
)		` a
:		b c
base		d h
(		h i
businessfacade		i w
,		w x
logger		y 
)			 Ä
{
		Å Ç
}
		É Ñ
}

 
} À
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