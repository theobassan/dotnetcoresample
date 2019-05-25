using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Interfaces;

namespace DotNetCoreSample.MockData.Implementations
{
    public class UserRepository : IUserRepository
    {
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        // Needed for IRepository
        protected virtual void Dispose(bool disposing)
        {
            // Cleanup
        }

        public Task<List<User>> GetAllAsync(CancellationToken ct = default)
        {
            var user = new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            return user.AsListTask();
        }

        public Task<User> GetByIdAsync(long id, CancellationToken ct = default)
        {
            var user = new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            };

            return user.AsTask();
        }

        public Task<User> AddAsync(User t, CancellationToken ct = default)
        {
            return t.AsTask();
        }

        public Task<User> UpdateAsync(User t, CancellationToken ct = default) => t.AsTask();

        public Task<bool> DeleteAsync(long id, CancellationToken ct = default) => Task.FromResult(true);
    }
}