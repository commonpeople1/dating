using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Domain;

namespace Dating._Core.Repository
{
    public interface IRepository<TEntity> where TEntity : BaseEntity
    {
        List<TEntity> GetList();
        List<TEntity> GetList(Func<TEntity, bool> predicate);
        Task<List<TEntity>> GetListAsync();
        Task<List<TEntity>> GetListAsync(Func<TEntity, bool> predicate);
        bool Add(TEntity entity);
        Task<bool> AddAsync(TEntity entity);
        bool Update(TEntity entity);
        Task<bool> UpdateAsync(TEntity entity);
        bool Delete(TEntity entity);
        Task<bool> DeleteAsync(TEntity entity);
    }
}
