using Microsoft.EntityFrameworkCore;
using Dating.Core.Core;
using Dating.Core.Repository;
using Dating.Service.CustomerApp;
using Dating.Extension;
using Dating.Service;
using Dating.Common.TokenModule.Model;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDbContext<DatingDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("SqlServerConnection"));
});
#region 增加跨域请求配置
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowSpecificOrigins", builder =>
    {
        builder.WithOrigins("https://localhost:8080", "http://localhost:8080")
               .AllowAnyHeader()
               .AllowAnyMethod();
    });
});
#endregion
#region Jwt验证
var token = builder.Configuration.GetSection("Jwt").Get<JwtTokenModel>();
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
.AddJwtBearer(opt =>
{
    opt.RequireHttpsMetadata = false;
    opt.SaveToken = true;
    opt.TokenValidationParameters = new()
    {
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(token.Security)),
        ValidIssuer = token.Issuer,
        ValidAudience = token.Audience,
    };
    opt.Events = new JwtBearerEvents
    {
        OnAuthenticationFailed = context =>
        {

            context.NoResult();
            context.Response.StatusCode = 401;
            context.Response.ContentType = "application/json";
            return Task.CompletedTask;
        },
        OnChallenge = context =>
        {
            context.HandleResponse();
            context.Response.StatusCode = 401;

            context.Response.ContentType = "application/json";
            context.Response.WriteAsJsonAsync(new
            {
                code = 401,
                message = "未授权或授权过期"
            });
            return Task.CompletedTask;
        },
        OnTokenValidated = context =>
        {
            return Task.CompletedTask;
        }
    };
});
#endregion
builder.Services.AddControllers();
#region Swagger配置
builder.Services.AddSwaggerGen(opt =>
{
    opt.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
    {
        Title = "Dating API",
        Version = "v1",
        Description = "Dating API"
    });
    //添加安全配置
    opt.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Description = "格式:Bearer {token}",
        Name = "Authorization",
        In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey,
        BearerFormat = "JWT",
        Scheme = "Bearer"
    });
    //添加安全要求
    opt.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            new string[] {}
        }
    });
});
#endregion
builder.Services.RepositoryRegister();
builder.Services.ServiceRegister();
builder.Services.AddAutoMapper(typeof(DatingPlatformProfile));
builder.Services.AddTransient<ICustomerService, CustomerService>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors("AllowSpecificOrigins");
app.UseHttpsRedirection();
app.UseRouting();
app.MapControllers();
app.UseAuthentication();
app.UseAuthorization();
app.Run();


