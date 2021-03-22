import { Injectable } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  CanActivate,
  Router,
  RouterStateSnapshot,
} from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class LoginTrainerGuardService implements CanActivate {
  constructor(private router: Router) {}

  public canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): boolean {
    let trainer = localStorage.getItem('trainer');
    if (trainer === null) {
      alert('Please log in');
      this.router.navigate(['/login']);
      return false;
    }
    return true;
  }
}
