package Supplement_store.Suplement_store.repositories;

import Supplement_store.Suplement_store.entities.CartItem;
import Supplement_store.Suplement_store.entities.User;
import Supplement_store.Suplement_store.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    List<CartItem> findByUser(User user);
    CartItem findByUserAndProduct(User user, Product product);
}