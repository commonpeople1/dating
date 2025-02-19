using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

using Dating.Core.Core;
using Dating.Domain;

using Microsoft.EntityFrameworkCore;
namespace Dating.Core.Repository
{
    public class Repository<TEntity> : IRepository<TEntity>
    where TEntity : class

    {
        private readonly DatingDbContext _context;
        public Repository(DatingDbContext context)
        {
            _context = context;
        }
        public List<TEntity> GetList()
        {
            var dbSet = _context.Set<TEntity>();
            return dbSet.ToList();
        }
        public List<TEntity> GetList(Func<TEntity, bool> predicate)
        {
            var dbSet = _context.Set<TEntity>();
            return dbSet.Where(predicate).ToList();
        }
        // public async Task<List<TEntity>> GetListAsync(PageWithSortDto pageWithSortDto)
        // {
        //     int skip = (pageWithSortDto.PageIndex - 1) * pageWithSortDto.PageSize;
        //     var dbSet = _context.Set<TEntity>();
        //     if (pageWithSortDto.OrderType == OrderType.Asc)
        //         return await dbSet.OrderBy(pageWithSortDto.Sort).Skip(skip).Take(pageWithSortDto.PageSize).ToListAsync();
        //     else
        //         return await dbSet.OrderByDescending(pageWithSortDto.Sort).Skip(skip).Take(pageWithSortDto.PageSize).ToListAsync();

        // }
        public IQueryable<TEntity> GetQueryable()
        {
            var dbSet = _context.Set<TEntity>();
            return dbSet;
        }
        public Task<List<TEntity>> GetListAsync()
        {
            var dbSet = _context.Set<TEntity>();
            return dbSet.ToListAsync();
        }
        public async Task<List<TEntity>> GetListAsync(Expression<Func<TEntity, bool>> predicate)
        {
            var dbSet = _context.Set<TEntity>();
            return await dbSet.Where(predicate).ToListAsync();
        }
        public async Task<List<TEntity>> GetListAsync(Expression<Func<TEntity, bool>> predicate, string sort, int pageIndex, int pageSize)
        {
            int skip = (pageIndex - 1) * pageSize;
            var dbSet = _context.Set<TEntity>();
            return await dbSet.Where(predicate).OrderBy(m => sort).Skip(skip).Take(pageSize).ToListAsync();
        }

        public TEntity Get(Func<TEntity, bool> predicate)
        {
            var dbSet = _context.Set<TEntity>();
            return dbSet.FirstOrDefault(predicate);
        }
        public async Task<TEntity> GetAsync(Expression<Func<TEntity, bool>> predicate)
        {
            var dbSet = _context.Set<TEntity>();
            return await dbSet.FirstOrDefaultAsync(predicate);
        }
        public TEntity Insert(TEntity entity)
        {
            var dbSet = _context.Set<TEntity>();
            var res = dbSet.Add(entity).Entity;
            _context.SaveChanges();
            return res;
        }
        public async Task<TEntity> InsertAsync(TEntity entity)
        {
            var dbSet = _context.Set<TEntity>();
            var res = (await dbSet.AddAsync(entity)).Entity;
            await _context.SaveChangesAsync();
            return res;
        }
        public TEntity Delete(TEntity entity)
        {
            var dbSet = _context.Set<TEntity>();
            var res = dbSet.Remove(entity).Entity;
            _context.SaveChanges();
            return res;
        }
        public async Task<TEntity> DeleteAsync(TEntity entity)
        {
            var dbSet = _context.Set<TEntity>();
            var res = dbSet.Remove(entity).Entity;
            await _context.SaveChangesAsync();
            return res;
        }
        public TEntity Update(TEntity entity)
        {
            // _context.Entry<TEntity>(entity).Property("Id").IsModified = false;
            var dbSet = _context.Set<TEntity>();
            var res = dbSet.Update(entity).Entity;
            _context.SaveChanges();
            return res;
        }
        public async Task<TEntity> UpdateAsync(TEntity entity)
        {
            // _context.Entry<TEntity>(entity).Property("Id").IsModified = false;
            var dbSet = _context.Set<TEntity>();
            var res = dbSet.Update(entity).Entity;
            await _context.SaveChangesAsync();
            return res;
        }


    }
}
