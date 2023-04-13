using System.ComponentModel.DataAnnotations;

namespace LeitorNfe2.Models.Domain
{
    public class Product
    {
        [Key]
        [Required]
        public Guid Id { get; set; }
        public int ProductCode { get; set; }
        public string Name { get; set; }
        public int Amount { get; set; }
        public double UnitaryValue { get; set; }
        public double TotalValue { get; set; }
    }
}
