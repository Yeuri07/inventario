const AddProductos = () => {
    return (
      <div className="min-h-screen bg-gray-100 p-8">
        <div className="max-w-7xl mx-auto bg-white shadow-md rounded-md p-8">
          <header className="flex justify-between items-center mb-6">
            <h1 className="text-2xl font-semibold">Add a product</h1>
            <div className="flex items-center space-x-4">
              <button className="bg-gray-200 p-2 rounded-full">Help</button>
              <div className="flex items-center space-x-2">
                <div className="w-8 h-8 bg-gray-300 rounded-full"></div>
                <span>Yeuri</span>
              </div>
              <button className="bg-gray-200 p-2 rounded-full">Duplicate</button>
            </div>
          </header>
          <div className="flex space-x-8">
            <div className="w-2/3">
              <div className="bg-gray-100 p-4 rounded-md mb-6">
                <div className="flex justify-between items-center mb-4">
                  <span className="flex items-center space-x-2">
                    <input type="checkbox" className="form-checkbox" />
                    <span>Highlight product</span>
                  </span>
                  <span className="flex items-center space-x-2">
                    <span>Show on Online Catalog</span>
                    <input type="checkbox" className="form-checkbox" />
                  </span>
                </div>
                <div className="bg-gray-300 h-48 rounded-md mb-4"></div>
                <div className="flex justify-between">
                  <button className="bg-gray-200 p-2 rounded-md">Label color</button>
                  <button className="bg-gray-200 p-2 rounded-md">Photos</button>
                </div>
              </div>
              <form>
                <div className="space-y-4">
                  <input type="text" placeholder="Product name" className="w-full p-2 border rounded-md" />
                  <input type="text" placeholder="Price" className="w-full p-2 border rounded-md" />
                  <div>
                    <label className="block mb-1">Details</label>
                    <input type="text" placeholder="Reduced price" className="w-full p-2 border rounded-md mb-2" />
                    <span className="text-sm text-gray-500">Sales price will be crossed out, for example: from $10.00 for $5.00</span>
                  </div>
                  <input type="text" placeholder="Category" className="w-full p-2 border rounded-md" />
                  <input type="text" placeholder="Label name" className="w-full p-2 border rounded-md" />
                  <textarea placeholder="Description" className="w-full p-2 border rounded-md"></textarea>
                </div>
              </form>
            </div>
            <div className="w-1/3">
              <div className="bg-gray-100 p-4 rounded-md mb-4">
                <label className="block mb-1">Stock</label>
                <input type="text" placeholder="On hand" className="w-full p-2 border rounded-md mb-2" />
                <input type="text" placeholder="Minimum" className="w-full p-2 border rounded-md" />
              </div>
              <div className="bg-gray-100 p-4 rounded-md">
                <label className="block mb-1">Stock Movement</label>
                <button className="bg-gray-200 p-2 rounded-md mt-2 w-full">Show results</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };
  
  export default AddProductos;