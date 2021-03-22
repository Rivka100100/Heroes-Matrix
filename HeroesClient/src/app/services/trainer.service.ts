import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Credentials } from '../models/credentials';
import { Trainer } from '../models/Trainer';

@Injectable({
  providedIn: 'root',
})
export class TrainerService {
  public constructor(private httpClient: HttpClient) {}

  public getAlltrainerAsync(): Observable<Trainer[]> {
    return this.httpClient.get<Trainer[]>(
      'https://localhost:44308/api/trainers'
    );
  }

  public addTrainer(trainer: Trainer): Observable<Trainer> {
    return this.httpClient.post<Trainer>(
      'https://localhost:44308/api/trainers',
      trainer
    );
  }

  public login(credentials: Credentials): Observable<Trainer> {
    return this.httpClient.get<Trainer>(
      'https://localhost:44308/api/trainers/byCredentials/' +
        /* 'rherman/' +
        '123456' */
        credentials.trainerUsername +
        '/' +
        credentials.trainerPassword
    );
  }
}
