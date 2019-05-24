using DotNetCoreSample.DomainModel.Entities;
using Microsoft.EntityFrameworkCore;

namespace DotNetCoreSample.DomainModel
{
    public class InMemoryDbContext : DbContext
    {
        public InMemoryDbContext(DbContextOptions<InMemoryDbContext> options) : base(options) { }

        public DbSet<User> User { get; set; }
    }
}