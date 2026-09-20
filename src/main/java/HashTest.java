import org.mindrot.jbcrypt.BCrypt;

public class HashTest {

    public static void main(String[] args) {

        String adminHash =
                BCrypt.hashpw("Admin@123", BCrypt.gensalt());

        String sellerHash =
                BCrypt.hashpw("Seller@123", BCrypt.gensalt());

        String buyerHash =
                BCrypt.hashpw("Buyer@123", BCrypt.gensalt());

        System.out.println("ADMIN HASH:");
        System.out.println(adminHash);

        System.out.println();

        System.out.println("SELLER HASH:");
        System.out.println(sellerHash);

        System.out.println();

        System.out.println("BUYER HASH:");
        System.out.println(buyerHash);
    }
}