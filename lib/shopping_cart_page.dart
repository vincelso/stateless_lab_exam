import 'package:flutter/material.dart';

const Color kBlue = Color(0xFF1F5FE0);
const Color kNavy = Color(0xFF0F1B4C);
const Color kLightBlue = Color(0xFFDCE8FD);
const Color kBorder = Color(0xFFD9DEE8);
const Color kGrey = Color(0xFF4A5068);

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  static const String studentName = 'Vincent Celso Salotillo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kNavy),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
              color: kNavy, fontWeight: FontWeight.w800, fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () => debugPrint('Cart clicked'),
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_bag_outlined,
                      color: kNavy, size: 30),
                  Positioned(
                    right: -8,
                    top: -8,
                    child: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: kBlue, shape: BoxShape.circle),
                      child: const Text(
                        '3',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIntro(),
              const SizedBox(height: 16),
              _buildDeliveryCard(),
              const SizedBox(height: 20),
              _buildOrderHeader(),
              const SizedBox(height: 12),
              const CartItemCard(
                  name: 'Wireless Mouse',
                  price: 'PHP 450.00',
                  quantity: 1,
                  icon: Icons.mouse_outlined),
              const SizedBox(height: 12),
              const CartItemCard(
                  name: 'USB-C Hub',
                  price: 'PHP 850.00',
                  quantity: 1,
                  icon: Icons.usb),
              const SizedBox(height: 12),
              const CartItemCard(
                  name: 'Laptop Stand',
                  price: 'PHP 700.00',
                  quantity: 1,
                  icon: Icons.laptop_mac),
              const SizedBox(height: 16),
              _buildDiscountBanner(),
              const SizedBox(height: 16),
              _buildPaymentSummary(),
              const SizedBox(height: 16),
              _buildPlaceOrderButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: kLightBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
                color: kBlue,
                fontWeight: FontWeight.w800,
                fontSize: 13,
                letterSpacing: 0.5),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Ready for checkout',
          style: TextStyle(
              color: kNavy, fontSize: 32, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 4),
        const Text(
          'Review your items before placing your order.',
          style: TextStyle(color: kGrey, fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildDeliveryCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorder),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: kBlue, size: 30),
          const SizedBox(width: 12),
          Container(width: 1, height: 40, color: kBorder),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to $studentName',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kNavy,
                      fontWeight: FontWeight.w800,
                      fontSize: 16),
                ),
                SizedBox(height: 2),
                Text('Matina, Davao City',
                    style: TextStyle(color: kGrey, fontSize: 14)),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            child: const Text(
              'Change',
              style: TextStyle(
                  color: kBlue, fontWeight: FontWeight.w800, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Order Items',
            style: TextStyle(
                color: kNavy, fontSize: 22, fontWeight: FontWeight.w800)),
        Text('3 items', style: TextStyle(color: kGrey, fontSize: 15)),
      ],
    );
  }

  Widget _buildDiscountBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.sell_outlined, color: kBlue, size: 28),
          const SizedBox(width: 12),
          Container(width: 1, height: 38, color: const Color(0xFF9DB0D6)),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STUDENT10 applied',
                    style: TextStyle(
                        color: kBlue,
                        fontWeight: FontWeight.w800,
                        fontSize: 17)),
                Text('10% discount on items',
                    style: TextStyle(color: kGrey, fontSize: 14)),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: kBlue, size: 34),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Payment Summary',
              style: TextStyle(
                  color: kNavy, fontSize: 22, fontWeight: FontWeight.w800)),
          SizedBox(height: 10),
          _SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          _SummaryRow(label: 'Discount (10%)', amount: '− PHP 200.00'),
          _SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: kBorder, thickness: 1.5, height: 1),
          ),
          _SummaryRow(
              label: 'Total', amount: 'PHP 1,850.00', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () =>
            debugPrint('Place order clicked! Total: PHP 1850.00'),
        icon: const Icon(Icons.lock, color: Colors.white),
        label: const Text(
          'Place Order',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlue,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const _SummaryRow({
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: kNavy,
      fontSize: isTotal ? 24 : 17,
      fontWeight: isTotal ? FontWeight.w900 : FontWeight.w400,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(amount, style: style),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kNavy, size: 44),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: kNavy,
                      fontWeight: FontWeight.w800,
                      fontSize: 17),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: const TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.w800,
                      fontSize: 17),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onTap: () => debugPrint('Decrease quantity: $name'),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 46,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                            color: kNavy,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _QtyButton(
                      icon: Icons.add,
                      onTap: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            icon: const Icon(Icons.delete_outline, color: kGrey, size: 28),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 38,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kBlue, width: 2),
        ),
        child: Icon(icon, color: kBlue, size: 20),
      ),
    );
  }
}