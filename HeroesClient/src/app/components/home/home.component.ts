import { Component, OnInit } from '@angular/core';
import { Trainer } from 'src/app/models/Trainer';
import { TrainerService } from 'src/app/services/trainer.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  public constructor(private trainerService: TrainerService) {} // DI

  public allTrainers: Trainer[];

  ngOnInit(): void {
    /* this.trainerService.getAlltrainerAsync().subscribe(
      (trainers) => {
        this.allTrainers = trainers;
        console.log(this.allTrainers);
      },
      (err) => {
        alert(err.message);
      },
      () => console.log('Done.')
    ); */
  }
}
