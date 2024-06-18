


import { Route, Routes } from 'react-router-dom';
import  AsideMenu  from '../components/AsideMenu.jsx';
import {Sell, Order, Products, AddProducts, Analytic} from '../pages/changePage.jsx'; 


export function Layout (){
	return (
		
	<div id="app" className="relative h-screen">
			<aside className="[grid-area:aside] flex-col overflow-auto bg-slate-700">
				<AsideMenu />
			</aside>
	
		<main className="[grid-area:main] bg-slate-300">
		<Routes>

            <Route path='/sell' Component={Sell} />
			<Route path='/order' Component={Order} />
			<Route path='/productos' Component={Products} />
			<Route path='/productos/create' Component={AddProducts} />
			<Route path='/analytics' Component={Analytic} />

        </Routes>
		</main>
	</div>
		
	)
}