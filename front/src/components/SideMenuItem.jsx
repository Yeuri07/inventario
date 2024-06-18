// ---

// interface Props {
//     href?: string;
// }

// const { href } = Astro.props
// ---
import { Link } from 'react-router-dom'
// eslint-disable-next-line react/prop-types
export default function SideMenuItem ({href, children }){
    console.log(href)
    return(
        
    <li className="hover:bg-gray-600 rounded-lg">
    
        <Link to={href} className="flex gap-4 text-white hover:text-zinc-100 items-center p-5 cursor-pointer"
        >{ children }
        
        </Link>

     </li>
    )
}