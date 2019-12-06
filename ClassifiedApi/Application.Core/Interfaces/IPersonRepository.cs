using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Interfaces
{
    public interface IPersonRepository
    {
        IEnumerable<PersonModel> GetPersons();
        PersonModel GetPerson(int id);
        void AddNewPerson(PersonModel ad);
        void EditPersonbyId(PersonModel ad);
        void DeletePersonybyId(int id);
    }
}
