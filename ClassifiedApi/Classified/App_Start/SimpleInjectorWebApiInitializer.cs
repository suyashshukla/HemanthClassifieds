[assembly: WebActivator.PostApplicationStartMethod(typeof(Classified.App_Start.SimpleInjectorWebApiInitializer), "Initialize")]

namespace Classified.App_Start
{
    using System.Web.Http;
    using SimpleInjector;
    using SimpleInjector.Integration.WebApi;
    using SimpleInjector.Lifestyles;
    
    public static class SimpleInjectorWebApiInitializer
    {
        /// <summary>Initialize the container and register it as Web API Dependency Resolver.</summary>
        public static void Initialize()
        {
            var container = new Container();
            container.Options.DefaultScopedLifestyle = new AsyncScopedLifestyle();
            
            RegisterDependency.InitializeContainer(container);

            var automapper = AutoMapperConfig.InitializeAutoMapper().CreateMapper();
            container.RegisterInstance(automapper);

            container.RegisterWebApiControllers(GlobalConfiguration.Configuration);
       
            container.Verify();
            

            GlobalConfiguration.Configuration.DependencyResolver =
                new SimpleInjectorWebApiDependencyResolver(container);
        }
     
       
    }
}