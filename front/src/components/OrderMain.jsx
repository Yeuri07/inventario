
export default function OrderMain(){

    return(
        <html lang="en">
  <head>
    <title>Open Orders Component</title>
  </head>
  <body className="bg-gray-100 text-gray-900 font-sans">
    <div className="min-h-screen p-8">
     
      <header className="flex items-center justify-between mb-8">
        <h1 className="text-2xl font-semibold">open orders</h1>
        <div className="flex items-center space-x-4">
          <button className="text-sm bg-gray-200 px-4 py-2 rounded">Help</button>
          <div className="flex items-center space-x-2">
            <div className="w-8 h-8 bg-gray-300 rounded-full flex items-center justify-center">
              <span className="text-white">PE</span>
            </div>
            <span className="text-sm">Yeuri</span>
            <span className="text-sm text-gray-500">yeuri@example.com</span>
          </div>
        </div>
      </header>
      
   
      <div className="mb-8 flex items-center space-x-4">
        <input type="text" placeholder="Item or customer" className="w-full p-2 border border-gray-300 rounded" />
        <button className="p-2 bg-gray-200 rounded">Filter</button>
        <button className="p-2 bg-gray-200 rounded">All status</button>
      </div>

   
      <div className="flex flex-col items-center justify-center bg-white p-8 rounded shadow">
        <img src="basket_icon.svg" alt="Basket" className="w-24 h-24 mb-4" />
        <p className="text-lg">No orders yet</p>
        <p className="text-gray-600">Any question?</p>
        <a href="#" className="text-teal-500">Click here and discover our Help Center</a>
      </div>
    </div>
  </body>
</html>
    )
}