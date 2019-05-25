using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.DomainModel;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace DotNetCoreSample.Repository.Implementations
{
    public class Repository<T> : IRepository<T> where T : BaseModel
    {
        private readonly InMemoryDbContext _context;
        private readonly DbSet<T> _entity;
        public readonly ILogger _logger;

        public Repository(InMemoryDbContext context, ILogger<Repository<T>> logger)
        {
            _context = context;
            _entity = _context.Set<T>();
            _logger = logger;
        }


        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing) => _context.Dispose();

        public virtual async Task<T> AddAsync(T t, CancellationToken ct = default)
        {
            _entity.Add(t);
            await _context.SaveChangesAsync();
            return t;
        }

        public virtual async Task<T> UpdateAsync(T t, CancellationToken ct = default)
        {
            _context.Entry(t).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return t;
        }

        public virtual async Task<bool> DeleteAsync(T t, CancellationToken ct = default)
        {
            _entity.Remove(t);
            await _context.SaveChangesAsync();

            return true;
        }

        public virtual async Task<List<T>> GetAllAsync(CancellationToken ct = default)
        {
            return await _entity.ToListAsync();
        }

        public virtual async Task<T> GetByIdAsync(long id, CancellationToken ct = default) => await _entity.FindAsync(id);
    }
}