using Application.Core.Interfaces;
using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Services
{
    public class PersonService :IPersonService
    {
        private IPersonRepository _person;
        public PersonService(IPersonRepository person)
        {
            _person = person;
        }

        public void AddPerson(PersonModel person)
        {
            _person.AddNewPerson(person);
        }

      

        public void DeletePerson(int id)
        {
            throw new NotImplementedException();
        }

        public void EditPerson(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<PersonModel> GetAllPersons()
        {
            return _person.GetPersons();
        }

        public PersonModel GetPersonById(int id)
        {
            return _person.GetPerson(id);
        }

        
    }
}
