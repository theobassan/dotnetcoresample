using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCore.Base.DomainModel;
using DotNetCore.Base.Repository;

namespace DotNetCore.Base.MockData
{
    public class Repository<T> : IRepository<T> where T : BaseModel
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

        public virtual Task<List<T>> GetAllAsync(CancellationToken ct = default)
        {
            var t = (T)Activator.CreateInstance(typeof(T));
            t.Id = 1;

            return t.AsListTask();
        }

        public virtual Task<T> GetByIdAsync(long id, CancellationToken ct = default)
        {
            var t = (T)Activator.CreateInstance(typeof(T));
            t.Id = 1;

            return t.AsTask();
        }

        public virtual Task<T> AddAsync(T t, CancellationToken ct = default)
        {
            return t.AsTask();
        }

        public virtual Task<T> UpdateAsync(T t, CancellationToken ct = default) => t.AsTask();

        public virtual Task<bool> DeleteAsync(T t, CancellationToken ct = default) => Task.FromResult(true);
    }
}