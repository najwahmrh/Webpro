<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index()
    {
        $prods = Product::get();
        if (request()->segment(1) == 'api') return response()->json([
            'error' => false,
            'list'  => $prods,
        ]);
        return view('view_product', [
            'title' => 'Daftar Produk',
            'data'  => $prods,
        ]);
    }

    public function create() {}
    public function store(Request $request) {}
    public function show(Product $product) {}
    public function edit(Product $product) {}
    public function update(Request $request, Product $product) {}
    public function destroy(Product $product) {}
}
