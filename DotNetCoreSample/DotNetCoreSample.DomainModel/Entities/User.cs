using DotNetCore.Base.DomainModel;

namespace DotNetCoreSample.DomainModel.Entities
{
    public class User : BaseModel
    {
        public string Name { get; set; }
        public string Email { get; set; }
    }
}