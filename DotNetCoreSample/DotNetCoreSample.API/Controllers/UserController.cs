using DotNetCoreSample.BusinessFacade.Interfaces;
using DotNetCoreSample.DomainModel.Entities;
using Microsoft.Extensions.Logging;

namespace DotNetCoreSample.API.Controllers
{
    public class UserController : Controller<User>
    {
        public UserController(IUserBusinessFacade businessfacade, ILogger<UserController> logger) : base(businessfacade, logger) { }
    }
}