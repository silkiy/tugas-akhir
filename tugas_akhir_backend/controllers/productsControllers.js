const Product = require("../models/Product");

module.exports = {
  createProduct: async (req, res) => {
    const newProduct = new Product(req.body);
    try {
      await newProduct.save();
      res.status(200).json("product created");
    } catch (error) {
      res.status(500).json("failed to created product");
    }
  },

  getAllProducts: async (req, res) => {
    try {
      const products = await Product.find().sort({ createdAt: -1 });
      res.status(200).json(products);
    } catch (error) {
      res.status(500).json("failed to get the products");
    }
  },

  getProduct: async (req, res) => {
    const productId = req.params.id;
    try {
      const product = await Product.findById(productId);
      const { __v, createdAt, ...productData } = product._doc;
      res.status(200).json(productData);
    } catch (error) {
      res.status(500).json("failed to get the product");
    }
  },

  searchProduct: async (req, res) => {
    try {
      const results = await Product.aggregate([
        {
          $search: {
            index: "shoes",
            text: {
              query: req.params.key,
              path: {
                wildcard: "*",
              },
            },
          },
        },
      ]);
      res.status(200).json(results);
    } catch (error) {
      res.status(500).json("failed to get the product");
    }
  },

  deleteProduct: async (req, res) => {
    const productId = req.params.id;
    try {
      await Product.findByIdAndDelete(productId);
      res.status(200).json("product deleted");
    } catch (error) {
      res.status(500).json("failed to delete the product");
    }
  },

  editProduct: async (req, res) => {
    const productId = req.params.id; 
    const updatedData = req.body; 
    try {
      // Cari produk berdasarkan ID
      const product = await Product.findById(productId);
      if (!product) {
        return res.status(404).json("Product not found"); // Jika produk tidak ditemukan, kirim respons 404
      }
      // Perbarui data produk dengan data yang diterima dari body request
      Object.assign(product, updatedData);
      // Simpan perubahan pada data produk
      await product.save();
      res.status(200).json("Product updated"); // Kirim respons sukses
    } catch (error) {
      res.status(500).json("Failed to update product"); // Kirim respons gagal jika terjadi kesalahan server
    }
  },
};
