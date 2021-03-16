const Order = require("../models/Order");

module.exports = {
    async store(req, res) {
        const { price, gameId } = req.body;

        try {
            const order = await Order.create({
                price,
                gameId: gameId,
            });

            res.status(201).send({
                order: {
                    id: order.id,
                    price: order.price,
                    gameId: order.gameId,
                },
            });
        } catch (error) {
            res.status(500).send(error);
        }
    },
};