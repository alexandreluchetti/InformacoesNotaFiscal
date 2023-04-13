using LeitorNfe2.Data;
using LeitorNfe2.Models.Domain;
using LeitorNfe2.Models;
using Microsoft.AspNetCore.Mvc;

namespace LeitorNfe2.Controllers
{
    public class AddressesController : Controller
    {
        private readonly LeitorContext leitorContext;
        public AddressesController(LeitorContext leitorContext)
        {
            this.leitorContext = leitorContext;
        }

        [HttpGet]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(AddAddressViewModel request)
        {
            var address = new Address()
            {
                Id = Guid.NewGuid(),
                PublicPlace = request.PublicPlace,
                Number = request.Number,
                District = request.District,
                County = request.County,
                State = request.State,
                ZipCode = request.ZipCode,
            };

            await leitorContext.Addresses.AddAsync(address);
            await leitorContext.SaveChangesAsync();

            return RedirectToAction("Add");
        }
    }
}
