using DotNetCoreSample.DomainModel.Entities;
using DotNetCore.Base.Repository;

namespace DotNetCoreSample.Repository.Interfaces
{
    public interface IUserRepository : IRepository<User> { }
}