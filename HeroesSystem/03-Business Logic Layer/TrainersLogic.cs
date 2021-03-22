using System.Collections.Generic;
using System.Linq;
using System.Web.Security;


namespace Matrix
{
    public class TrainersLogic:BaseLogic
    {
        //get all trainers (used for testing)
        public List<TrainerDTO> GetAllTrainers()
        {
            var q = from t in DB.Trainers
                    select new TrainerDTO
                    {
                        TrainerID = t.TrainerID,
                        TrainerUsername=t.TrainerUsername,
                        TrainerPassword=t.TrainerPassword
                    };

            return q.ToList();
        }

        //add new trainer
        public TrainerDTO AddTrainer(TrainerDTO trainer)
        {
            string hashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(trainer.TrainerPassword, "sha1");

            Trainer trainerToAdd = new Trainer
            {
                TrainerUsername = trainer.TrainerUsername,
                TrainerPassword = hashPassword
            };

            DB.Trainers.Add(trainerToAdd);

            DB.SaveChanges();

            trainer.TrainerID = trainerToAdd.TrainerID;

            return trainer;
        }

        //select one trainer by username+password (used by login)
        public TrainerDTO GetTrainerByTrainerNameAndPassword(string username, string password)
        {
            string hashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "sha1");

            var q = from t in DB.Trainers
                    where t.TrainerUsername == username && t.TrainerPassword == hashPassword
                    select new TrainerDTO
                    {
                        TrainerID = t.TrainerID,
                        TrainerUsername = t.TrainerUsername,
                        TrainerPassword = t.TrainerPassword
                    };
            return q.FirstOrDefault();
        }
    }
}
