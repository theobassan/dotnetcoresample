using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Serilog;
using Serilog.Configuration;
using Serilog.Core;
using Serilog.Events;
using Serilog.Settings.Configuration;

namespace DotNetCoreSample.API
{
    class CallerEnricher : ILogEventEnricher
    {
        // TODO GET LINE
        public void Enrich(LogEvent logEvent, ILogEventPropertyFactory propertyFactory)
        {
            var skip = 3;
            while (true)
            {
                var stack = new StackFrame(skip, true);
                if (!stack.HasMethod())
                {
                    return;
                }

                var method = stack.GetMethod();
                if (method.DeclaringType.Assembly != typeof(Log).Assembly && method.DeclaringType.Assembly != typeof(Serilog.Extensions.Logging.SerilogLoggerProvider).Assembly && method.DeclaringType.Assembly != typeof(Microsoft.Extensions.Logging.LoggerExternalScopeProvider).Assembly)
                {

                    var caller = $"{stack.GetFileLineNumber()}";
                    logEvent.AddPropertyIfAbsent(new LogEventProperty("Line", new ScalarValue(caller)));
                    return;
                }

                skip++;
            }
        }
    }

    public class Program
    {
        public static void Main(string[] args) => CreateWebHostBuilder(args).Build().Run();

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
            .UseSerilog((hostingContext, loggerConfiguration) => loggerConfiguration
                .ReadFrom.Configuration(hostingContext.Configuration)
                .Enrich.FromLogContext()
                .Enrich.With(new CallerEnricher()))
            .UseStartup<Startup>();
    }
}