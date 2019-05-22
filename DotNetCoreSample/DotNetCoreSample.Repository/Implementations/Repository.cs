using System.Threading.Tasks;
using System.Threading;
using System;
using System.Collections.Generic;
using System.Linq;
using DotNetCoreSample.Repository.Interfaces;
using DotNetCoreSample.DomainModel.Entities;
using DotNetCoreSample.DomainModel;
using Microsoft.EntityFrameworkCore;

namespace DotNetCoreSample.Repository.Implementations
{
    public class Repository<T> : IRepository<T> where T : BaseModel
    {
        private readonly InMemoryDbContext _context;
        private readonly DbSet<T> _entity;

        public Repository(InMemoryDbContext context)
        {
            _context = context;
            _entity = _context.Set<T>();
        }

        public void Dispose() => _context.Dispose();
       
        public async Task<List<T>> GetAllAsync(CancellationToken ct = default) 
            => await _entity.ToListAsync();

        public async Task<T> GetByIdAsync(long id, CancellationToken ct = default)
            => await _entity.FindAsync(id);

        public async Task<T> AddAsync(T t, CancellationToken ct = default)
        {
            _entity.Add(t);
            await _context.SaveChangesAsync();
            return t;
        }

        public async Task<bool> UpdateAsync(T t, CancellationToken ct = default)
        {
            _context.Entry(t).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return true;
        }

        public async Task<bool> DeleteAsync(long id, CancellationToken ct = default)
        {
            var t = await _entity.FindAsync(id);
            if (t == null)
            {
                return false;
            }

            _entity.Remove(t);
            await _context.SaveChangesAsync();

            return true;
        }
    }
}