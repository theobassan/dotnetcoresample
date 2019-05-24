using System;
using System.Text;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.TestHost;
using Microsoft.AspNetCore.Hosting;
using DotNetCoreSample.API;
using Xunit;
using DotNetCoreSample.DomainModel.Entities;
using System.Collections.Generic;

namespace DotNetCoreSample.IntegrationTest.API
{
    public class UserControllerTest
    {

        private readonly HttpClient _client;

        public UserControllerTest()
        {
            var server = new TestServer(new WebHostBuilder()
                .UseEnvironment("Development")
                .UseStartup<Startup>());
            _client = server.CreateClient();
        }

        [Fact]
        public async Task AddAsync()
        {
            var user = new User { Id = 1, Name = "Test", Email = "test@test.com" };
            var response = await _client.PostAsync("/api/user/", new JsonContent(user) );
            response.EnsureSuccessStatusCode();

            Assert.Equal(HttpStatusCode.Created, response.StatusCode);
        }

        [Theory]
        [InlineData("GET")]
        public async Task GetAllAsync(string method)
        {
            var user = new User { Id = 1, Name = "Test", Email = "test@test.com" };
            var responseAdd = await _client.PostAsync("/api/user/", new JsonContent(user) );
            responseAdd.EnsureSuccessStatusCode();

            var request = new HttpRequestMessage(new HttpMethod(method), "/api/user/");
            var response = await _client.SendAsync(request);
            response.EnsureSuccessStatusCode();

            Assert.Equal(HttpStatusCode.OK, response.StatusCode);

            var listResponse = await response.Content.ReadAsAsync<List<User>>();

            Assert.Single(listResponse);
        }

        [Theory]
        [InlineData("GET")]
        public async Task GetByIdAsync(string method)
        {
            var user = new User { Id = 1, Name = "Test", Email = "test@test.com" };
            var responseAdd = await _client.PostAsync("/api/user/", new JsonContent(user) );
            responseAdd.EnsureSuccessStatusCode();

            var request = new HttpRequestMessage(new HttpMethod(method), $"/api/user/{user.Id}");
            var response = await _client.SendAsync(request);
            response.EnsureSuccessStatusCode();

            Assert.Equal(HttpStatusCode.OK, response.StatusCode);

            var userResponse = await response.Content.ReadAsAsync<User>();

            Assert.Equal(user.Id, userResponse.Id);
        }

        [Theory]
        [InlineData("GET", 1)]
        public async Task GetByIdNotFoundAsync(string method, long? id = null)
        {
            var request = new HttpRequestMessage(new HttpMethod(method), $"/api/user/{id}");
            var response = await _client.SendAsync(request);

            Assert.Equal(HttpStatusCode.NotFound, response.StatusCode);
        }


        [Fact]
        public async Task UpdateAsync()
        {
            var user = new User { Id = 1, Name = "Test", Email = "test@test.com" };
            var responseAdd = await _client.PostAsync("/api/user/", new JsonContent(user) );
            responseAdd.EnsureSuccessStatusCode();
            
            user.Name = "Test Updated";
            var response = await _client.PutAsync("/api/user/", new JsonContent(user) );
            response.EnsureSuccessStatusCode();

            Assert.Equal(HttpStatusCode.OK, response.StatusCode);

            var requestGetById = new HttpRequestMessage(new HttpMethod("GET"), $"/api/user/{user.Id}");
            var responseGetById = await _client.SendAsync(requestGetById);
            responseGetById.EnsureSuccessStatusCode();

            var userResponse = await responseGetById.Content.ReadAsAsync<User>();

            Assert.Equal(user.Name, userResponse.Name);
        }

        [Fact]
        public async Task DeleteAsync()
        {
            var user = new User { Id = 1, Name = "Test", Email = "test@test.com" };
            var responseAdd = await _client.PostAsync("/api/user/", new JsonContent(user) );
            responseAdd.EnsureSuccessStatusCode();
            
            var response = await _client.DeleteAsync($"/api/user/{user.Id}");
            response.EnsureSuccessStatusCode();

            Assert.Equal(HttpStatusCode.OK, response.StatusCode);

            var requestGetById = new HttpRequestMessage(new HttpMethod("GET"), $"/api/user/{user.Id}");
            var responseGetById = await _client.SendAsync(requestGetById);

            Assert.Equal(HttpStatusCode.NotFound, responseGetById.StatusCode);
        }
    }
}