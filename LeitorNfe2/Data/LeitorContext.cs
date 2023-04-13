using LeitorNfe2.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace LeitorNfe2.Data
{
    public class LeitorContext : DbContext
    {
        public LeitorContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Invoice> Invoices { get; set; }
        public DbSet<Issuer> Issuers { get; set; }
        public DbSet<Addressee> Addressees { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<Product> Products { get; set; }
    }
}
