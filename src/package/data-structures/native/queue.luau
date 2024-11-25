--!strict
--!native

local Queue = {}

export type QueueStruct<T> = {
	data: { T },
	front: number,
	rear: number,
}

function Queue.New<T>(): QueueStruct<T>
	return {
		data = {},
		front = 1,
		rear = 0,
	}
end

function Queue.Enqueue<T>(queue: QueueStruct<T>, value: T)
	queue.rear += 1
	queue.data[queue.rear] = value
end

function Queue.Dequeue<T>(queue: QueueStruct<T>)
	if Queue.IsEmpty(queue) then
		error("Queue is empty")
	end
	local value = queue.data[queue.front]
	queue.data[queue.front] = nil
	queue.front += 1
	return value
end

function Queue.Peek<T>(queue: QueueStruct<T>)
	if Queue.IsEmpty(queue) then
		error("Queue is empty")
	end
	return queue.data[queue.front]
end

function Queue.IsEmpty<T>(queue: QueueStruct<T>)
	return queue.rear < queue.front
end

function Queue.Size<T>(queue: QueueStruct<T>)
	return queue.rear - queue.front + 1
end

return Queue
