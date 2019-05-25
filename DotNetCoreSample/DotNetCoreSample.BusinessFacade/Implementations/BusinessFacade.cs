using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.BusinessFacade.Interfaces;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Interfaces;
using Microsoft.Extensions.Logging;

namespace DotNetCoreSample.BusinessFacade.Implementations
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

        public async Task<T> GetByIdAsync(long id, CancellationToken ct = default) => await _repository.GetByIdAsync(id, ct);

        public async Task<T> AddAsync(T t, CancellationToken ct = default) => await _repository.AddAsync(t, ct);

        public async Task<T> UpdateAsync(T t, CancellationToken ct = default) => await _repository.UpdateAsync(t, ct);

        public async Task DeleteAsync(T t, CancellationToken ct = default) => await _repository.DeleteAsync(t, ct);
    }
}