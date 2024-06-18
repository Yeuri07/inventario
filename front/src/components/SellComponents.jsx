

export default function SellComponents(){
    return (
        
<html lang="en">
  <head>
    <title>Sell Component</title>
  </head>
  <body className="bg-gray-100 text-gray-900 font-sans">
    <div className="flex min-h-screen">
    

      <div className="w-2/3 p-8">
        <div className="mb-6 flex items-center justify-between">
          <input type="text" placeholder="Name or code" className="w-1/2 p-2 border border-gray-300 rounded" />
          <div className="flex items-center space-x-4">
            <button className="px-4 py-2 bg-gray-200 rounded">Categories</button>
            <button className="p-2 bg-gray-200 rounded">Scan</button>
            <button className="p-2 bg-gray-200 rounded">Flash</button>
            <button className="p-2 bg-gray-200 rounded">Grid</button>
          </div>
        </div>
        <div className="bg-white p-4 rounded shadow">
          <table className="w-full text-left">
            <thead>
              <tr>
                <th className="p-2">Products</th>
                <th className="p-2">Stock</th>
                <th className="p-2">Price</th>
              </tr>
            </thead>
            <tbody>
              <tr className="border-t">
                <td className="p-2">Example product</td>
                <td className="p-2">10</td>
                <td className="p-2">$9.99 <span className="line-through text-gray-400">$10.59</span></td>
              </tr>
            </tbody>
          </table>
          <button className="mt-4 px-4 py-2 bg-green-500 text-white rounded">+ Products</button>
        </div>
      </div>
      
      <div className="w-1/3 bg-white p-8 flex flex-col items-center justify-center shadow">
        <div className="text-center">
          <img src="" alt="Cart" className="w-16 h-16 mx-auto mb-4" />
          <p className="text-lg">Your cart is empty.</p>
          <p className="text-gray-600">Click on the products to add them to the sale.</p>
        </div>
        <button className="mt-8 px-4 py-2 bg-gray-300 text-gray-700 rounded">Go to payment</button>
      </div>
    </div>
  </body>
</html>

 )
}