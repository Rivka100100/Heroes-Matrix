import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-hero-card',
  templateUrl: './hero-card.component.html',
  styleUrls: ['./hero-card.component.css'],
})
export class HeroCardComponent implements OnInit {
  constructor(private activatedRoute: ActivatedRoute) {}
  public heroID: string;
  public trainerID: number;
  public heroFirstName: string;
  public heroLastName: string;
  public heroAbility: string;
  public heroStartTrainingDate: Date;
  public heroSuitColorsID: number;
  public heroStartingPower: number;
  public heroCurrentPower: number;
  public colorDescription: string;

  ngOnInit(): void {
    this.heroID = this.activatedRoute.snapshot.params.id;
    this.trainerID = +this.activatedRoute.snapshot.params.trainerID;
    this.heroFirstName = this.activatedRoute.snapshot.params.firstName;
    this.heroLastName = this.activatedRoute.snapshot.params.lastName;
    this.heroAbility = this.activatedRoute.snapshot.params.ability;
    this.heroStartTrainingDate = this.activatedRoute.snapshot.params.startTrainingDate;
    this.heroStartingPower = this.activatedRoute.snapshot.params.startingPower;
    this.heroCurrentPower = this.activatedRoute.snapshot.params.currentPower;
    this.colorDescription = this.activatedRoute.snapshot.params.ColorDescription;
  }
}
