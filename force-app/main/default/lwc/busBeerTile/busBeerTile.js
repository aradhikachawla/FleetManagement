import { LightningElement, api } from 'lwc';
const TILE_WRAPPER_UNSELECTED_CLASS = "tile-wrapper";
const TILE_WRAPPER_SELECTED_CLASS = "tile-wrapper selected"

export default class BusBeerTile extends LightningElement {
@api busRec; 
@api selectedBus='';

get tileClass() {
          return this.selectedBus ? TILE_WRAPPER_UNSELECTED_CLASS : TILE_WRAPPER_SELECTED_CLASS;
          }

@api selectBus(event){ 
          this.selectedBus=!this.selectedBus;
          event.preventDefault(); 
                 
          const busSelect = new CustomEvent("busselect", 
          {
                    detail:this.busRec.Id
          });

this.dispatchEvent(busSelect);
}

}