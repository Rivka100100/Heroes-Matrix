using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Matrix.Controllers
{
    [EnableCors("*", "*", "*")]

    [RoutePrefix("api/heroes")]
    public class HeroesController : ApiController
    {
        private HeroesLogic logic = new HeroesLogic();

        //get all heroes which are not assigned to specific trainer

        [HttpGet]
        [Route("")]
        public HttpResponseMessage GetAllAvailableHeroes()
        {
            try
            {
                List<HeroDTO> heroes = logic.GetAllAvailableHeroes();
                return Request.CreateResponse(HttpStatusCode.OK, heroes);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(
                    HttpStatusCode.InternalServerError,
                        ErrorsManager.GetInnerMessage(ex));
            }
        }

        //get all heroes which are assigned to a specific trainer

        [HttpGet]
        [Route("getHeroesByTrainersID/{trainerID}")]
        
        public List<HeroDTO> GetHeroesByTrainersID(int trainerID)
        {
            return logic.GetHeroesByTrainersID(trainerID);
        }
    }
}

