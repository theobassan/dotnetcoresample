
using System.Threading.Tasks;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using System;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.Repository.Interfaces;
using DotNetCoreSample.BusinessFacade.Interfaces;
using Microsoft.Extensions.Logging;

namespace DotNetCoreSample.BusinessFacade.Implementations
{ 
    public class UserBusinessFacade : BusinessFacade<User>, IUserBusinessFacade
    { 
        public UserBusinessFacade(IUserRepository repository, ILogger<UserBusinessFacade> logger) : base(repository, logger) { }


        override public async Task<List<User>> GetAllAsync(CancellationToken ct = default) 
        {
            //_logger.LogWarning("WARNING");
            //throw new Exception("ERROR");

            return await base.GetAllAsync(ct);
        }
    }
}