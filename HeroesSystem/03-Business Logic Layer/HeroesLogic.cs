using System.Collections.Generic;
using System.Linq;


namespace Matrix
{
    public class HeroesLogic:BaseLogic
    {
        //get all heroes which are not assigned to a trainer
        public List<HeroDTO> GetAllAvailableHeroes()
        {
            var q = from h in DB.Heroes
                    join c in DB.Colors on h.HeroSuitColorsID equals c.ColorID
                    where h.TrainerID==null
                    select new HeroDTO                 
                    {
                        HeroID = h.HeroID,
                        TrainerID = h.TrainerID,
                        HeroFirstName=h. HeroFirstName,
                        HeroLastName=h.HeroLastName,
                        HeroAbility=h.HeroAbility,
                        HeroStartTrainingDate=h.HeroStartTrainingDate,
                        HeroSuitColorsID=h.HeroSuitColorsID,
                        HeroStartingPower=h.HeroStartingPower,
                        HeroCurrentPower=h.HeroCurrentPower,
                        ColorDescription=c.ColorDescription
                    };

            return q.ToList();
        }

        //get all heroes which are assigned to a specific trainer

        public List<HeroDTO> GetHeroesByTrainersID(int trainerID)
        {
            var q = from h in DB.Heroes
                    join c in DB.Colors on h.HeroSuitColorsID equals c.ColorID
                    where h.TrainerID== trainerID
                    select new HeroDTO
                    {
                        HeroID = h.HeroID,
                        TrainerID = h.TrainerID,
                        HeroFirstName = h.HeroFirstName,
                        HeroLastName = h.HeroLastName,
                        HeroAbility = h.HeroAbility,
                        HeroStartTrainingDate = h.HeroStartTrainingDate,
                        HeroSuitColorsID = h.HeroSuitColorsID,
                        HeroStartingPower = h.HeroStartingPower,
                        HeroCurrentPower = h.HeroCurrentPower,
                        ColorDescription = c.ColorDescription
                    };

            return q.ToList();
        }
    }
}
