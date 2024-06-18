
import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);

const Analytics = () => {
  const data = {
    labels: [
      '0h', '1h', '2h', '3h', '4h', '5h', '6h', '7h', '8h', '9h', '10h', '11h', '12h', '13h', '14h', '15h', '16h', '17h', '18h', '19h', '20h', '21h', '22h', '23h',
    ],
    datasets: [
      {
        label: 'Revenue',
        data: [0, 0, 12, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 19.98, 0, 0, 0, 0, 0, 0, 10, 1, 0],
        borderColor: 'rgba(75, 192, 192, 1)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
      },
    ],
  };

  return (
    <div className="min-h-screen bg-gray-100 p-8">
      <div className="max-w-7xl mx-auto bg-white shadow-md rounded-md p-8">
        <header className="flex justify-between items-center mb-6">
          <h1 className="text-2xl font-semibold">Analytics</h1>
          <div className="flex items-center space-x-4">
            <button className="bg-gray-200 p-2 rounded-full">Help</button>
            <div className="flex items-center space-x-2">
              <div className="w-8 h-8 bg-gray-300 rounded-full flex items-center justify-center text-white">PE</div>
              <span>Yeuri</span>
            </div>
          </div>
        </header>
        <div className="flex">
          <div className="w-1/4 bg-gray-100 p-4 rounded-md mr-4">
            <h2 className="text-lg font-semibold mb-4">Analytics</h2>
            <input
              type="date"
              className="w-full p-2 border rounded-md mb-4"
              defaultValue="2023-06-15"
            />
            <div className="space-y-4">
              {['Revenue', 'Sales', 'Average Ticket Size', 'Profits', 'Sales Tax', 'Payment Method', 'Top Products'].map((item, index) => (
                <div key={index} className="p-4 bg-white rounded-md shadow">
                  <h3 className="font-semibold">{item}</h3>
                  <p className="text-xl font-bold">$19.98</p>
                  <p className="text-sm text-gray-500">Best hour 14h</p>
                </div>
              ))}
            </div>
          </div>
          <div className="w-3/4 bg-gray-100 p-4 rounded-md">
            <h2 className="text-lg font-semibold mb-4">Revenue</h2>
            <Line data={data} />
            <table className="min-w-full bg-white mt-4">
              <thead>
                <tr>
                  <th className="py-2 px-4 border-b">Hour</th>
                  <th className="py-2 px-4 border-b">Revenue</th>
                  <th className="py-2 px-4 border-b">Sales</th>
                  <th className="py-2 px-4 border-b">Average Ticket Size</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="py-2 px-4 border-b">14h</td>
                  <td className="py-2 px-4 border-b">$19.98</td>
                  <td className="py-2 px-4 border-b">1</td>
                  <td className="py-2 px-4 border-b">$19.98</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Analytics;