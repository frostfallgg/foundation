--!strict
--!native

local Queue = {}

export type Struct<T> = {
	data: { T },
	front: number,
	rear: number,
}

function Queue.New<T>(): Struct<T>
	return {
		data = {},
		front = 1,
		rear = 0,
	}
end

function Queue.Enqueue<T>(queue: Struct<T>, value: T)
	queue.rear += 1
	queue.data[queue.rear] = value
end

function Queue.Dequeue<T>(queue: Struct<T>)
	if Queue.IsEmpty(queue) then
		error("Queue is empty")
	end
	local value = queue.data[queue.front]
	queue.data[queue.front] = nil
	queue.front += 1
	return value
end

function Queue.Peek<T>(queue: Struct<T>)
	if Queue.IsEmpty(queue) then
		error("Queue is empty")
	end
	return queue.data[queue.front]
end

function Queue.IsEmpty<T>(queue: Struct<T>)
	return queue.rear < queue.front
end

function Queue.Size<T>(queue: Struct<T>)
	return queue.rear - queue.front + 1
end

return Queue
