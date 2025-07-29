package Supplement_store.Suplement_store.repositories;

import Supplement_store.Suplement_store.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
