using Microsoft.AspNetCore.Mvc;
using SocialImpactApp.Data.Models;

namespace SocialImpact.API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {


        private readonly SOCIALIMPACTAPPContext context;


        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            context = context;

        }

        [HttpGet(Name = "GetWeatherForecast")]
        public List<Role> Get()
        {
            var rta = context.Roles.ToList();
            return rta;
        }
    }
}