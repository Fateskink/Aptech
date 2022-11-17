package org.myapp.nguyenvana.models;
public class Result {
    //init function = constructor
    public Result() {
        //this.math = 0.0f;//no necessary
    }
    //factory method
    public static Result cloneFrom(Result result) {
        //full clone
        //return new Result(result.getMath(), result.getPhysics(), result.getChemistry());
        //partial clone
        Result newResult = new Result();
        newResult.setMath(result.getMath());
        newResult.setPhysics(result.getPhysics());
        return newResult;
    }
    //cloneFrom can be "non-static" => yes, but not good
    public Result cloneFrom1(Result result) {
        //full clone
        //return new Result(result.getMath(), result.getPhysics(), result.getChemistry());
        //partial clone
        Result newResult = new Result();
        newResult.setMath(result.getMath());
        newResult.setPhysics(result.getPhysics());
        return newResult;
    }
    public Result(float math, float physics, float chemistry) {
        this.math = math;
        this.physics = physics;
        this.chemistry = chemistry;
    }
    //fields
    private float math;
    private float physics;
    private float chemistry;

    //getter = methods to get value of fields
    //setter =  methods to change value of fields
    public float getMath() {
        return math;
    }

    public void setMath(float math) {
        this.math = math;
    }

    public float getPhysics() {
        return physics;
    }

    public void setPhysics(float physics) {
        this.physics = physics;
    }

    public float getChemistry() {
        return chemistry;
    }

    public void setChemistry(float chemistry) {
        this.chemistry = chemistry;
    }


    public void showDetail(){
        System.out.println(String.format("math = %f \n physics = %f,\n chemistry = %f"
                ,this.math, this.physics, this.chemistry));
    }

    @Override
    public String toString() {
        return "Result' details is: {" +
                "math=" + math +
                ", physics=" + physics +
                ", chemistry=" + chemistry +
                '}';
    }
}
