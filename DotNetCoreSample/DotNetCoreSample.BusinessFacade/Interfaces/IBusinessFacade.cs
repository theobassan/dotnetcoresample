using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel.Entities;

namespace DotNetCoreSample.BusinessFacade.Interfaces
{
    public interface IBusinessFacade<T> where T : BaseModel
    {
        Task<List<T>> GetAllAsync(CancellationToken ct = default);
        Task<T> GetByIdAsync(long id, CancellationToken ct = default);
        Task<T> AddAsync(T t, CancellationToken ct = default);
        Task<T> UpdateAsync(T t, CancellationToken ct = default);
        Task DeleteAsync(T t, CancellationToken ct = default);
    }
}