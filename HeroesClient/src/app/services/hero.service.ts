import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Hero } from '../models/hero';

@Injectable({
  providedIn: 'root',
})
export class HeroService {
  public constructor(private httpClient: HttpClient) {}

  public getAllHeroesAsync(): Observable<Hero[]> {
    return this.httpClient.get<Hero[]>('https://localhost:44308/api/heroes');
  }

  public getHeroesByTrainersIDAsync(id: number): Observable<Hero[]> {
    return this.httpClient.get<Hero[]>(
      'https://localhost:44308/api/heroes/getHeroesByTrainersID/' + id
    );
  }
}
