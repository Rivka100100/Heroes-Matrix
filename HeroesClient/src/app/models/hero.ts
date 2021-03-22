export class Hero {
  public constructor(
    public heroID?: string,
    public trainerID?: number,
    public heroFirstName?: string,
    public heroLastName?: string,
    public HeroAbility?: string,
    public HeroStartTrainingDate?: Date,
    public HeroSuitColorsID?: number,
    public HeroStartingPower?: number,
    public HeroCurrentPower?: number,
    public ColorDescription?: string
  ) {}
}
