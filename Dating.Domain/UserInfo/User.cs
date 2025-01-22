using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dating.Domain.UserInfo
{
    public class User : BaseEntity
    {
        public new int Id { get; set; }
        public string? UserName { get; set; }
    }
}
