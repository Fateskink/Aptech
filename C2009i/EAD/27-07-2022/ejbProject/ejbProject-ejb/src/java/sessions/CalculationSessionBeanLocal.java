/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sessions;

import javax.ejb.Local;

@Local
public interface CalculationSessionBeanLocal {
    public int sum(int x, int y);
}
