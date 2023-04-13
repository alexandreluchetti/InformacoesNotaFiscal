using LeitorNfe2.Models.Domain;

namespace LeitorNfe2.Models
{
    public class AddInvoiceViewModel
    {
        public int Number { get; set; }
        public string AccessKey { get; set; }
        public DateTime IssueDate { get; set; }

        public int IssuerId { get; set; }

        public int AddresseeId { get; set; }

        public int ProductId { get; set; }

        public double TotalValue { get; set; }
        public string Description { get; set; }
        public string OrderNumber { get; set; }
    }
}
