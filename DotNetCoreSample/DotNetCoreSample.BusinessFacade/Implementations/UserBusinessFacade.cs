
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.Repository.Interfaces;
using DotNetCoreSample.BusinessFacade.Interfaces;

namespace DotNetCoreSample.BusinessFacade.Implementations
{
    public class UserBusinessFacade : BusinessFacade<User>, IUserBusinessFacade
    { 
        public UserBusinessFacade(IRepository<User> repository) : base(repository) { }
    }
}