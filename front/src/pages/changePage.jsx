
// import Layout from '../layouts/Layout';
// import SellComponents from '../components/SellComponents.astro';

import OrderMain from "../components/OrderMain";
import ProductosMain from "../components/ProductsMain";
import SellComponents from "../components/SellComponents";


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


