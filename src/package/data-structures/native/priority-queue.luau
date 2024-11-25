--!strict
--!native

type Heap<T> = { { item: T, priority: number } }
export type PriorityQueueStruct<T> = {
	_heap: Heap<T>,
	_items: { [T]: boolean },
}

local PriorityQueue = {}
do
	local _container = PriorityQueue

	local function bubbleDown<T>(heap: Heap<T>)
		local index = 1
		local length = #heap
		while true do
			local leftIndex = index * 2
			local rightIndex = leftIndex + 1
			local smallest = index

			if leftIndex <= length and heap[leftIndex].priority < heap[smallest].priority then
				smallest = leftIndex
			end
			if rightIndex <= length and heap[rightIndex].priority < heap[smallest].priority then
				smallest = rightIndex
			end

			if smallest == index then
				break
			end
			heap[index], heap[smallest] = heap[smallest], heap[index]
			index = smallest :: number
		end
	end

	local function bubbleUp<T>(heap: Heap<T>)
		local index = #heap
		while index > 1 do
			local parentIndex = math.floor((index - 1) / 2) + 1
			if heap[index].priority >= heap[parentIndex].priority then
				break
			end
			heap[index], heap[parentIndex] = heap[parentIndex], heap[index]
		end
	end

	local function New<T>(): PriorityQueueStruct<T>
		return {
			_heap = {},
			_items = {},
		}
	end
	_container.New = New

	local function Enqueue<T>(data: PriorityQueueStruct<T>, item: T, priority: number)
		table.insert(data._heap, { item = item, priority = priority })
		data._items[item] = true
		bubbleUp(data._heap)
	end
	_container.Enqueue = PriorityQueue.Enqueue

	local function Dequeue<T>(data: PriorityQueueStruct<T>): T?
		local heap = data._heap
		if #heap == 0 then
			return nil
		end

		local item = heap[1].item
		local tailElement = table.remove(heap)
		if #heap > 0 and tailElement then
			heap[1] = tailElement
			bubbleDown(heap)
		end
		(data._items :: any)[item] = nil
		return item
	end
	_container.Dequeue = PriorityQueue.Dequeue
end

return {
	PriorityQueue = PriorityQueue,
}
