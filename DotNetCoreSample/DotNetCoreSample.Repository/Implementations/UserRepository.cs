
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.DomainModel;
using Microsoft.Extensions.Logging;
using DotNetCoreSample.Repository.Interfaces;

namespace DotNetCoreSample.Repository.Implementations
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        public UserRepository(InMemoryDbContext context, ILogger<UserRepository> logger) : base(context, logger) { }
    }
}