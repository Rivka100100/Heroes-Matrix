using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Matrix
{
    [EnableCors("*", "*", "*")]

    [RoutePrefix("api/trainers")]
    public class TrainersController : ApiController
    {
        private TrainersLogic logic = new TrainersLogic();

        //get all trainers (used for testing)

        [HttpGet]
        [Route("")]
        public HttpResponseMessage GetAllTeainers()
        {
            try
            {
                List<TrainerDTO> trainers = logic.GetAllTrainers();
                return Request.CreateResponse(HttpStatusCode.OK, trainers);
        }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(
                    HttpStatusCode.InternalServerError,
                        ErrorsManager.GetInnerMessage(ex));
            }
        }

        //add new trainer

        [HttpPost]
        [Route("")]
        public HttpResponseMessage AddTrainer(TrainerDTO trainer)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest,
                        ErrorsManager.GetErrors(ModelState));
                }

                TrainerDTO addedTrainer = logic.AddTrainer(trainer);
                return Request.CreateResponse(HttpStatusCode.Created, addedTrainer);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(
                    HttpStatusCode.InternalServerError,
                        ErrorsManager.GetInnerMessage(ex));
            }
        }

        //select one trainer by credentials: username+password (used by login)

        [HttpGet]
        [Route("byCredentials/{username}/{password}")]
        public HttpResponseMessage GetTrainerByTrainerNameAndPassword(string username, string password)
        {
            try
            {
                TrainerDTO trainer = logic.GetTrainerByTrainerNameAndPassword(username, password);
                if (trainer == null)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.OK, trainer);
                }
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(
                    HttpStatusCode.InternalServerError,
                        ErrorsManager.GetInnerMessage(ex));
            }
        }       
    }
}
