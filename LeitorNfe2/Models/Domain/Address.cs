using System.ComponentModel.DataAnnotations;

namespace LeitorNfe2.Models.Domain
{
    public class Address
    {
        [Key]
        [Required]
        public Guid Id { get; set; }
        public string PublicPlace { get; set; }
        public int Number { get; set; }
        public string District { get; set; }
        public string County { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }

        //public virtual Issuer Issuer { get; set; }
        //public virtual Addressee Addressee { get; set; }
    }
}
