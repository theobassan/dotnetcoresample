‹*
p/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.Repository/Implementations/Repository.cs
	namespace 	
DotNetCoreSample
 
. 

Repository %
.% &
Implementations& 5
{ 
public 

class 

Repository 
< 
T 
> 
:  
IRepository! ,
<, -
T- .
>. /
where0 5
T6 7
:8 9
	BaseModel: C
{ 
private 
readonly 
InMemoryDbContext *
_context+ 3
;3 4
private 
readonly 
DbSet 
< 
T  
>  !
_entity" )
;) *
public 
readonly 
ILogger 
_logger  '
;' (
public 

Repository 
( 
InMemoryDbContext +
context, 3
,3 4
ILogger5 <
<< =

Repository= G
<G H
TH I
>I J
>J K
loggerL R
)R S
{ 	
_context 
= 
context 
; 
_entity 
= 
_context 
. 
Set "
<" #
T# $
>$ %
(% &
)& '
;' (
_logger 
= 
logger 
; 
} 	
public 
void 
Dispose 
( 
) 
{ 	
Dispose 
( 
true 
) 
; 
GC 
. 
SuppressFinalize 
(  
this  $
)$ %
;% &
} 	
	protected!! 
virtual!! 
void!! 
Dispose!! &
(!!& '
bool!!' +
	disposing!!, 5
)!!5 6
=>!!7 9
_context!!: B
.!!B C
Dispose!!C J
(!!J K
)!!K L
;!!L M
public## 
async## 
Task## 
<## 
T## 
>## 
AddAsync## %
(##% &
T##& '
t##( )
,##) *
CancellationToken##+ <
ct##= ?
=##@ A
default##B I
)##I J
{$$ 	
_entity%% 
.%% 
Add%% 
(%% 
t%% 
)%% 
;%% 
await&& 
_context&& 
.&& 
SaveChangesAsync&& +
(&&+ ,
)&&, -
;&&- .
return'' 
t'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
bool** 
>** 
UpdateAsync**  +
(**+ ,
T**, -
t**. /
,**/ 0
CancellationToken**1 B
ct**C E
=**F G
default**H O
)**O P
{++ 	
_context,, 
.,, 
Entry,, 
(,, 
t,, 
),, 
.,, 
State,, #
=,,$ %
EntityState,,& 1
.,,1 2
Modified,,2 :
;,,: ;
await-- 
_context-- 
.-- 
SaveChangesAsync-- +
(--+ ,
)--, -
;--- .
return// 
true// 
;// 
}00 	
public22 
async22 
Task22 
<22 
bool22 
>22 
DeleteAsync22  +
(22+ ,
long22, 0
id221 3
,223 4
CancellationToken225 F
ct22G I
=22J K
default22L S
)22S T
{33 	
var44 
t44 
=44 
await44 
_entity44 !
.44! "
	FindAsync44" +
(44+ ,
id44, .
)44. /
;44/ 0
if55 
(55 
t55 
==55 
null55 
)55 
{66 
return77 
false77 
;77 
}88 
_entity:: 
.:: 
Remove:: 
(:: 
t:: 
):: 
;:: 
await;; 
_context;; 
.;; 
SaveChangesAsync;; +
(;;+ ,
);;, -
;;;- .
return== 
true== 
;== 
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
List@@ 
<@@ 
T@@  
>@@  !
>@@! "
GetAllAsync@@# .
(@@. /
CancellationToken@@/ @
ct@@A C
=@@D E
default@@F M
)@@M N
{AA 	
returnBB 
awaitBB 
_entityBB  
.BB  !
ToListAsyncBB! ,
(BB, -
)BB- .
;BB. /
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
TEE 
>EE 
GetByIdAsyncEE )
(EE) *
longEE* .
idEE/ 1
,EE1 2
CancellationTokenEE3 D
ctEEE G
=EEH I
defaultEEJ Q
)EEQ R
=>EES U
awaitEEV [
_entityEE\ c
.EEc d
	FindAsyncEEd m
(EEm n
idEEn p
)EEp q
;EEq r
}FF 
}GG ƒ
t/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.Repository/Implementations/UserRepository.cs
	namespace 	
DotNetCoreSample
 
. 

Repository %
.% &
Implementations& 5
{ 
public 

class 
UserRepository 
:  !

Repository" ,
<, -
User- 1
>1 2
,2 3
IUserRepository4 C
{		 
public

 
UserRepository

 
(

 
InMemoryDbContext

 /
context

0 7
,

7 8
ILogger

9 @
<

@ A
UserRepository

A O
>

O P
logger

Q W
)

W X
:

Y Z
base

[ _
(

_ `
context

` g
,

g h
logger

i o
)

o p
{

q r
}

s t
} 
} °
l/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.Repository/Interfaces/IRepository.cs
	namespace 	
DotNetCoreSample
 
. 

Repository %
.% &

Interfaces& 0
{ 
public		 

	interface		 
IRepository		  
<		  !
T		! "
>		" #
:		$ %
IDisposable		& 1
where		2 7
T		8 9
:		: ;
	BaseModel		< E
{

 
Task 
< 
List 
< 
T 
> 
> 
GetAllAsync !
(! "
CancellationToken" 3
ct4 6
=7 8
default9 @
)@ A
;A B
Task 
< 
T 
> 
GetByIdAsync 
( 
long !
id" $
,$ %
CancellationToken& 7
ct8 :
=; <
default= D
)D E
;E F
Task 
< 
T 
> 
AddAsync 
( 
T 
t 
, 
CancellationToken /
ct0 2
=3 4
default5 <
)< =
;= >
Task 
< 
bool 
> 
UpdateAsync 
( 
T  
t! "
," #
CancellationToken$ 5
ct6 8
=9 :
default; B
)B C
;C D
Task 
< 
bool 
> 
DeleteAsync 
( 
long #
id$ &
,& '
CancellationToken( 9
ct: <
== >
default? F
)F G
;G H
} 
} Ë
p/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.Repository/Interfaces/IUserRepository.cs
	namespace 	
DotNetCoreSample
 
. 

Repository %
.% &

Interfaces& 0
{ 
public 

	interface 
IUserRepository $
:% &
IRepository' 2
<2 3
User3 7
>7 8
{9 :
}; <
} 