using LeitorNfe2.Data;
using LeitorNfe2.Models;
using LeitorNfe2.Models.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Xml;

namespace LeitorNfe2.Controllers
{
    public class IssuersController : Controller
    {
        private readonly LeitorContext leitorContext;
        public IssuersController(LeitorContext leitorContext)
        {
            this.leitorContext = leitorContext;
        }

        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(AddIssuerViewModel request)
        {
            var issuer = new Issuer()
            {
                Id = Guid.NewGuid(),
                Name = request.Name,
                Cnpj = request.Cnpj,
                AddressId = request.AddressId,
                Email = request.Email
            };

            await leitorContext.Issuers.AddAsync(issuer);
            await leitorContext.SaveChangesAsync();

            return RedirectToAction("Add");
        }
    }
}
