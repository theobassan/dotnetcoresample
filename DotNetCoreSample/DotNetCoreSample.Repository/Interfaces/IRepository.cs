using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel.Entities;

namespace DotNetCoreSample.Repository.Interfaces
{
    public interface IRepository<T> : IDisposable where T : BaseModel
    {
        Task<List<T>> GetAllAsync(CancellationToken ct = default);
        Task<T> GetByIdAsync(long id, CancellationToken ct = default);
        Task<T> AddAsync(T t, CancellationToken ct = default);
        Task<T> UpdateAsync(T t, CancellationToken ct = default);
        Task<bool> DeleteAsync(long id, CancellationToken ct = default);
    }
}