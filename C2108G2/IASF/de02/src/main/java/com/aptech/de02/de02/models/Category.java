package com.aptech.de02.de02.models;
import jakarta.persistence.*;
import lombok.*;

import javax.swing.table.TableColumn;

@Entity
@Table(name = "categories")
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@Data//toString
public class Category {
    @Id
    @Column(name = "category_id")
    private String categoryID;

    @Column(name = "category_name")
    private String categoryName;

    @Column(name = "description")
    private String description;
}