using Application.Core.Interfaces;
using Application.Core.Services;
using Application.Infrastructure;
using Application.Infrastructure.Services;
using Classified.Interfaces;
using Classified.Services;
using PetaPoco;
using SimpleInjector;
namespace Classified.App_Start
{
    public class RegisterDependency
    {
        public static void InitializeContainer(Container container)
        {
            //var database = DatabaseConfiguration.Build().UsingConnectionStringName("AppConnection").Create();

            // Register your types, for instance using the scoped lifestyle:
            container.Register<IAdService, AdService>(Lifestyle.Scoped);
            container.Register<IOfferService, OfferService>(Lifestyle.Scoped);
            container.Register<IPersonService, PersonService>(Lifestyle.Scoped);
            container.Register<IReportService, ReportService>(Lifestyle.Scoped);
            container.Register<IAdViewModelService, AdViewModelService>(Lifestyle.Scoped);
            container.Register<IPersonRepository, PersonRepository>(Lifestyle.Scoped);
            container.Register<IAdRepository, AdRepository>(Lifestyle.Scoped);
            container.Register<IOfferRepository, OfferRepository>(Lifestyle.Scoped);
            container.Register<IReportRepository, ReportRepository>(Lifestyle.Scoped);
            container.Register(() => DatabaseConfiguration.Build()
                    .UsingConnectionStringName("AppConnection")
                    .Create(), Lifestyle.Scoped);

            // container.RegisterSingleton<Database>(() => new Database("AppConnection"));

        }
    }
}