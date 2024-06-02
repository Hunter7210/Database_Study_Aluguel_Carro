const express = require('express');
const path = require('path');
const fs = require('fs');
const app = express();
const port = 3000;

// Middleware para servir arquivos estáticos
app.use('/images', express.static(path.join(__dirname, 'images')));

// Rota para obter dados das imagens
app.get('/api/images', (req, res) => {
  fs.readFile('images.json', (err, data) => {
    if (err) {
      res.status(500).send('Erro ao ler o arquivo JSON');
      return;
    }
    res.json(JSON.parse(data));
  });
});

// Rota principal apenas para testar o servidor
app.get('/', (req, res) => {
  res.send('Servidor está rodando! Acesse as imagens em /images e os dados em /api/images');
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
