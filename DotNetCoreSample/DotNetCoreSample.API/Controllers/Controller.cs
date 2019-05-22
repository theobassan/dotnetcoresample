using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Threading;
using Newtonsoft.Json;
using System.Diagnostics;
using DotNetCoreSample.BusinessFacade.Interfaces;
using DotNetCoreSample.DomainModel.Entities;

namespace DotNetCoreSample.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Controller<T> : ControllerBase where T : BaseModel
    {
        private readonly IBusinessFacade<T> _businessfacade;

        public Controller(IBusinessFacade<T> businessfacade)
        {
            _businessfacade = businessfacade;
        }

        [HttpGet]
        public async Task<ActionResult<List<T>>> Get(CancellationToken ct = default)
        {
            try
            {
                return new ObjectResult(await _businessfacade.GetAllAsync(ct));
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<T>> Get(long id, CancellationToken ct = default)
        {
            try
            {
                var album = await _businessfacade.GetByIdAsync(id, ct);
                if (album == null)
                {
                    return NotFound();
                }

                return Ok(album);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }

        [HttpPost]
        public async Task<ActionResult<T>> Post([FromBody] T input,
            CancellationToken ct = default)
        {
            try
            {
                if (input == null)
                    return BadRequest();

                return StatusCode(201, await _businessfacade.AddAsync(input, ct));
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }

        [HttpPut]
        public async Task<ActionResult<T>> Put([FromBody] T input,
            CancellationToken ct = default)
        {
            try
            {
                if (input == null)
                    return BadRequest();
                if (await _businessfacade.GetByIdAsync(input.Id, ct) == null)
                    return NotFound();
                if (await _businessfacade.UpdateAsync(input, ct))
                    return Ok(input);
                
                return StatusCode(500);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return StatusCode(500, ex);
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteAsync(long id, CancellationToken ct = default)
        {
            try
            {
                if (await _businessfacade.GetByIdAsync(id, ct) == null)
                {
                    return NotFound();
                }

                if (await _businessfacade.DeleteAsync(id, ct))
                {
                    return Ok();
                }

                return StatusCode(500);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }
    }
}
