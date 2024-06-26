
class UPricingCalculate {

  // Calcutale price based on tax and shipping
  static double calcutaleTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalprice = productPrice + taxAmount + shippingCost;
    return totalprice;
  }

  // Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  // Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // looking the tax rate use tax rate datebase or Api
    // Calculate the shipping cost based on various factors like distance, weight, etc
    return 0.10; //Example shipping cost of $5
  }

  static double getShippingCost(String location) {
     // looking the shipping cost use shipping rate Api
    // Calculate the shipping cost based on various factors like distance, weight, etc
    return 5.00;//Example shipping cost of $5
  }

  // sum up total price for cart
  
  // static double calcutaleTotalPrice(CartModel cart) {
  //   return cart.items.maps((e) => e.price).fold(0,(previousPrice, currentPrice) => previousPrice +(currentPrice ?? 0));
  // }
}