import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Credentials } from 'src/app/models/credentials';
import { Trainer } from 'src/app/models/Trainer';
import { TrainerService } from 'src/app/services/trainer.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  constructor(private trainerService: TrainerService, private router: Router) {}

  public credentials = new Credentials();
  oneTrainer: Trainer;

  public login(): void {
    console.log(this.credentials);
    //now that we got the credentials from the trainer we can search for the right user details in the server
    this.trainerService.login(this.credentials).subscribe(
      (trainer) => {
        this.oneTrainer = trainer;
        //save user details to local storage
        localStorage.setItem('trainer', JSON.stringify(trainer));
        /*   this.showOkDiv = true;
          this.showErrorDiv = false; */
        alert(' You are logged in');
        console.log(trainer);
      },
      (err) => {
        //alert(err.message);
        if (err.status == 404) alert('Username or password are incorrect');
        /* this.showErrorDiv = true;
          this.showOkDiv = false; */
      },
      () => console.log('Done.')
    );
  }
}
