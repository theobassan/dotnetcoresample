using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using DotNetCoreSample.BusinessFacade.Interfaces;
using DotNetCoreSample.DomainModel.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace DotNetCoreSample.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Controller<T> : ControllerBase where T : BaseModel
    {
        private readonly IBusinessFacade<T> _businessfacade;
        public readonly ILogger<Controller<T>> _logger;

        public Controller(IBusinessFacade<T> businessfacade, ILogger<Controller<T>> logger)
        {
            _businessfacade = businessfacade;
            _logger = logger;
        }

        [HttpGet]
        public virtual async Task<ActionResult<List<T>>> Get(CancellationToken ct = default)
        {
            return new ObjectResult(await _businessfacade.GetAllAsync(ct));
        }

        [HttpGet("{id}")]
        public virtual async Task<ActionResult<T>> Get(long id, CancellationToken ct = default)
        {
            var t = await _businessfacade.GetByIdAsync(id, ct);
            if (t == null) return NotFound();

            return Ok(t);
        }

        [HttpPost]
        public virtual async Task<ActionResult> Post([FromBody] T input, CancellationToken ct = default)
        {
            if (input == null) return BadRequest();

            await _businessfacade.AddAsync(input, ct);

            return StatusCode(201);
        }

        [HttpPut]
        public virtual async Task<ActionResult> Put([FromBody] T input, CancellationToken ct = default)
        {
            if (input == null) return BadRequest();
            if (await _businessfacade.GetByIdAsync(input.Id, ct) == null) return NotFound();
            
            await _businessfacade.UpdateAsync(input, ct);

            return Ok();
        }

        [HttpDelete("{id}")]
        public virtual async Task<ActionResult> DeleteAsync(long id, CancellationToken ct = default)
        {
            var t = await _businessfacade.GetByIdAsync(id, ct);
            if (t == null) return NotFound();

            await _businessfacade.DeleteAsync(t, ct);

            return Ok();
        }
    }
}