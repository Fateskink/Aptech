
package services;

@Path("/computers")
public class ComputerWebService {
    private EntityManagerFactory emf;
    private EntityManager em;

    public ComputerWebService() {
        emf = Persistence.createEntityManagerFactory("YourPersistenceUnit"); // Replace with your persistence unit name
        em = emf.createEntityManager();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Computer> getAllComputers() {
        List<Computer> computers = em.createNamedQuery("Computer.findAll", Computer.class).getResultList();
        return computers;
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Computer getComputerById(@PathParam("id") String id) {
        Computer computer = em.find(Computer.class, id);
        return computer;
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addComputer(Computer computer) {
        em.getTransaction().begin();
        em.persist(computer);
        em.getTransaction().commit();
        return Response.status(Response.Status.CREATED).build();
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response updateComputer(@PathParam("id") String id, Computer updatedComputer) {
        Computer computer = em.find(Computer.class, id);
        if (computer != null) {
            em.getTransaction().begin();
            computer.setName(updatedComputer.getName());
            computer.setPrice(updatedComputer.getPrice());
            computer.setManufacturer(updatedComputer.getManufacturer());
            em.getTransaction().commit();
            return Response.status(Response.Status.OK).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @DELETE
    @Path("/{id}")
    public Response deleteComputer(@PathParam("id") String id) {
        Computer computer = em.find(Computer.class, id);
        if (computer != null) {
            em.getTransaction().begin();
            em.remove(computer);
            em.getTransaction().commit();
            return Response.status(Response.Status.OK).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }
}