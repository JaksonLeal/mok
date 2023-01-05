import { Component, OnInit } from '@angular/core';
import { PersonajesService } from 'src/app/servicios/personajes.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor( private personajesService: PersonajesService) { }

  ngOnInit(): void {

    this.prueba();

  }

  prueba(){
    this.personajesService.listarPersonajes().subscribe( data => {
      console.log(data);
    }

    );
  }

}
