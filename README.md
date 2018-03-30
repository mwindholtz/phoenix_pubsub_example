# PubSub Demo

Demo of how to get phoenix_pubsub running without phoenix

* EventSubscriber.Supervisor.start_link()
* EventSubscriber.start_link([])         
* %Event{} |> Publisher.event()        

```

iex(1)>  EventSubscriber.Supervisor.start_link()
{:ok, #PID<0.176.0>}


iex(2)> EventSubscriber.start_link([])     
"EventSubscriber start_link"
"EventSubscriber initing"
"EventSubscriber subscribing"
"EventSubscriber subscribed"
"EventSubscriber subscribed"
"EventSubscriber inited"
{:ok, #PID<0.206.0>}

iex(3)> %Event{} |> Publisher.event()        
"Publisher broadcasting event"
"Publisher event broadcasted"
EVENT RECEIVED %Event{content: "something wonderful", name: "alert"}
{:ok, %Event{content: "something wonderful", name: "alert"}}

iex(4)> 

```