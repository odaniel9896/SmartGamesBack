
const Game = require("../models/Game")
const readXlsxFile = require("read-excel-file/node");
const excel = require("exceljs");

module.exports = {
  async index(req,res) {

    Game.findAll().then((objs) => {
      let tutorials = [];
  
      objs.forEach((obj) => {
        tutorials.push({
          id: obj.id,
          name: obj.name,
          description: obj.description,
          releaseDate: obj.releaseDate,
          price: obj.price,
          developer: obj.developer,
          platform: obj.platform,
          image: obj.image,
        });
      });
  
      let workbook = new excel.Workbook();
      let worksheet = workbook.addWorksheet("Games");
  
      worksheet.columns = [
        { header: "Id", key: "id", width: 5 },
        { header: "Nome", key: "name", width: 25 },
        { header: "Descrição", key: "description", width: 35 },
        { header: "Lançamento", key: "releaseDate", width: 20 },
        { header: "Preço", key: "price", width: 20 },
        { header: "Desenvolvedor", key: "developer", width: 20 },
        { header: "Plataforma", key: "platform", width: 20 },
        { header: "Imagem", key: "image", width: 20 },
        { header: "Lojas", key: "image", width: 20 }
      ];
  
      // Add Array Rows
      worksheet.addRows(tutorials);
  
      res.setHeader(
        "Content-Type",
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      );
      res.setHeader(
        "Content-Disposition",
        "attachment; filename=" + "games.xlsx"
      );
  
      return workbook.xlsx.write(res).then(function () {
        res.status(200).end();
      });
    });
  },
  async store(req,res) {
    try {
      if (req.file == undefined) {
        return res.status(400).send("Envie um arquivo Excel");
      }
  
      let path =
        __dirname + "../../../uploads/" + req.file.filename;
  
      readXlsxFile(path).then((rows) => {
        rows.shift();
  
        let tutorials = [];
  
        rows.forEach((row) => {
          let tutorial = {
            id: row[0],
            name: row[1],
            description: row[2],
            releaseDate: row[3],
            price: row[4],
            developer: row[5],
            platform: row[6],
            stores: row[7],
            categories: row[8],
            image: row[9]
          };
          tutorials.push(tutorial);
        });
  
        Game.bulkCreate(tutorials)
          .then(() => {
            res.status(200).send({
              message: "Enviado e dados alterados com sucesso " + req.file.originalname,
            });
          })
          .catch((error) => {
            res.status(500).send({
              message: "Falha para upar pro banco",
              error: error.message,
            });
          });
      });
    } catch (error) {
      console.log(error);
      res.status(500).send({
      message: "Algo deu errado : " + req.file.originalname,
    });
    }
  }
}
