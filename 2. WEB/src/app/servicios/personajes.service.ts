import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class PersonajesService {

public url:any = "https://rickandmortyapi.com/api/location?page=1";

  constructor(private http: HttpClient) { }

  public listarPersonajes(){
    return this.http.get(this.url);
  }
}
