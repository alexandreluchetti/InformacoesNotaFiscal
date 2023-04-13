using System.ComponentModel.DataAnnotations;

namespace LeitorNfe2.Models.Domain
{
    public class Invoice
    {
        [Key]
        [Required]
        public Guid Id { get; set; }
        public int Number { get; set; }
        public string AccessKey { get; set; }
        public DateTime IssueDate { get; set; }

        public int IssuerId { get; set; }
        //public virtual Issuer Issuer { get; set; }

        public int AddresseeId { get; set; }
        //public virtual Addressee Addressee { get; set; }

        public int ProductId { get; set; }
        //public virtual Product Product { get; set; }

        public double TotalValue { get; set; }

        public string Description { get; set; }
        public string OrderNumber { get; set; }
    }
}
