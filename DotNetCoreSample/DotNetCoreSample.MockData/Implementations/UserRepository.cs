using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Interfaces;

namespace DotNetCoreSample.MockData.Implementations
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        public UserRepository() : base() { }
    }
}