ƒ
t/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.Repository/Implementations/UserRepository.cs
	namespace 	
DotNetCoreSample
 
. 

Repository %
.% &
Implementations& 5
{ 
public		 

class		 
UserRepository		 
:		  !

Repository		" ,
<		, -
User		- 1
>		1 2
,		2 3
IUserRepository		4 C
{

 
public 
UserRepository 
( 
InMemoryDbContext /
context0 7
,7 8
ILogger9 @
<@ A
UserRepositoryA O
>O P
loggerQ W
)W X
:Y Z
base[ _
(_ `
context` g
,g h
loggeri o
)o p
{q r
}s t
} 
} Ë
p/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.Repository/Interfaces/IUserRepository.cs
	namespace 	
DotNetCoreSample
 
. 

Repository %
.% &

Interfaces& 0
{ 
public 

	interface 
IUserRepository $
:% &
IRepository' 2
<2 3
User3 7
>7 8
{9 :
}; <
} 