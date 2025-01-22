using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating._Core.Core;
using Dating.Domain;

using Microsoft.EntityFrameworkCore;
namespace Dating._Core.Repository
{
    public class Repository<TEntity> : IRepository<TEntity>
    where TEntity : BaseEntity

    {
        private readonly DatingDbContext _context;
        public Repository(DatingDbContext context)
        {
            _context = context;
        }
        public List<TEntity> GetList()
        {
            return _context.Set<TEntity>().ToList();
        }
        public List<TEntity> GetList(Func<TEntity, bool> predicate)
        {
            return _context.Set<TEntity>().Where(predicate).ToList();
        }
        public async Task<List<TEntity>> GetListAsync()
        {
            return await _context.Set<TEntity>().ToListAsync();
        }
        public async Task<List<TEntity>> GetListAsync(Func<TEntity, bool> predicate)
        {
            return await _context.Set<TEntity>().Where(predicate).AsQueryable().ToListAsync();
        }

        public bool Add(TEntity entity)
        {
            _context.Set<TEntity>().Add(entity);
            return _context.SaveChanges() > 0;
        }

        public async Task<bool> AddAsync(TEntity entity)
        {
            await _context.Set<TEntity>().AddAsync(entity);
            return await _context.SaveChangesAsync() > 0;
        }

        public bool Update(TEntity entity)
        {
            _context.Set<TEntity>().Update(entity);
            return _context.SaveChanges() > 0;
        }

        public async Task<bool> UpdateAsync(TEntity entity)
        {
            _context.Set<TEntity>().Update(entity);
            return await _context.SaveChangesAsync() > 0;
        }

        public bool Delete(TEntity entity)
        {
            _context.Set<TEntity>().Remove(entity);
            return _context.SaveChanges() > 0;
        }

        public async Task<bool> DeleteAsync(TEntity entity)
        {
            _context.Set<TEntity>().Remove(entity);
            return await _context.SaveChangesAsync() > 0;
        }
    }
}
