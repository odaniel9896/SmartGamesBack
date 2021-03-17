const Order = require("../models/Order");

module.exports = {
    async store(req, res) {
        const gameId = req.params.id
        const { pricePaid } = req.body;

        try {
            const order = await Order.create({
                pricePaid,
                gameId: gameId,
            });

            res.status(201).send({
                order: {
                    id: order.id,
                    pricePaid: order.price,
                    gameId: order.gameId,
                },
            });
        } catch (error) {
            res.status(500).send(error);
        }
    },
};