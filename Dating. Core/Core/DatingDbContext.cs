using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Dating.Domain.UserInfo;

using Microsoft.EntityFrameworkCore;
namespace Dating._Core.Core
{
    public class DatingDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DatingDbContext()
        {

        }
        public DatingDbContext(DbContextOptions<DatingDbContext> options) : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>(u =>
            {
                u.ToTable(t => t.HasComment("User information"));
                u.HasKey(u => u.Id);
                u.Property(u => u.UserName)
                .HasComment("User name")
                .IsRequired()
                .HasMaxLength(20);

            });
            base.OnModelCreating(modelBuilder);
        }
        override protected void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // var configuration = new ConfigurationBuilder()
            //   .SetBasePath(Directory.GetCurrentDirectory())
            //   .AddJsonFile("appsettings.json")
            //   .Build();

            // // Get connection string from configuration
            // var connectionString = configuration.GetConnectionString("DefaultConnection");
            base.OnConfiguring(optionsBuilder);
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySql("Server=localhost;Database=datingapp;User=root;Password=123456", new MySqlServerVersion(new Version(8, 0, 21)));
            }
        }
    }
}
