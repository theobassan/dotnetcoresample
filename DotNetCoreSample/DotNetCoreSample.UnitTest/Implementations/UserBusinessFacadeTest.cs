using System;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.MockData.Implementations;
using Microsoft.Extensions.Logging.Abstractions;
using DotNetCore.Base.UnitTest;
using Xunit;

namespace DotNetCoreSample.UnitTest.Implementations
{
    public class UserBusinessFacadeTest : BusinessFacadeTest<User>
    {
        public UserBusinessFacadeTest() : base() { }
    }
}