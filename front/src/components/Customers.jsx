const Customers = () => {
    return (
      <div className="min-h-screen bg-gray-100 p-8">
        <div className="max-w-7xl mx-auto bg-white shadow-md rounded-md p-8">
          <header className="flex justify-between items-center mb-6">
            <h1 className="text-2xl font-semibold">Customers</h1>
            <div className="flex items-center space-x-4">
              <button className="bg-gray-200 p-2 rounded-full">Help</button>
              <div className="flex items-center space-x-2">
                <div className="w-8 h-8 bg-gray-300 rounded-full"></div>
                <span>Pedro</span>
              </div>
            </div>
          </header>
          <div className="flex justify-between items-center mb-4">
            <input
              type="text"
              placeholder="Search by name"
              className="w-1/3 p-2 border rounded-md"
            />
            <div className="flex space-x-2">
              <button className="bg-gray-200 p-2 rounded-md">Generate Report</button>
              <button className="bg-green-500 text-white p-2 rounded-md">+ Customer</button>
            </div>
          </div>
          <table className="min-w-full bg-white">
            <thead>
              <tr>
                <th className="py-2 px-4 border-b">Name</th>
                <th className="py-2 px-4 border-b">Cellphone/WhatsApp</th>
                <th className="py-2 px-4 border-b">Email</th>
                <th className="py-2 px-4 border-b">Account Balance</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td className="py-2 px-4 border-b flex items-center">
                  <div className="w-8 h-8 bg-gray-300 rounded-full flex items-center justify-center text-white mr-2">YE</div>
                  <span>yeuri</span>
                </td>
                <td className="py-2 px-4 border-b"></td>
                <td className="py-2 px-4 border-b"></td>
                <td className="py-2 px-4 border-b">$0.00</td>
                <td className="py-2 px-4 border-b">
                  <button className="bg-red-500 text-white p-1 rounded-md">Delete</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    );
  };
  
  export default Customers;