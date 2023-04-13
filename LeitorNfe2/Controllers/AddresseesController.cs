using LeitorNfe2.Data;
using LeitorNfe2.Models;
using LeitorNfe2.Models.Domain;
using Microsoft.AspNetCore.Mvc;
using System.Xml;

namespace LeitorNfe2.Controllers
{
    public class AddresseesController : Controller
    {
        private readonly LeitorContext leitorContext;
        public AddresseesController(LeitorContext leitorContext)
        {
            this.leitorContext = leitorContext;
        }

        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(AddAddresseeViewModel request)
        {
            var addressee = new Addressee()
            {
                Id = Guid.NewGuid(),
                Name = request.Name,
                Cnpj = request.Cnpj,
                AddressId = request.AddressId,
                Email = request.Email
            };

            await leitorContext.Addressees.AddAsync(addressee);
            await leitorContext.SaveChangesAsync();

            return RedirectToAction("Add");
        }
    }
}
