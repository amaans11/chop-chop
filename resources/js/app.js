require('./bootstrap');
import LoadImage from 'blueimp-load-image';
import Alpine from 'alpinejs';
import { v5 as uuidv5 } from 'uuid';
import { Iodine } from '@kingshott/iodine';

const iodine = new Iodine();


window.Alpine = Alpine;
window.LoadImage = LoadImage;
window.uuidv5 = uuidv5;

Alpine.start();
