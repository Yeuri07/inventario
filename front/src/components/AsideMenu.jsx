
import Analytics from "../icons/Analytics.svg"
import Customers from "../icons/Customers.svg"
import Products from "../icons/Products.svg"
import SellIcon from "../icons/Sell.svg"
import Settings from "../icons/Settings.svg"
import ShoppingCart from "../icons/ShoppingCart.svg"
import Transactions from "../icons/Transactions.svg"
import Users from "../icons/Users.svg"
import SideMenuItem from "./SideMenuItem.jsx"


export default function AsideMenu (){

    return(
   
        <nav className="flex flex-col flex-1 gap-2">
    <div className="  rounded-lg p-2">
        <ul>
            <SideMenuItem href="/sell" >
            <img src={SellIcon} alt="sell-icon" />
                Sell
            </SideMenuItem>

            <SideMenuItem href="/order" >
                Order
                </SideMenuItem>
            <SideMenuItem href="/productos" >
            <img src={Products} alt="sell-icon" />
               Productos
            </SideMenuItem>

            <SideMenuItem href="/#" >
            <img src={ShoppingCart} alt="sell-icon" />
              Online Catalog
            </SideMenuItem>

            <SideMenuItem href="/#" >
            <img src={Customers} alt="sell-icon" />
               Customers
            </SideMenuItem>

            <SideMenuItem href="/#" >
            <img src={Transactions} alt="sell-icon" />
              Transactions
            </SideMenuItem>

            <SideMenuItem href="/#" >
            <img src={Analytics} alt="sell-icon" />
               Analytics
            </SideMenuItem>

            <SideMenuItem href="/#" >
            <img src={Users} alt="sell-icon" />
               Users
            </SideMenuItem>

            <SideMenuItem href="/#" >
            <img src={Settings} alt="sell-icon" />
               Setting
            </SideMenuItem>
        </ul>
    </div>

</nav>

 )
}