express = require('express')
app = express()

app.use('/static', express.static(__dirname + "/static"))

app.get('/', (request, response) ->
  response.sendFile(__dirname + "/views/index.html")
)

app.listen(8000)
