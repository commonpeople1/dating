using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

using Dating.Common.EventBus;
using Dating.Service;
using Dating.Service.CustomerApp;
using Dating.Service.Global;

using Microsoft.Extensions.DependencyInjection;
//using Dating.Domain;

namespace Dating.Extension
{
    public static class ServiceRegisterExtensions
    {
        public static IServiceCollection RepositoryRegister(this IServiceCollection services)
        {
            var asmCore = Assembly.Load(@"Dating.Core");
            var implementationType = asmCore.GetTypes().FirstOrDefault(t => t.Name == "Repository`1");
            var interfaceType = implementationType?.GetInterface("IRepository`1");
            if (interfaceType != null && implementationType != null)
            {
                services.AddTransient(interfaceType.GetGenericTypeDefinition(), implementationType.GetGenericTypeDefinition());
            }

            return services;
        }
        public static IServiceCollection ServiceRegister(this IServiceCollection services)
        {

            var asmCore = Assembly.Load(@"Dating.Service");
            var implementationTypes = asmCore.GetTypes().Where(t => t.IsAssignableTo(typeof(ServiceIocTag)) && !t.IsAbstract && !t.IsInterface);
            foreach (var implementationType in implementationTypes)
            {
                var interfaceType = implementationType?.GetInterfaces().Where(t => t != typeof(ServiceIocTag)).FirstOrDefault();
                if (interfaceType != null && implementationType != null)
                {
                    services.AddTransient(interfaceType, implementationType);
                }
            }
            services.AddScoped(typeof(EventBus));
            return services;
        }
    }
}