package Supplement_store.Suplement_store.repositories;

import Supplement_store.Suplement_store.entities.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {
}
