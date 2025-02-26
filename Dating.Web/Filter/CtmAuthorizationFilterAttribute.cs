using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Dating.Web.Filter
{
    public class CtmAuthorizationFilterAttribute : Attribute, IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var user = context.HttpContext.User;
            if (user == null)
            {
                context.Result = new UnauthorizedResult();
                return;
            }
            var claimIdentity = user.Identity as ClaimsIdentity;

            if (claimIdentity != null)
            {
                foreach (var claim in claimIdentity.Claims)
                {
                    if (claim.Type == "CustomerNo")
                    {
                        context.HttpContext.Items.Add("CustomerNo", claim.Value);
                    }
                    Console.WriteLine(claim.Value);
                }
            }
        }
    }
}