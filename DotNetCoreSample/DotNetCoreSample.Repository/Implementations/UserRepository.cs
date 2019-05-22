
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.Repository.Interfaces;

namespace DotNetCoreSample.Repository.Implementations
{
    public class UserRepository : Repository<User>, IUserRepository
    { 
        public UserRepository(InMemoryDbContext context) : base(context) { }
    }
}