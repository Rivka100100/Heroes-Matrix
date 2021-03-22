import { Component, OnInit } from '@angular/core';
import { Trainer } from 'src/app/models/Trainer';
import { TrainerService } from 'src/app/services/trainer.service';

@Component({
  selector: 'app-register-trainer',
  templateUrl: './register-trainer.component.html',
  styleUrls: ['./register-trainer.component.css'],
})
export class RegisterTrainerComponent implements OnInit {
  public trainer = new Trainer();
  constructor(private trainerservice: TrainerService) {}

  ngOnInit(): void {}
  public addTrainer(): void {
    this.trainerservice.addTrainer(this.trainer).subscribe(
      (p) => alert('Trainer added.'), // ID: ' + p.TrainerID),
      (err) => alert('username or password not valid')
    );
  }
}
