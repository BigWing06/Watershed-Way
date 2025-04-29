extends Node

var server := TCPServer.new()
var client = null
var buffer := ""

func _ready():
	var port = 2222
	var result = server.listen(port)
	if result != OK:
		push_error("Failed to start TCP server on port %d" % port)
	else:
		print("TCP server listening on port", port)

func _process(delta):
	if client == null and server.is_connection_available():
		client = server.take_connection()
		if client:
			client.set_no_delay(true)  # Reduces delay from Nagle's algorithm
			print("Client connected!")
	
	if client and client.get_available_bytes() > 0:
		var received = client.get_utf8_string(client.get_available_bytes())
		buffer += received

		while buffer.find("\n") != -1:
			var newline_index = buffer.find("\n")
			var message = buffer.substr(0, newline_index).strip_edges()
			buffer = buffer.substr(newline_index + 1)
			handle_message(message)

func handle_message(message):
	print("Received message:", message)
	get_node("/root/rootScene").triggerZone(int(message))
