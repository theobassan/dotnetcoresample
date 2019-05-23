
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.Repository.Interfaces;
using Microsoft.Extensions.Logging;

namespace DotNetCoreSample.Repository.Implementations
{
    public class UserRepository : Repository<User>, IUserRepository
    { 
        public UserRepository(InMemoryDbContext context, ILogger<UserRepository> logger) : base(context, logger) { }
    }
}