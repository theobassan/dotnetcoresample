using DotNetCoreSample.DomainModel;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace DotNetCoreSample.API.Configurations
{
    public static class ConfigureConnections
    {
        public static IServiceCollection AddConnectionProvider(this IServiceCollection services,
            IConfiguration configuration)
        {
            string connection = configuration.GetConnectionString("DotNetCoreSample") ?? "DotNetCoreSample";

            services.AddDbContext<InMemoryDbContext>(opt =>
                opt.UseInMemoryDatabase(connection).UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking));

            return services;
        }
    }
}