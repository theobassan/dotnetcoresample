using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCore.Base.DomainModel;
using DotNetCore.Base.Repository;
using Microsoft.Extensions.Logging;

namespace DotNetCore.Base.BusinessFacade
{
    public class BusinessFacade<T> : IBusinessFacade<T> where T : BaseModel
    {
        private readonly IRepository<T> _repository;
        public readonly ILogger _logger;

        public BusinessFacade(IRepository<T> repository, ILogger<BusinessFacade<T>> logger)
        {
            _repository = repository;
            _logger = logger;
        }

        public virtual async Task<List<T>> GetAllAsync(CancellationToken ct = default)
        {
            return await _repository.GetAllAsync(ct);
        }

        public virtual async Task<T> GetByIdAsync(long id, CancellationToken ct = default) => await _repository.GetByIdAsync(id, ct);

        public virtual async Task<T> AddAsync(T t, CancellationToken ct = default) => await _repository.AddAsync(t, ct);

        public virtual async Task<T> UpdateAsync(T t, CancellationToken ct = default) => await _repository.UpdateAsync(t, ct);

        public virtual async Task<bool> DeleteAsync(T t, CancellationToken ct = default) => await _repository.DeleteAsync(t, ct);
    }
}