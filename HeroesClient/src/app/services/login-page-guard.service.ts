import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class LoginPageGuardService implements CanActivate {
  constructor() {}

  public canActivate(): boolean {
    let trainer: any = localStorage.getItem('trainer');

    //if trainer is not logged in
    if (trainer !== null) {
      alert('In Order to log in please log out first');
      return false;
    } else return true;
  }
}
