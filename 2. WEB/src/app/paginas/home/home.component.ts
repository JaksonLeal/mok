import { Component, OnInit } from '@angular/core';
import { personaje } from 'src/app/modelo/personaje';
import { PersonajesService } from 'src/app/servicios/personajes.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  public personajes: personaje[] = [];
  public filterPersonaje:any = "";

  public page!:number;

  constructor( private personajesService: PersonajesService) { }

  ngOnInit(): void {

    this.personajesService.listarPersonajes().subscribe( (data:any) => {
      this.personajes = data.results;
      console.log(this.personajes);
    }
    );
    
  }

}



