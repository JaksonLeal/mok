import { Pipe, PipeTransform } from '@angular/core';
import { personaje } from '../modelo/personaje';

@Pipe({
  name: 'filter'
})
export class FilterPipe implements PipeTransform {

  transform(value: personaje[], arg: any): any {
    const resultadoPersonaje = [];

    for (const personaje of value) {
      if (personaje.name.toLowerCase().indexOf(arg.toLowerCase()) > -1
        || personaje.type.toLowerCase().indexOf(arg.toLowerCase()) > -1
        || personaje.dimension.toLowerCase().indexOf(arg.toLowerCase()) > -1
        || personaje.created.toLowerCase().indexOf(arg.toLowerCase()) > -1) {
        resultadoPersonaje.push(personaje);

      }

    }


    return resultadoPersonaje;
  }

}
