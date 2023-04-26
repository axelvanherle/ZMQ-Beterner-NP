# src
In this readme you will learn how to utilize and interact with my service.

|Service|Description|
|---|---|
|Chat|Allows users to send messages to a topic, which the service fowards to a topic, allowing everyone to see all chats.|
|Joke|Allows users to request a joke.|

## Chat Service
A simple chat service, nothing more to it. Allows user to send a message, which the service forwards to all clients and or services connected.

### Sending
To push messages to the chat server you have to generate a unique ID from 1 - 100000. With this ID you will be identified by other chatters. You can generate a ID using `(rand() % 100000)+1`. A practical example of this could be `playerID = std::to_string((rand() % 100000)+1);`. After you generate your ID you are almost ready to start chatting. The service expects messages in this format: `axelvanherle>service>%YOUR GENERATED ID>chat>%YOUR MESSAGE`. An example packet could look like this: `axelvanherle>service?>22864>chat>Hello world!`.

### Receiving
Now that you are able to send messages you might also want to be able to receive messages, right? Well to do this the process is simpler. You don't need a generated ID! Hooray. All messages received by the service will be pushed to the `axelvanherle>service!>chat>%MESSAGE` topic. Where `%MESSAGE` is the placeholder for the message that is relayed. So if a message gets pushed by a client, every subscribed client and or service will be receiving these messages. This means that you too can now glow in the dark and listen in on all the juicy private chats. An example message could look like `axelvanherle>service!>chat>Check out this wicked skateboaring trick guys! https://youtu.be/dQw4w9WgXcQ`

## Joke Service

This service allows you to request a joke.

To be able to use this service you are going to need to generate a unique ID from 1 - 100000. This enables you to only receive jokes when *you* want, and it wont be a cluster of bad jokes spamming you. You can generate a ID using `(rand() % 100000)+1`. A practical example of this could be `playerID = std::to_string((rand() % 100000)+1);`. This ID will be the same to request and receive a joke, so don't lose it.

### Requesting a (bad) joke
You will need the generated ID for this, so don't skip this step. To request a joke you send `axelvanherle>service?>%YOUR GENERATED ID>joke` into the ether. Just kidding, you send it to the broker. This is all you need to do to request a joke. A practical example of this could look like: `axelvanherle>service?>22869>joke`.

### Receiving the (bad) joke
You will need the generated ID for this, so don't skip this step. To receive a joke you need to subscribe to `axelvanherle>service!>%YOUR GENERATED ID>joke>%JOKE HERE`. This is all you need to do to receive the requested jokes. A practical example of this could look like: `axelvanherle>service!>22869>joke>I'm afraid for the calendar. Its days are numbered.`.

## Example flowcharts

### Total communication
![image](https://user-images.githubusercontent.com/94362354/234311511-36c288af-c2b7-4d3c-8dc1-43b3db35dd8b.png)

### Chat Service
Here the client sends one messages, and it receives two messages from two other clients that sent something to the service.

![image](https://user-images.githubusercontent.com/94362354/234308439-5b68ca65-441b-4726-b000-142db5a6d61b.png)

### Joke Service
In this example the user requests a joke, and the service responds with one.

![image](https://user-images.githubusercontent.com/94362354/234309363-343c27fd-a415-4a4d-9fef-d76c6fd336fe.png)