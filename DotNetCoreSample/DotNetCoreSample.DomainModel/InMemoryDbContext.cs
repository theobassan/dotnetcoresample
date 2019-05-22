using Microsoft.EntityFrameworkCore;
using DotNetCoreSample.DomainModel.Entities;

namespace DotNetCoreSample.DomainModel
{
    public class InMemoryDbContext : DbContext
    {
        public InMemoryDbContext(DbContextOptions<InMemoryDbContext> options)
            : base(options)
        {
        }

        public DbSet<User> User { get; set; }
    }
}
