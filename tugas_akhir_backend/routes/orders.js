const router = require("express").Router();
const orderController = require("../controllers/ordersControllers");
const { verifyToken } = require("../middleware/verifyToken");

router.get("/", verifyToken, orderController.getUsersOrders);

module.exports = router;
