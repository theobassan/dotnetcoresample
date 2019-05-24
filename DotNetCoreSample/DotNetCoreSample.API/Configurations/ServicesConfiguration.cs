using DotNetCoreSample.BusinessFacade.Implementations;
using DotNetCoreSample.BusinessFacade.Interfaces;
using DotNetCoreSample.Repository.Implementations;
using DotNetCoreSample.Repository.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;

namespace DotNetCoreSample.API.Configurations
{
    public static class ServicesConfiguration
    {
        public static IServiceCollection ConfigureRepositories(this IServiceCollection services)
        {
            //services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped(typeof(IUserRepository), typeof(UserRepository));

            return services;
        }

        public static IServiceCollection ConfigureBusiness(this IServiceCollection services)
        {

            //services.AddScoped(typeof(IBusinessFacade<>), typeof(BusinessFacade<>));
            services.AddScoped(typeof(IUserBusinessFacade), typeof(UserBusinessFacade));

            return services;
        }

        public static IServiceCollection AddMiddleware(this IServiceCollection services)
        {
            services.AddMvc().AddJsonOptions(options =>
            {
                options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            });

            return services;
        }

        public static IServiceCollection AddCorsConfiguration(this IServiceCollection services) =>
            services.AddCors(options =>
            {
                options.AddPolicy("AllowAll", new Microsoft.AspNetCore.Cors.Infrastructure.CorsPolicyBuilder()
                    .AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowAnyOrigin()
                    .AllowCredentials()
                    .Build());
            });
    }
}