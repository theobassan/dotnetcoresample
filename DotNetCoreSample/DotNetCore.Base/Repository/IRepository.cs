using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCore.Base.DomainModel;

namespace DotNetCore.Base.Repository
{
    public interface IRepository<T> : IDisposable where T : BaseModel
    {
        Task<List<T>> GetAllAsync(CancellationToken ct = default);
        Task<T> GetByIdAsync(long id, CancellationToken ct = default);
        Task<T> AddAsync(T t, CancellationToken ct = default);
        Task<T> UpdateAsync(T t, CancellationToken ct = default);
        Task<bool> DeleteAsync(T t, CancellationToken ct = default);
    }
}