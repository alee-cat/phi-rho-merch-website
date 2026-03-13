using Microsoft.EntityFrameworkCore;
using MerchWebsiteAPI.Models;

namespace MerchWebsiteAPI.Data
{
    public class MerchDbContext : DbContext
    {
        public MerchDbContext(DbContextOptions<MerchDbContext> options)
            : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<User> Users { get; set; }
    }
}