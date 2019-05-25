using System;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Implementations;
using Microsoft.EntityFrameworkCore;
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
                Id = 2,
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
                Id = 3,
                Name = "Test",
                Email = "test@test.com"
            };

            await _repository.AddAsync(user);
            var users = await _repository.GetAllAsync();

            Assert.NotEmpty(users);
        }

        [Fact]
        public async Task GetByIdAsync()
        {
            var user = new User
            {
                Id = 4,
                Name = "Test",
                Email = "test@test.com"
            };

            await _repository.AddAsync(user);

            var id = 4;
            var userGetById = await _repository.GetByIdAsync(id);

            Assert.Equal(id, userGetById.Id);
        }

        [Fact]
        public async Task UpdateAsync()
        {
            var user = new User
            {
                Id = 5,
                Name = "Test",
                Email = "test@test.com"
            };

            var userAdded = await _repository.AddAsync(user);

            userAdded.Name = "Test Update";

            await _repository.UpdateAsync(user);

            var id = 5;
            var userUpdated = await _repository.GetByIdAsync(id);

            Assert.Equal(userUpdated.Name, userAdded.Name);
        }

        [Fact]
        public async Task DeleteAsync()
        {
            var user = new User
            {
                Id = 6,
                Name = "Test",
                Email = "test@test.com"
            };

            await _repository.AddAsync(user);

            var deleted = await _repository.DeleteAsync(user);

            Assert.True(deleted);

            var userUpdated = await _repository.GetByIdAsync(user.Id);

            Assert.Null(userUpdated);
        }
    }
}