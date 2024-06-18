

export default function ProductosMain(){
    return(

<html lang="en">
  <head>
    <title>Items Component</title>
  </head>
  <body className="bg-gray-100 text-gray-900 font-sans">
    <div className="min-h-screen p-8">

      <header className="flex items-center justify-between mb-4">
        <h1 className="text-2xl font-semibold">Items <span className="text-gray-500">1 registered item</span></h1>
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

  
      <div className="flex items-center space-x-4 mb-4">
        <input type="text" placeholder="Item or code" className="flex-grow p-2 border border-gray-300 rounded" />
        <button className="p-2 bg-gray-200 rounded">Filter</button>
        <button className="p-2 bg-gray-200 rounded">Categories</button>
        <button className="p-2 bg-gray-200 rounded">Generate Report</button>
        <button className="p-2 bg-gray-200 rounded">QR</button>
        <button className="p-2 bg-green-500 text-white rounded">+ Product</button>
      </div>

  
      <div className="grid grid-cols-6 gap-4 mb-4">
        <div className="p-2 text-center">
          <p className="text-lg font-semibold">$105.90</p>
          <p className="text-sm text-gray-500">Total in stock</p>
        </div>
        <div className="p-2 text-center">
          <p className="text-lg font-semibold">$55.90</p>
          <p className="text-sm text-gray-500">Cost of stock</p>
        </div>
        <div className="p-2 text-center">
          <p className="text-lg font-semibold">$50.00</p>
          <p className="text-sm text-gray-500">Projected profit</p>
        </div>
        <div className="p-2 text-center">
          <p className="text-lg font-semibold">0</p>
          <p className="text-sm text-yellow-500">Low in stock</p>
        </div>
        <div className="p-2 text-center">
          <p className="text-lg font-semibold">0</p>
          <p className="text-sm text-red-500">Out of stock</p>
        </div>
        <div className="p-2 text-center">
          <p className="text-lg font-semibold">10</p>
          <p className="text-sm text-gray-500">In stock</p>
        </div>
      </div>


      <div className="bg-white p-4 rounded shadow">
        <table className="w-full text-left">
          <thead>
            <tr>
              <th className="p-2"><input type="checkbox" /></th>
              <th className="p-2">Products</th>
              <th className="p-2">Category</th>
              <th className="p-2">Stock</th>
              <th className="p-2">Price</th>
              <th className="p-2">Catalog</th>
              <th className="p-2">Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr className="border-t">
              <td className="p-2"><input type="checkbox" /></td>
              <td className="p-2 flex items-center space-x-2">
                <div className="w-8 h-8 bg-gray-300 flex items-center justify-center">
                  <span className="text-white">Ex</span>
                </div>
                <div>
                  <p>Example product</p>
                  <p className="text-sm text-gray-500">978020137962-X</p>
                </div>
              </td>
              <td className="p-2">Example category</td>
              <td className="p-2">10</td>
              <td className="p-2">$9.99 <span className="line-through text-gray-400">$10.59</span></td>
              <td className="p-2"><input type="checkbox" checked className="form-checkbox text-green-500" /> Yes</td>
              <td className="p-2"><button className="text-red-500">Delete</button></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </body>
</html>

    )
}