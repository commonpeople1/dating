using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

using Dating.Core.Core;
using Dating.Core.Global;
using Dating.Domain;
using System.Linq.Dynamic.Core;
using Microsoft.EntityFrameworkCore;
using System.Reflection;
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
        public async Task<List<TEntity>> GetListAsync(PageWithSort pageWithSort)
        {
            int skip = (pageWithSort.PageIndex - 1) * pageWithSort.PageSize;
            var query = _context.Set<TEntity>().AsQueryable();

            if (!string.IsNullOrWhiteSpace(pageWithSort.Sort))
            {
                // 校验排序字段是否存在
                if (!IsValidSortField(pageWithSort.Sort))
                {
                    throw new ArgumentException($"无效排序字段: {pageWithSort.Sort}");
                }

                string orderDirection = pageWithSort.OrderType == OrderType.Asc ? "asc" : "desc";
                query = query.OrderBy($"{pageWithSort.Sort} {orderDirection}");
            }

            return await query.Skip(skip)
                             .Take(pageWithSort.PageSize)
                             .ToListAsync();

        }
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
        public async Task<List<TProjection>> GetProjectionAsync<TProjection>(Expression<Func<TEntity, TProjection>> projectionExpression)
        {
            return _context.Set<TEntity>()
                .Select(projectionExpression)
                .ToList();
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
        private bool IsValidSortField(string sortExpression)
        {
            var entityType = typeof(TEntity);

            // 支持嵌套属性（如 "Address.City"）
            var properties = sortExpression.Split('.');

            PropertyInfo propertyInfo = null;
            Type currentType = entityType;

            foreach (var prop in properties)
            {
                propertyInfo = currentType.GetProperty(prop,
                    BindingFlags.IgnoreCase |  // 是否忽略大小写
                    BindingFlags.Public |
                    BindingFlags.Instance);

                if (propertyInfo == null) return false;

                currentType = propertyInfo.PropertyType;
            }

            return true;
        }

    }
}
