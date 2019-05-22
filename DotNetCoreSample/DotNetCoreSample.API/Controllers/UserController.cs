
using System.Threading.Tasks;
using System.Threading;
using System.Collections.Generic;
using System.Linq;
using DotNetCoreSample.BusinessFacade.Interfaces;
using DotNetCoreSample.DomainModel.Entities;
using Microsoft.AspNetCore.Mvc;

namespace DotNetCoreSample.API.Controllers
{
    public class UserController : Controller<User>
    { 
        public UserController(IBusinessFacade<User> businessfacade) : base(businessfacade) { }
    }
}