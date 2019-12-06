using AutoMapper;
namespace Classified
{
    public class AutoMapperConfig
    {
        public static MapperConfiguration InitializeAutoMapper()
        {
            MapperConfiguration config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<ViewModelProfile>();
                cfg.AddProfile<CoreModelProfile>();

            });
            return config;
        }
    }
}