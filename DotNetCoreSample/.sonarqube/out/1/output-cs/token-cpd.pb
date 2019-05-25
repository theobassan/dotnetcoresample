®
d/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.DomainModel/Entities/User.cs
	namespace 	
DotNetCoreSample
 
. 
DomainModel &
.& '
Entities' /
{ 
public 

class 
User 
: 
	BaseModel !
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
}		 
}

 ã
h/Projetos/theobassan/dotnetcoresample/DotNetCoreSample/DotNetCoreSample.DomainModel/InMemoryDbContext.cs
	namespace 	
DotNetCoreSample
 
. 
DomainModel &
{ 
public 

class 
InMemoryDbContext "
:# $
	DbContext% .
{ 
public 
InMemoryDbContext  
(  !
DbContextOptions! 1
<1 2
InMemoryDbContext2 C
>C D
optionsE L
)L M
:N O
baseP T
(T U
optionsU \
)\ ]
{^ _
}` a
public

 
DbSet

 
<

 
User

 
>

 
User

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
} 
} 