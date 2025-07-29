package Supplement_store.Suplement_store.repositories;

import Supplement_store.Suplement_store.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
