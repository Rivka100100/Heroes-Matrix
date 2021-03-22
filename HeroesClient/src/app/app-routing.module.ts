import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HeroCardComponent } from './components/hero-card/hero-card.component';
import { HeroesComponent } from './components/heroes/heroes.component';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { MyHeroesComponent } from './components/my-heroes/my-heroes.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { RegisterTrainerComponent } from './components/register-trainer/register-trainer.component';
import { LoginPageGuardService } from './services/login-page-guard.service';
import { LoginTrainerGuardService } from './services/login-trainer-guard.service';

const routes: Routes = [
  { path: 'home', component: HomeComponent },
  {
    path: 'login',
    canActivate: [LoginPageGuardService],
    component: LoginComponent,
  },
  {
    path: 'logout',
    canActivate: [LoginTrainerGuardService],
    component: LogoutComponent,
  },
  {
    path:
      'hero-card/:id/:firstName/:lastName/:trainerID/:ability/:startTrainingDate/:ColorDescription/:startingPower/:currentPower',
    canActivate: [LoginTrainerGuardService],
    component: HeroCardComponent,
  },
  {
    path: 'heroes',
    canActivate: [LoginTrainerGuardService],
    component: HeroesComponent,
  },
  {
    path: 'my-heroes',
    canActivate: [LoginTrainerGuardService],
    component: MyHeroesComponent,
  },
  { path: 'register-trainer', component: RegisterTrainerComponent },
  { path: '', pathMatch: 'full', redirectTo: '/home' },
  { path: '**', component: PageNotFoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
