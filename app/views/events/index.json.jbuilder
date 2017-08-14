#json.array! @events, partial: 'events/event', as: :event

@events.each do |event|
  json.array! event[1], partial: 'events/event', as: :event
end