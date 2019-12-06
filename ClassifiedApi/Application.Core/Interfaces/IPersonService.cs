using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Interfaces
{
    public interface IPersonService
    {
        IEnumerable<PersonModel> GetAllPersons();
        PersonModel GetPersonById(int id);
        void AddPerson(PersonModel person);
        void DeletePerson(int id);
        void EditPerson(int id);
    }
}
