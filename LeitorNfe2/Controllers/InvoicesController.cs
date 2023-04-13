using LeitorNfe2.Data;
using LeitorNfe2.Models;
using LeitorNfe2.Models.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Xml;

namespace LeitorNfe2.Controllers
{
    public class InvoicesController : Controller
    {
        private readonly LeitorContext leitorContext;
        public InvoicesController(LeitorContext leitorContext)
        {
            this.leitorContext = leitorContext;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var invoices = await leitorContext.Invoices.ToListAsync();
            return View(invoices);
        }

        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(AddInvoiceViewModel invoiceViewModel)
        {
            var invoice = new Invoice()
            {
                Id = Guid.NewGuid(),
                Number = invoiceViewModel.Number,
                AccessKey = invoiceViewModel.AccessKey,
                IssueDate = invoiceViewModel.IssueDate,
                IssuerId = invoiceViewModel.IssuerId,
                AddresseeId = invoiceViewModel.AddresseeId,
                ProductId = invoiceViewModel.ProductId,
                TotalValue = invoiceViewModel.TotalValue,
                Description = invoiceViewModel.Description,
                OrderNumber = invoiceViewModel.OrderNumber
            };

            await leitorContext.Invoices.AddAsync(invoice);
            await leitorContext.SaveChangesAsync();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> View(Guid id) 
        {
            var invoice = await leitorContext.Invoices.FirstOrDefaultAsync(x => x.Id == id);

            if (invoice != null)
            {
                var viewModel = new UpdateInvoiceViewModel()
                {
                    Id = invoice.Id,
                    Number = invoice.Number,
                    AccessKey = invoice.AccessKey,
                    IssueDate = invoice.IssueDate,
                    IssuerId = invoice.IssuerId,
                    AddresseeId = invoice.AddresseeId,
                    ProductId = invoice.ProductId,
                    TotalValue = invoice.TotalValue,
                    Description = invoice.Description,
                    OrderNumber = invoice.OrderNumber
                };

                return await Task.Run(() => View("View", viewModel));
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> View(UpdateInvoiceViewModel model) 
        {
            var invoice = await leitorContext.Invoices.FindAsync(model.Id);

            if (invoice != null) 
            {
                invoice.Description = model.Description;
                invoice.OrderNumber = model.OrderNumber;
                await leitorContext.SaveChangesAsync();
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public async Task<IActionResult> Delete(UpdateInvoiceViewModel model) 
        { 
            var invoice = await leitorContext.Invoices.FindAsync(model.Id);

            if(invoice != null) 
            { 
                leitorContext.Invoices.Remove(invoice);
                await leitorContext.SaveChangesAsync();
            }

            return RedirectToAction("Index");
        }
    }
}
