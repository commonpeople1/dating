using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dating.Common.EventBus;

public interface IEvent { }

// 异步事件处理器接口（非泛型基类）
public interface IAsyncEventHandler
{
    Task HandleAsync(IEvent @event);
    void HandleException(IEvent @event, Exception ex);
}

// 泛型异步事件处理器接口
public interface IAsyncEventHandler<TEvent> : IAsyncEventHandler
    where TEvent : IEvent
{
    Task HandleAsync(TEvent @event);
    void HandleException(TEvent @event, Exception ex);

    // 显式实现基类接口，避免冲突
    Task IAsyncEventHandler.HandleAsync(IEvent @event) => HandleAsync((TEvent)@event);
    void IAsyncEventHandler.HandleException(IEvent @event, Exception ex) => HandleException((TEvent)@event, ex);
}

// 事件总线核心类
public class EventBus
{
    private readonly Dictionary<Type, List<IAsyncEventHandler>> _handlers = new();

    // 订阅事件
    public void Subscribe<TEvent>(IAsyncEventHandler<TEvent> handler)
        where TEvent : IEvent
    {
        var eventType = typeof(TEvent);
        if (!_handlers.ContainsKey(eventType))
        {
            _handlers[eventType] = new List<IAsyncEventHandler>();
        }
        _handlers[eventType].Add(handler);
    }

    // 发布事件（异步）
    public async Task PublishAsync<TEvent>(TEvent @event)
        where TEvent : IEvent
    {
        if (_handlers.TryGetValue(typeof(TEvent), out var handlers))
        {
            foreach (var handler in handlers)
            {
                try
                {
                    await handler.HandleAsync(@event);
                }
                catch (Exception ex)
                {
                    handler.HandleException(@event, ex);
                }
            }
        }
    }
}
// 订单创建事件
public class OrderCreatedEvent : IEvent
{
    public int OrderId { get; set; }
    public int ProductId { get; set; }
    public int Quantity { get; set; }
}

// 库存服务处理器
public class InventoryService : IAsyncEventHandler<OrderCreatedEvent>
{
    public Task HandleAsync(OrderCreatedEvent @event)
    {
        Console.WriteLine($"库存扣减：商品 {@event.ProductId} 数量 {@event.Quantity}");
        return Task.CompletedTask;
    }

    public void HandleException(OrderCreatedEvent @event, Exception ex)
    {
        Console.WriteLine($"库存处理异常：{ex.Message}");
    }
}

// 物流服务处理器
public class LogisticsService : IAsyncEventHandler<OrderCreatedEvent>
{
    public Task HandleAsync(OrderCreatedEvent @event)
    {
        Console.WriteLine($"物流调度：订单 {@event.OrderId}");
        return Task.CompletedTask;
    }

    public void HandleException(OrderCreatedEvent @event, Exception ex)
    {
        Console.WriteLine($"物流处理异常：{ex.Message}");
    }
}