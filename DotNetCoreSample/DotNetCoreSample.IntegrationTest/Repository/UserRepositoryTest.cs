using System;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Implementations;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using Xunit;

namespace DotNetCoreSample.IntegrationTest.Repository
{
    public class UserRepositoryTest : IDisposable
    {
        private readonly InMemoryDbContext _context;
        private readonly UserRepository _repository;

        public UserRepositoryTest()
        {
            var options = new DbContextOptionsBuilder<InMemoryDbContext>()
                .UseInMemoryDatabase(databaseName: "DotNetCoreSampleTest")
                .Options;

            _context = new InMemoryDbContext(options);
            var logger = new NullLogger<UserRepository>();
            _repository = new UserRepository(_context, logger);
        }

        public void Dispose() => _context.Dispose();

        [Fact]
        public async Task AddAsync()
        {
            var user = new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            var userAdded = await _repository.AddAsync(user);

            Assert.True(userAdded.Id == user.Id && userAdded.Name == user.Name && userAdded.Email == user.Email);
        }

        [Fact]
        public async Task GetAllAsync()
        {
            var user = new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            await _repository.AddAsync(user);
            var users = await _repository.GetAllAsync();

            Assert.Single(users);
        }

        [Fact]
        public async Task GetByIdAsync()
        {
            var user = new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            await _repository.AddAsync(user);

            var id = 1;
            var userGetById = await _repository.GetByIdAsync(id);

            Assert.Equal(id, userGetById.Id);
        }

        [Fact]
        public async Task UpdateAsync()
        {
            var user = new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            var userAdded = await _repository.AddAsync(user);

            userAdded.Name = "Test Update";

            var updated = await _repository.UpdateAsync(user);

            Assert.True(updated);

            var id = 1;
            var userUpdated = await _repository.GetByIdAsync(id);

            Assert.Equal(userUpdated.Name, userAdded.Name);
        }

        [Fact]
        public async Task DeleteAsync()
        {
            var user = new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            await _repository.AddAsync(user);

            var id = 1;
            var deleted = await _repository.DeleteAsync(id);

            Assert.True(deleted);

            var userUpdated = await _repository.GetByIdAsync(id);

            Assert.Null(userUpdated);
        }
    }
}