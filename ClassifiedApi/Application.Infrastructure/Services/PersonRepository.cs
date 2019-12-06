using AppConnection;
using Application.Core.Interfaces;
using Application.Core.Models;
using PetaPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Infrastructure.Services
{
    public class PersonRepository : IPersonRepository
    {
        private readonly AutoMapper.IMapper _mapper;
        private readonly IDatabase _db;


        public PersonRepository(AutoMapper.IMapper mapper, IDatabase db)
        {
            _mapper = mapper;
            _db = db;
        }

        public void AddNewPerson(PersonModel ad)
        {
            throw new NotImplementedException();
        }

        public void DeletePersonybyId(int id)
        {
            throw new NotImplementedException();
        }

        public void EditPersonbyId(PersonModel ad)
        {
            throw new NotImplementedException();
        }

        public PersonModel GetPerson(int id)
        {
            var user = _db.SingleOrDefault<Person>("Select * from Person where Id = @0", id);
            return _mapper.Map<Person, PersonModel>(user);
        }

        public IEnumerable<PersonModel> GetPersons()
        {
            var users = _db.Query<Person>("Select * from Person");
            return _mapper.Map<IEnumerable<Person>, IEnumerable<PersonModel>>(users);
        }
    }
}
