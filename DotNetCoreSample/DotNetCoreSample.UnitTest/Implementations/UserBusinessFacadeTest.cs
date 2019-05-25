using System;
using System.Threading.Tasks;
using DotNetCoreSample.BusinessFacade.Interfaces;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.MockData.Implementations;
using Microsoft.Extensions.Logging.Abstractions;
using Xunit;

namespace DotNetCoreSample.UnitTest.Implementations
{
    public class UserBusinessFacadeTest : BusinessFacadeTest<User>
    {
        public UserBusinessFacadeTest() : base() { }
    }
}