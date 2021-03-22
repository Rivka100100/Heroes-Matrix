using System;


namespace Matrix
{
    public class BaseLogic : IDisposable
    {
        protected HeroesEntities DB = new HeroesEntities();
        public void Dispose()
        {
            DB.Dispose();
        }
    }
}
