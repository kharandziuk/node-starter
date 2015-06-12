express = require('express')
app = express()
port = 8000

server = require('http').createServer(app)

io = require('socket.io')(server)

app.use('/static', express.static(__dirname + "/static"))

app.get('/', (request, response) ->
  response.sendFile(__dirname + "/views/index.html")
)

server.listen(port, ()->
  console.log("Server listening at port #{port}")
)

io.on('connection', (socket)->
  console.log('in connection')
  socket.emit('connect')
  socket.on('answer', ->
    console.log('client answered') 
  )
)

