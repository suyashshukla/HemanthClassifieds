using Application.Core.Interfaces;
using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Classified.Controllers
{
    public class UserController : ApiController
    {
        // GET: api/User
        private readonly IPersonService _personService;

        public UserController(IPersonService personService)
        {
            _personService = personService;

        }
        // GET: api/User
        [HttpGet]
        public IEnumerable<PersonModel> GetAllUsers()
        {
            return _personService.GetAllPersons();
        }

        // GET: api/User/5
        [HttpGet]
        public PersonModel GetUser(int id)
        {
            //return CoreCategoryService.GetCategoryById(id);
            return _personService.GetPersonById(id);
        }

        // POST: api/User
        [HttpPost]
        public void AddPerson([FromBody]OfferModel offer)
        {


            //Add person

        }

        // PUT: api/User/5
        [HttpPut]
        public void UpdatePerson(int id, [FromBody]PersonModel value)
        {
            //Udate person
        }

        [HttpDelete]
        // DELETE: api/User/5
        public void DeletePerson(int id)
        {
            //CoreCategoryService.DeleteCategory(id);

        }
    }
}
