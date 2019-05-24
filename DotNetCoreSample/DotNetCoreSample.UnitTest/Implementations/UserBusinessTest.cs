using System.Threading.Tasks;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.MockData.Implementations;
using DotNetCoreSample.BusinessFacade.Implementations;
using DotNetCoreSample.Repository.Interfaces;
using Xunit;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;

namespace DotNetCoreSample.UnitTest.Implementations
{
    public class UserBusinessFacadeTest
    {
        private readonly ILogger<UserBusinessFacade> _logger;
        private readonly UserBusinessFacade _businessfacade;

        public UserBusinessFacadeTest()
        {
            var repository = new UserRepository();
            _logger = new NullLogger<UserBusinessFacade>();

            _businessfacade = new UserBusinessFacade(repository, _logger);
        }

        [Fact]
        public async Task AddAsync()
        {
            var user =  new User {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            var userAdded = await _businessfacade.AddAsync(user);

            Assert.True(userAdded.Id == user.Id && userAdded.Name == user.Name && userAdded.Email == user.Email);
        }

        [Fact]
        public async Task GetAllAsync()
        {
            var user =  new User {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            await _businessfacade.AddAsync(user);
            var users = await _businessfacade.GetAllAsync();

            Assert.Single(users);
        }
        
        [Fact]
        public async Task GetByIdAsync()
        {
            var user =  new User {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            await _businessfacade.AddAsync(user);

            var id = 1;
            var userGetById = await _businessfacade.GetByIdAsync(id);

            Assert.Equal(id, userGetById.Id);
        }

        [Fact]
        public async Task UpdateAsync()
        {
            var user =  new User {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            var updated = await _businessfacade.UpdateAsync(user);

            Assert.True(updated);
        }

        [Fact]
        public async Task DeleteAsync()
        {
            var id = 1;
            var deleted = await _businessfacade.DeleteAsync(id);

            Assert.True(deleted);
        }
    }
}