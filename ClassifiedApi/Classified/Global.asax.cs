using System.Web.Http;
using CodeRepository.Web;
using System.Web.Optimization;
using System;
using System.Web;
using System.Configuration;
using System.Web.Mvc;

namespace Classified
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

        }


    }
}
