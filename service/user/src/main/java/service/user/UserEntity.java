package service.user;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class UserEntity {

  @Id
  @GeneratedValue
  private int id;

  private String name;
}
