package Supplement_store.Suplement_store.repositories;

import Supplement_store.Suplement_store.entities.ProductVariant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductVariantRepository extends JpaRepository<ProductVariant, Long> {
}
