import { Component, OnInit } from '@angular/core';
import { Hero } from 'src/app/models/hero';
import { HeroService } from 'src/app/services/hero.service';

@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrls: ['./heroes.component.css'],
})
export class HeroesComponent implements OnInit {
  public constructor(private heroService: HeroService) {} // DI

  public allHeroes: Hero[];

  ngOnInit(): void {
    this.heroService.getAllHeroesAsync().subscribe(
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
  assainToTrainer(id: number) {
    alert('Hero assigned to trainer');
  }
}
