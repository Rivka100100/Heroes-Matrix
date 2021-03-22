using System.ComponentModel.DataAnnotations;

namespace Matrix
{
    public class TrainerDTO
    {
        public int TrainerID { get; set; }

        //validation
        [Required(ErrorMessage = "Missing usename")]
        [MinLength(2, ErrorMessage = "Usename must be minimum 2 chars")]
        [MaxLength(30, ErrorMessage = "Username must be maximum 10 chars")]
        public string TrainerUsername { get; set; }

        //validation
        [RegularExpression(@"^(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,10}$",
         ErrorMessage = "Characters are not allowed.")]
        public string TrainerPassword { get; set; }
    }
}
