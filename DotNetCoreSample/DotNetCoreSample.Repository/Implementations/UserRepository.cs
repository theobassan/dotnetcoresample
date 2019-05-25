using DotNetCoreSample.DomainModel;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Interfaces;
using Microsoft.Extensions.Logging;
using DotNetCore.Base.Repository;

namespace DotNetCoreSample.Repository.Implementations
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        public UserRepository(InMemoryDbContext context, ILogger<UserRepository> logger) : base(context, logger) { }
    }
}