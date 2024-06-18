
// import Layout from '../layouts/Layout';
// import SellComponents from '../components/SellComponents.astro';

import AddProductos from "../components/AddProductos";
import OrderMain from "../components/OrderMain";
import ProductosMain from "../components/ProductsMain";
import SellComponents from "../components/SellComponents";
import Analytics from "../components/Analytics";

export function Sell(){

	return(
		<>
			<h1 className="text-center">Sell</h1>

			<SellComponents />
		</>

	)
}

export function Order(){

	return (
		<>
		<h1>Order</h1>
		<OrderMain/>
		</>
	)
}

export function Products(){

	return (
		<>
		<h1>Order</h1>
		<ProductosMain/>
		</>
	)
}


export function AddProducts(){

	return (
		<>
		<h1>Order</h1>
		<AddProductos/>
		</>
	)
}

export function Analytic(){

	return (
		<>
		<h1>Analytic</h1>
		<Analytics/>
		</>
	)
}

