using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating._Core.Repository;
using Dating.Domain.UserInfo;

using Microsoft.AspNetCore.Mvc;

namespace Dating.Web
{
    [ApiController]
    [Route("api/[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private readonly ILogger<WeatherForecastController> _logger;
        private readonly IRepository<User> _user;
        public WeatherForecastController(
            ILogger<WeatherForecastController> logger, IRepository<User> user
        )
        {
            this._logger = logger;
            this._user = user;
        }
        [HttpGet]
        public async Task<IEnumerable<User>> Get()
        {
            return await _user.GetListAsync();
        }
    }
}
