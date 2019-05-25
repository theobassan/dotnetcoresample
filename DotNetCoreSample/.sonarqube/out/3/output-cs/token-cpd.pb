π
x/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.BusinessFacade/Implementations/BusinessFacade.cs
	namespace		 	
DotNetCoreSample		
 
.		 
BusinessFacade		 )
.		) *
Implementations		* 9
{

 
public 

class 
BusinessFacade 
<  
T  !
>! "
:# $
IBusinessFacade% 4
<4 5
T5 6
>6 7
where8 =
T> ?
:@ A
	BaseModelB K
{ 
private 
readonly 
IRepository $
<$ %
T% &
>& '
_repository( 3
;3 4
public 
readonly 
ILogger 
_logger  '
;' (
public 
BusinessFacade 
( 
IRepository )
<) *
T* +
>+ ,

repository- 7
,7 8
ILogger9 @
<@ A
BusinessFacadeA O
<O P
TP Q
>Q R
>R S
loggerT Z
)Z [
{ 	
_repository 
= 

repository $
;$ %
_logger 
= 
logger 
; 
} 	
public 
virtual 
async 
Task !
<! "
List" &
<& '
T' (
>( )
>) *
GetAllAsync+ 6
(6 7
CancellationToken7 H
ctI K
=L M
defaultN U
)U V
{ 	
return 
await 
_repository $
.$ %
GetAllAsync% 0
(0 1
ct1 3
)3 4
;4 5
} 	
public 
async 
Task 
< 
T 
> 
GetByIdAsync )
() *
long* .
id/ 1
,1 2
CancellationToken3 D
ctE G
=H I
defaultJ Q
)Q R
=>S U
awaitV [
_repository\ g
.g h
GetByIdAsynch t
(t u
idu w
,w x
cty {
){ |
;| }
public 
async 
Task 
< 
T 
> 
AddAsync %
(% &
T& '
t( )
,) *
CancellationToken+ <
ct= ?
=@ A
defaultB I
)I J
=>K M
awaitN S
_repositoryT _
._ `
AddAsync` h
(h i
ti j
,j k
ctl n
)n o
;o p
public 
async 
Task 
< 
T 
> 
UpdateAsync (
(( )
T) *
t+ ,
,, -
CancellationToken. ?
ct@ B
=C D
defaultE L
)L M
=>N P
awaitQ V
_repositoryW b
.b c
UpdateAsyncc n
(n o
to p
,p q
ctr t
)t u
;u v
public!! 
async!! 
Task!! 
<!! 
bool!! 
>!! 
DeleteAsync!!  +
(!!+ ,
long!!, 0
id!!1 3
,!!3 4
CancellationToken!!5 F
ct!!G I
=!!J K
default!!L S
)!!S T
=>!!U W
await!!X ]
_repository!!^ i
.!!i j
DeleteAsync!!j u
(!!u v
id!!v x
,!!x y
ct!!z |
)!!| }
;!!} ~
}"" 
}## ù
|/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.BusinessFacade/Implementations/UserBusinessFacade.cs
	namespace		 	
DotNetCoreSample		
 
.		 
BusinessFacade		 )
.		) *
Implementations		* 9
{

 
public 

class 
UserBusinessFacade #
:$ %
BusinessFacade& 4
<4 5
User5 9
>9 :
,: ;
IUserBusinessFacade< O
{ 
public 
UserBusinessFacade !
(! "
IUserRepository" 1

repository2 <
,< =
ILogger> E
<E F
UserBusinessFacadeF X
>X Y
loggerZ `
)` a
:b c
based h
(h i

repositoryi s
,s t
loggeru {
){ |
{} ~
}	 Ä
override 
public 
async 
Task "
<" #
List# '
<' (
User( ,
>, -
>- .
GetAllAsync/ :
(: ;
CancellationToken; L
ctM O
=P Q
defaultR Y
)Y Z
{ 	
return 
await 
base 
. 
GetAllAsync )
() *
ct* ,
), -
;- .
} 	
} 
} ï
t/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.BusinessFacade/Interfaces/IBusinessFacade.cs
	namespace 	
DotNetCoreSample
 
. 
BusinessFacade )
.) *

Interfaces* 4
{ 
public 

	interface 
IBusinessFacade $
<$ %
T% &
>& '
where( -
T. /
:0 1
	BaseModel2 ;
{		 
Task

 
<

 
List

 
<

 
T

 
>

 
>

 
GetAllAsync

 !
(

! "
CancellationToken

" 3
ct

4 6
=

7 8
default

9 @
)

@ A
;

A B
Task 
< 
T 
> 
GetByIdAsync 
( 
long !
id" $
,$ %
CancellationToken& 7
ct8 :
=; <
default= D
)D E
;E F
Task 
< 
T 
> 
AddAsync 
( 
T 
t 
, 
CancellationToken /
ct0 2
=3 4
default5 <
)< =
;= >
Task 
< 
T 
> 
UpdateAsync 
( 
T 
t 
,  
CancellationToken! 2
ct3 5
=6 7
default8 ?
)? @
;@ A
Task 
< 
bool 
> 
DeleteAsync 
( 
long #
id$ &
,& '
CancellationToken( 9
ct: <
== >
default? F
)F G
;G H
} 
} ﬂ
x/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.BusinessFacade/Interfaces/IUserBusinessFacade.cs
	namespace 	
DotNetCoreSample
 
. 
BusinessFacade )
.) *

Interfaces* 4
{ 
public 

	interface 
IUserBusinessFacade (
:) *
IBusinessFacade+ :
<: ;
User; ?
>? @
{A B
}C D
} 