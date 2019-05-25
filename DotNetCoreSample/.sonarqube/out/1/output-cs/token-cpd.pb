”'
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
<** 
T** 
>** 
UpdateAsync** (
(**( )
T**) *
t**+ ,
,**, -
CancellationToken**. ?
ct**@ B
=**C D
default**E L
)**L M
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
return// 
t// 
;// 
}00 	
public22 
async22 
Task22 
<22 
bool22 
>22 
DeleteAsync22  +
(22+ ,
T22, -
t22. /
,22/ 0
CancellationToken221 B
ct22C E
=22F G
default22H O
)22O P
{33 	
_entity44 
.44 
Remove44 
(44 
t44 
)44 
;44 
await55 
_context55 
.55 
SaveChangesAsync55 +
(55+ ,
)55, -
;55- .
return77 
true77 
;77 
}88 	
public:: 
async:: 
Task:: 
<:: 
List:: 
<:: 
T::  
>::  !
>::! "
GetAllAsync::# .
(::. /
CancellationToken::/ @
ct::A C
=::D E
default::F M
)::M N
{;; 	
return<< 
await<< 
_entity<<  
.<<  !
ToListAsync<<! ,
(<<, -
)<<- .
;<<. /
}== 	
public?? 
async?? 
Task?? 
<?? 
T?? 
>?? 
GetByIdAsync?? )
(??) *
long??* .
id??/ 1
,??1 2
CancellationToken??3 D
ct??E G
=??H I
default??J Q
)??Q R
=>??S U
await??V [
_entity??\ c
.??c d
	FindAsync??d m
(??m n
id??n p
)??p q
;??q r
}@@ 
}AA ƒ
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
} ©
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
< 
T 
> 
UpdateAsync 
( 
T 
t 
,  
CancellationToken! 2
ct3 5
=6 7
default8 ?
)? @
;@ A
Task 
< 
bool 
> 
DeleteAsync 
( 
T  
t! "
," #
CancellationToken$ 5
ct6 8
=9 :
default; B
)B C
;C D
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