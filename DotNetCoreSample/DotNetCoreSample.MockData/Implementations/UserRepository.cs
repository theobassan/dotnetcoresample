using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Interfaces;
using Microsoft.Extensions.Logging;

namespace DotNetCoreSample.MockData.Implementations
{
    public class UserRepository : IUserRepository
    {
        public void Dispose() { }

        public Task<List<User>> GetAllAsync(CancellationToken ct = default)
            => new User
            {
                Id = 1,
                Name = "Test",
                Email = "test@test.com"
            }.AsListTask();

        public Task<User> GetByIdAsync(long id, CancellationToken ct = default) => new User
            {
                Id = id,
                Name = "Test",
                Email = "test@test.com"
            }.AsTask();

        public Task<User> AddAsync(User t, CancellationToken ct = default)
        {
            return t.AsTask();
        }

        public Task<bool> UpdateAsync(User album, CancellationToken ct = default) => Task.FromResult(true);

        public Task<bool> DeleteAsync(long id, CancellationToken ct = default) => Task.FromResult(true);
    }
}