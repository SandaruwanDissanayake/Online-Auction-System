package lk.jiat.auction.ejb.bean;


import jakarta.ejb.Stateless;
import lk.jiat.auction.core.model.Product;
import lk.jiat.auction.ejb.remote.ProductService;


import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

@Stateless
public class ProductServiceSessionBean implements ProductService {

    // Thread-safe list for product storage
    private static final List<Product> products = new CopyOnWriteArrayList<>();
    private static final AtomicInteger idGenerator = new AtomicInteger(1);

    // Initialize with sample data
    static {
        products.add(new Product(idGenerator.getAndIncrement(), "Test Product 1", 1000.00, "Test Description", 3));
        products.add(new Product(idGenerator.getAndIncrement(), "Test Product 2", 2000.00, "Test Description", 5));
    }

    @Override
    public Product getProductById(int id) {
        return products.stream()
                .filter(p -> p.getId() == id)
                .findFirst()
                .orElse(null);
    }

    @Override
    public List<Product> getAllProducts() {
        return new ArrayList<>(products); // Return a copy
    }

    @Override
    public void addProduct(Product product) {
        product.setId(idGenerator.getAndIncrement());
        products.add(product);
    }

    @Override
    public void updateProduct(Product updatedProduct) {
        products.replaceAll(p ->
                p.getId() == updatedProduct.getId() ? updatedProduct : p
        );
    }

    @Override
    public void deleteProduct(Product product) {
        products.removeIf(p -> p.getId() == product.getId());
    }
}
