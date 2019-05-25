using System;
using System.Threading.Tasks;
using DotNetCore.Base.BusinessFacade;
using DotNetCore.Base.DomainModel;
using DotNetCore.Base.MockData;
using Microsoft.Extensions.Logging.Abstractions;
using Xunit;

namespace DotNetCore.Base.UnitTest
{ 
    public class BusinessFacadeTest<T> where T : BaseModel
    {
        private readonly BusinessFacade<T> _businessfacade;

        public BusinessFacadeTest()
        {
            var repository = new Repository<T>();
            var logger = new NullLogger<BusinessFacade<T>>();

            _businessfacade = new BusinessFacade<T>(repository, logger);
        }

        [Fact]
        public virtual async Task AddAsync()
        {
            var t = (T)Activator.CreateInstance(typeof(T));
            t.Id = 1;

            var tAdded = await _businessfacade.AddAsync(t);

            Assert.True(t.Id == tAdded.Id);
        }

        [Fact]
        public virtual async Task GetAllAsync()
        {
            var ts = await _businessfacade.GetAllAsync();

            Assert.Single(ts);
        }

        [Fact]
        public virtual async Task GetByIdAsync()
        {
            var id = 1;
            var tGetById = await _businessfacade.GetByIdAsync(id);

            Assert.Equal(id, tGetById.Id);
        }

        [Fact]
        public virtual async Task UpdateAsync()
        {
            var t = (T)Activator.CreateInstance(typeof(T));
            t.Id = 1;

            var tUpdated = await _businessfacade.UpdateAsync(t);

            Assert.Equal(t.Id, tUpdated.Id);
        }

        [Fact]
        public virtual async Task DeleteAsync()
        {
            var t = (T)Activator.CreateInstance(typeof(T));
            t.Id = 1;

            var deleted = await _businessfacade.DeleteAsync(t);

            Assert.True(deleted);
        }
    }
}