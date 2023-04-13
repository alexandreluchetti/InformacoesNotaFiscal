using LeitorNfe2.Data;
using LeitorNfe2.Models;
using LeitorNfe2.Models.Domain;
using Microsoft.AspNetCore.Mvc;
using System.Xml;

namespace LeitorNfe2.Controllers
{
    public class ProductsController : Controller
    {
        private readonly LeitorContext leitorContext;
        public ProductsController(LeitorContext leitorContext)
        {
            this.leitorContext = leitorContext;
        }

        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(AddProductViewModel request)
        {
            var product = new Product()
            {
                Id = Guid.NewGuid(),
                ProductCode = request.ProductCode,
                Name = request.Name,
                Amount = request.Amount,
                UnitaryValue = request.UnitaryValue,
                TotalValue = request.TotalValue,
            };

            await leitorContext.Products.AddAsync(product);
            await leitorContext.SaveChangesAsync();

            return RedirectToAction("Add");
        }
    }
}
