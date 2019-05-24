using System.Threading.Tasks;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Implementations;
using DotNetCoreSample.BusinessFacade.Implementations;
using Xunit;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;
using JetBrains.dotMemoryUnit;

namespace DotNetCoreSample.IntegrationTest.Repository
{
    public class UserRepositoryTest : IDisposable
    {
        private readonly InMemoryDbContext _context;

        private readonly UserBusinessFacade _businessfacade;

        public UserRepositoryTest()
        {
            var options = new DbContextOptionsBuilder<InMemoryDbContext>()
                .UseInMemoryDatabase(databaseName: "DotNetCoreSampleTest")
                .Options;

            _context = new InMemoryDbContext(options);
            var rlogger = new NullLogger<UserRepository>();
            var repository = new UserRepository(_context, rlogger);


            var blogger = new NullLogger<UserBusinessFacade>();
            _businessfacade = new UserBusinessFacade(repository, blogger);
        }

        public void Dispose() => _context.Dispose();

        [Fact]
        [DotMemoryUnit(SavingStrategy = SavingStrategy.OnCheckFail, Directory = @"C:\tmp\Method")]
        public void AddAsync()
        {
            var isolator = new Action(async () =>
            {
                var user =  new User {
                    Id = 1,
                    Name = "Test",
                    Email = "test@test.com"
                };

                await _businessfacade.AddAsync(user);
            });

            isolator();

            GC.Collect();

            dotMemory.Check(memory => 
                Assert.Equal(0, memory.GetObjects(where =>
                    where.LeakedOnEventHandler()).ObjectsCount));
        }

        [Fact]
        public void GetAllAsync()
        {
            var isolator = new Action(async () =>
            {
                var user =  new User {
                    Id = 1,
                    Name = "Test",
                    Email = "test@test.com"
                };

                await _businessfacade.GetAllAsync();
            });

            isolator();

            GC.Collect();

            dotMemory.Check(memory => 
                Assert.Equal(0, memory.GetObjects(where =>
                    where.LeakedOnEventHandler()).ObjectsCount));
        }
        
        [Fact]
        public void GetByIdAsync()
        {
            var isolator = new Action(async () =>
            {
                var id = 1;
                await _businessfacade.GetByIdAsync(id);
            });

            isolator();

            dotMemory.Check(memory => 
                Assert.Equal(0, memory.GetObjects(where =>
                    where.LeakedOnEventHandler()).ObjectsCount));
        }

        [Fact]
        public void UpdateAsync()
        {
            var isolator = new Action(async () =>
            {
                var user =  new User {
                    Id = 1,
                    Name = "Test",
                    Email = "test@test.com"
                };

                await _businessfacade.UpdateAsync(user);
            });

            isolator();

            dotMemory.Check(memory => 
                Assert.Equal(0, memory.GetObjects(where =>
                    where.LeakedOnEventHandler()).ObjectsCount));
        }

        [Fact]
        public void DeleteAsync()
        {
            var isolator = new Action(async () =>
            {
                var id = 1;
                await _businessfacade.DeleteAsync(id);
            });

            isolator();

            dotMemory.Check(memory => 
                Assert.Equal(0, memory.GetObjects(where =>
                    where.LeakedOnEventHandler()).ObjectsCount));
        }
    }
}