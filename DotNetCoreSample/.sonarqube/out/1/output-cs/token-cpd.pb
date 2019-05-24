ƒ'
p/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.Repository/Implementations/Repository.cs
	namespace

 	
DotNetCoreSample


 
.

 

Repository

 %
.

% &
Implementations

& 5
{ 
public 

class 

Repository 
< 
T 
> 
:  
IRepository! ,
<, -
T- .
>. /
where0 5
T6 7
:8 9
	BaseModel: C
{ 
private 
readonly 
InMemoryDbContext *
_context+ 3
;3 4
private 
readonly 
DbSet 
< 
T  
>  !
_entity" )
;) *
public 
readonly 
ILogger 
_logger  '
;' (
public 

Repository 
( 
InMemoryDbContext +
context, 3
,3 4
ILogger5 <
<< =

Repository= G
<G H
TH I
>I J
>J K
loggerL R
)R S
{ 	
_context 
= 
context 
; 
_entity 
= 
_context 
. 
Set "
<" #
T# $
>$ %
(% &
)& '
;' (
_logger 
= 
logger 
; 
} 	
public 
void 
Dispose 
( 
) 
=>  
_context! )
.) *
Dispose* 1
(1 2
)2 3
;3 4
public 
async 
Task 
< 
T 
> 
AddAsync %
(% &
T& '
t( )
,) *
CancellationToken+ <
ct= ?
=@ A
defaultB I
)I J
{ 	
_entity 
. 
Add 
( 
t 
) 
; 
await 
_context 
. 
SaveChangesAsync +
(+ ,
), -
;- .
return 
t 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
bool"" 
>"" 
UpdateAsync""  +
(""+ ,
T"", -
t"". /
,""/ 0
CancellationToken""1 B
ct""C E
=""F G
default""H O
)""O P
{## 	
_context$$ 
.$$ 
Entry$$ 
($$ 
t$$ 
)$$ 
.$$ 
State$$ #
=$$$ %
EntityState$$& 1
.$$1 2
Modified$$2 :
;$$: ;
await%% 
_context%% 
.%% 
SaveChangesAsync%% +
(%%+ ,
)%%, -
;%%- .
return'' 
true'' 
;'' 
}(( 	
public** 
async** 
Task** 
<** 
bool** 
>** 
DeleteAsync**  +
(**+ ,
long**, 0
id**1 3
,**3 4
CancellationToken**5 F
ct**G I
=**J K
default**L S
)**S T
{++ 	
var,, 
t,, 
=,, 
await,, 
_entity,, !
.,,! "
	FindAsync,," +
(,,+ ,
id,,, .
),,. /
;,,/ 0
if-- 
(-- 
t-- 
==-- 
null-- 
)-- 
{.. 
return// 
false// 
;// 
}00 
_entity22 
.22 
Remove22 
(22 
t22 
)22 
;22 
await33 
_context33 
.33 
SaveChangesAsync33 +
(33+ ,
)33, -
;33- .
return55 
true55 
;55 
}66 	
public88 
async88 
Task88 
<88 
List88 
<88 
T88  
>88  !
>88! "
GetAllAsync88# .
(88. /
CancellationToken88/ @
ct88A C
=88D E
default88F M
)88M N
{99 	
return:: 
await:: 
_entity::  
.::  !
ToListAsync::! ,
(::, -
)::- .
;::. /
};; 	
public== 
async== 
Task== 
<== 
T== 
>== 
GetByIdAsync== )
(==) *
long==* .
id==/ 1
,==1 2
CancellationToken==3 D
ct==E G
===H I
default==J Q
)==Q R
=>==S U
await==V [
_entity==\ c
.==c d
	FindAsync==d m
(==m n
id==n p
)==p q
;==q r
}>> 
}?? ƒ
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