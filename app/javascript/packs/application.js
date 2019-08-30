import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "../plugins/flatpickr"
import { initStarRating } from '../plugins/init_star_rating';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
initStarRating();
