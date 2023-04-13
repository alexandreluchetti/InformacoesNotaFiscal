using System.ComponentModel.DataAnnotations;

namespace LeitorNfe2.Models.Domain
{
    public abstract class Person
    {
        [Key]
        [Required]
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Cnpj { get; set; }
        public int AddressId { get; set; }
        public string Email { get; set; }
    }
}
