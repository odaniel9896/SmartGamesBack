const Store = require("../models/Store")

module.exports = {
    async index(req, res) {
        try {
            const store = await Store.findAll()

            res.send(store)
        } catch (error) {
            console.log(error);
            res.status(500).send(error);
        }
    },
    async store(req, res) {
        const { district, street, complement, number, cep } = req.body;


        try {
            const store = await Store.create({
                district,
                street,
                complement,
                number,
                cep
            });

            res.status(201).send({
                id: store.id,
                district: store.district,
                street: store.street,
                complement: store.complement,
                number: store.number,
                cep: store.cep,
            });

        } catch (error) {

        }
    },
    async find(req, res) {
        const storeId = req.params.id;
        try {
            let store = await Store.findByPk(storeId);

            if (!store)
                return res.status(404).send({ erro: "Loja não encontrada" });

            res.send(store)
        } catch (error) {
            console.log(error);
            res.status(500).send({ error });
        }
    }
}