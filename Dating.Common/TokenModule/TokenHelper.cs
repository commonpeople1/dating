using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

using Dating.Common.TokenModule.Model;

using Microsoft.IdentityModel.Tokens;

namespace Dating.Common.TokenModule
{
    public static class TokenHelper
    {
        public static string GetToken(JwtTokenModel jwtTokenModel)
        {
            var claim = new[]{
                new Claim("CustomerNo",jwtTokenModel.CustomerNo),
                new Claim("CustomerName",jwtTokenModel.CustomerName),
                new Claim("Id",jwtTokenModel.Id.ToString()),
            };
            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(jwtTokenModel.Security));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var token = new JwtSecurityToken(
                issuer: jwtTokenModel.Issuer,
                audience: jwtTokenModel.Audience,
                claims: claim,
                expires: DateTime.Now.AddMinutes(jwtTokenModel.Expires),
                signingCredentials: creds
            );
            var accessToken = new JwtSecurityTokenHandler().WriteToken(token);
            return accessToken;
        }
    }
}