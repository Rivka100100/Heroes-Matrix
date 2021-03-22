

namespace Matrix
{
    public class HeroDTO
    {
        public System.Guid HeroID { get; set; }
        public int? TrainerID { get; set; }
        public string HeroFirstName { get; set; }
        public string HeroLastName { get; set; }
        public string HeroAbility { get; set; }
        public System.DateTime HeroStartTrainingDate { get; set; }
        public int HeroSuitColorsID { get; set; }
        public decimal HeroStartingPower { get; set; }
        public decimal HeroCurrentPower { get; set; }
        public string ColorDescription { get; set; }

    }
}
