import { Component, OnInit } from '@angular/core';
import { Hero } from 'src/app/models/hero';
import { HeroService } from 'src/app/services/hero.service';
@Component({
  selector: 'app-my-heroes',
  templateUrl: './my-heroes.component.html',
  styleUrls: ['./my-heroes.component.css'],
})
export class MyHeroesComponent implements OnInit {
  public constructor(private heroService: HeroService) {} // DI

  public allHeroes: Hero[];

  ngOnInit(): void {
    let trainer: any = localStorage.getItem('trainer');
    trainer = JSON.parse(trainer);
    alert('Trainer ID: ' + trainer.TrainerID);
    this.heroService.getHeroesByTrainersIDAsync(trainer.TrainerID).subscribe(
      (heroes) => {
        this.allHeroes = heroes;
        console.log(this.allHeroes);
      },
      (err) => {
        alert(err.message);
      },
      () => console.log('Done.')
    );
  }
}
