import 'package:flutter/material.dart';

void main() {

  runApp(const WorldWalletApp());

}

// ============================================================

// WORLD WALLET V4

// ============================================================

class WorldWalletApp extends StatefulWidget {

  const WorldWalletApp({super.key});

  @override

  State<WorldWalletApp> createState() => _WorldWalletAppState();

}

class _WorldWalletAppState extends State<WorldWalletApp> {

  bool darkMode = false;

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'World Wallet',

      theme: ThemeData(

        useMaterial3: true,

        colorSchemeSeed: Colors.blue,

        brightness: Brightness.light,

      ),

      darkTheme: ThemeData(

        useMaterial3: true,

        colorSchemeSeed: Colors.blue,

        brightness: Brightness.dark,

      ),

      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,

      home: WalletHome(

        darkMode: darkMode,

        onDarkModeChanged: (value) {

          setState(() => darkMode = value);

        },

      ),

    );

  }

}

// ============================================================

// DATA MODELS

// ============================================================

class Offer {

  String name;

  String action;

  String currency;

  String wantedCurrency;

  double amount;

  double rate;

  String location;

  String payment;

  double rating;

  int trades;

  Offer({

    required this.name,

    required this.action,

    required this.currency,

    required this.wantedCurrency,

    required this.amount,

    required this.rate,

    required this.location,

    required this.payment,

    required this.rating,

    required this.trades,

  });

}

class WalletTransaction {

  String title;

  String subtitle;

  String amount;

  String currency;

  IconData icon;

  WalletTransaction({

    required this.title,

    required this.subtitle,

    required this.amount,

    required this.currency,

    required this.icon,

  });

}

// ============================================================

// MAIN WALLET

// ============================================================

class WalletHome extends StatefulWidget {

  final bool darkMode;

  final ValueChanged<bool> onDarkModeChanged;

  const WalletHome({

    super.key,

    required this.darkMode,

    required this.onDarkModeChanged,

  });

  @override

  State<WalletHome> createState() => _WalletHomeState();

}

class _WalletHomeState extends State<WalletHome> {

  int tab = 0;

  double usd = 600;

  double mad = 8500;

  double mwk = 300000;

  final List<Offer> offers = [

    Offer(

      name: 'Ahmed',

      action: 'Sell',

      currency: 'USD',

      wantedCurrency: 'MAD',

      amount: 500,

      rate: 10.05,

      location: 'Rabat',

      payment: 'Bank Transfer',

      rating: 5,

      trades: 38,

    ),

    Offer(

      name: 'Sarah',

      action: 'Buy',

      currency: 'USD',

      wantedCurrency: 'MAD',

      amount: 300,

      rate: 10.00,

      location: 'Salé',

      payment: 'Cash',

      rating: 4.8,

      trades: 21,

    ),

    Offer(

      name: 'Michael',

      action: 'Sell',

      currency: 'MAD',

      wantedCurrency: 'USD',

      amount: 5000,

      rate: 10.10,

      location: 'Casablanca',

      payment: 'Bank Transfer',

      rating: 4.9,

      trades: 62,

    ),

    Offer(

      name: 'Grace',

      action: 'Sell',

      currency: 'MWK',

      wantedCurrency: 'USD',

      amount: 500000,

      rate: 1750,

      location: 'Lilongwe',

      payment: 'Mobile Money',

      rating: 5,

      trades: 47,

    ),

  ];

  final List<WalletTransaction> history = [

    WalletTransaction(

      title: 'Initial Balance',

      subtitle: 'USD wallet',

      amount: '+600.00',

      currency: 'USD',

      icon: Icons.account_balance_wallet,

    ),

    WalletTransaction(

      title: 'Initial Balance',

      subtitle: 'MAD wallet',

      amount: '+8,500.00',

      currency: 'MAD',

      icon: Icons.account_balance_wallet,

    ),

    WalletTransaction(

      title: 'Initial Balance',

      subtitle: 'MWK wallet',

      amount: '+300,000',

      currency: 'MWK',

      icon: Icons.account_balance_wallet,

    ),

  ];

  @override

  Widget build(BuildContext context) {

    final pages = [

      _homePage(),

      _exchangePage(),

      _marketplacePage(),

      _sendPage(),

      _historyPage(),

      _settingsPage(),

    ];

    return Scaffold(

      appBar: AppBar(

        title: const Text(

          'World Wallet',

          style: TextStyle(fontWeight: FontWeight.bold),

        ),

        actions: [

          IconButton(

            onPressed: () {

              widget.onDarkModeChanged(!widget.darkMode);

            },

            icon: Icon(

              widget.darkMode

                  ? Icons.light_mode

                  : Icons.dark_mode_outlined,

            ),

          ),

        ],

      ),

      body: pages[tab],

      bottomNavigationBar: NavigationBar(

        selectedIndex: tab,

        onDestinationSelected: (value) {

          setState(() => tab = value);

        },

        destinations: const [

          NavigationDestination(

            icon: Icon(Icons.home_outlined),

            selectedIcon: Icon(Icons.home),

            label: 'Home',

          ),

          NavigationDestination(

            icon: Icon(Icons.currency_exchange_outlined),

            selectedIcon: Icon(Icons.currency_exchange),

            label: 'Exchange',

          ),

          NavigationDestination(

            icon: Icon(Icons.people_outline),

            selectedIcon: Icon(Icons.people),

            label: 'Market',

          ),

          NavigationDestination(

            icon: Icon(Icons.send_outlined),

            selectedIcon: Icon(Icons.send),

            label: 'Send',

          ),

          NavigationDestination(

            icon: Icon(Icons.history),

            label: 'History',

          ),

          NavigationDestination(

            icon: Icon(Icons.settings_outlined),

            selectedIcon: Icon(Icons.settings),

            label: 'Settings',

          ),

        ],

      ),

    );

  }

  // ==========================================================

  // HOME

  // ==========================================================

  Widget _homePage() {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(16),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Container(

            width: double.infinity,

            padding: const EdgeInsets.all(22),

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(24),

              gradient: const LinearGradient(

                colors: [Colors.blue, Colors.indigo],

              ),

            ),

            child: const Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Icon(

                  Icons.public,

                  color: Colors.white,

                  size: 45,

                ),

                SizedBox(height: 12),

                Text(

                  'Your World Wallet',

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 25,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                SizedBox(height: 5),

                Text(

                  'Hold, exchange and find people to trade currencies with.',

                  style: TextStyle(

                    color: Colors.white70,

                    fontSize: 14,

                  ),

                ),

              ],

            ),

          ),

          const SizedBox(height: 20),

          const Text(

            'Your balances',

            style: TextStyle(

              fontSize: 21,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 10),

          _balanceCard(

            'USD',

            usd,

            '\$',

            Colors.green,

          ),

          _balanceCard(

            'MAD',

            mad,

            'د.م.',

            Colors.orange,

          ),

          _balanceCard(

            'MWK',

            mwk,

            'MK',

            Colors.red,

          ),

          const SizedBox(height: 15),

          Row(

            children: [

              Expanded(

                child: FilledButton.icon(

                  onPressed: _deposit,

                  icon: const Icon(Icons.add),

                  label: const Text('Deposit'),

                ),

              ),

              const SizedBox(width: 10),

              Expanded(

                child: OutlinedButton.icon(

                  onPressed: _withdraw,

                  icon: const Icon(Icons.arrow_upward),

                  label: const Text('Withdraw'),

                ),

              ),

            ],

          ),

          const SizedBox(height: 25),

          const Text(

            'Quick actions',

            style: TextStyle(

              fontSize: 21,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 10),

          Row(

            children: [

              Expanded(

                child: _quickAction(

                  Icons.currency_exchange,

                  'Exchange',

                  () => setState(() => tab = 1),

                ),

              ),

              const SizedBox(width: 10),

              Expanded(

                child: _quickAction(

                  Icons.people,

                  'Marketplace',

                  () => setState(() => tab = 2),

                ),

              ),

            ],

          ),

          const SizedBox(height: 10),

          Row(

            children: [

              Expanded(

                child: _quickAction(

                  Icons.send,

                  'Send',

                  () => setState(() => tab = 3),

                ),

              ),

              const SizedBox(width: 10),

              Expanded(

                child: _quickAction(

                  Icons.history,

                  'History',

                  () => setState(() => tab = 4),

                ),

              ),

            ],

          ),

          const SizedBox(height: 25),

          const Text(

            'Recent activity',

            style: TextStyle(

              fontSize: 21,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          ...history.take(3).map(_transactionTile),

        ],

      ),

    );

  }

  Widget _balanceCard(

    String currency,

    double amount,

    String symbol,

    Color color,

  ) {

    return Card(

      margin: const EdgeInsets.only(bottom: 10),

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor: color.withOpacity(.15),

          child: Text(

            currency,

            style: TextStyle(

              color: color,

              fontWeight: FontWeight.bold,

              fontSize: 11,

            ),

          ),

        ),

        title: Text(

          currency,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

        subtitle: Text(symbol),

        trailing: Text(

          _number(amount),

          style: const TextStyle(

            fontSize: 18,

            fontWeight: FontWeight.bold,

          ),

        ),

      ),

    );

  }

  Widget _quickAction(

    IconData icon,

    String title,

    VoidCallback onTap,

  ) {

    return Card(

      child: InkWell(

        onTap: onTap,

        borderRadius: BorderRadius.circular(14),

        child: Padding(

          padding: const EdgeInsets.all(18),

          child: Column(

            children: [

              Icon(

                icon,

                size: 32,

                color: Colors.blue,

              ),

              const SizedBox(height: 8),

              Text(

                title,

                style: const TextStyle(

                  fontWeight: FontWeight.bold,

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

  // ==========================================================

  // EXCHANGE

  // ==========================================================

  Widget _exchangePage() {

    return ExchangePage(

      usd: usd,

      mad: mad,

      mwk: mwk,

      onExchange: (from, to, amount) {

        _performExchange(from, to, amount);

      },

    );

  }

  void _performExchange(

    String from,

    String to,

    double amount,

  ) {

    double rate;

    if (from == 'USD' && to == 'MAD') {

      rate = 10;

    } else if (from == 'MAD' && to == 'USD') {

      rate = .1;

    } else if (from == 'USD' && to == 'MWK') {

      rate = 1750;

    } else if (from == 'MWK' && to == 'USD') {

      rate = 1 / 1750;

    } else if (from == 'MAD' && to == 'MWK') {

      rate = 175;

    } else {

      rate = 1 / 175;

    }

    final fee = amount * .01;

    final converted = (amount - fee) * rate;

    if (!_subtract(from, amount)) {

      _message('Insufficient $from balance.');

      return;

    }

    _add(to, converted);

    history.insert(

      0,

      WalletTransaction(

        title: 'Currency Exchange',

        subtitle: '$from → $to',

        amount: '+${converted.toStringAsFixed(2)}',

        currency: to,

        icon: Icons.currency_exchange,

      ),

    );

    setState(() {});

    _message(

      'Exchange completed: ${converted.toStringAsFixed(2)} $to',

    );

  }

  bool _subtract(String currency, double amount) {

    if (currency == 'USD') {

      if (usd < amount) return false;

      usd -= amount;

    } else if (currency == 'MAD') {

      if (mad < amount) return false;

      mad -= amount;

    } else if (currency == 'MWK') {

      if (mwk < amount) return false;

      mwk -= amount;

    }

    return true;

  }

  void _add(String currency, double amount) {

    if (currency == 'USD') {

      usd += amount;

    } else if (currency == 'MAD') {

      mad += amount;

    } else if (currency == 'MWK') {

      mwk += amount;

    }

  }

  // ==========================================================

  // MARKETPLACE

  // ==========================================================

  Widget _marketplacePage() {

    return MarketplacePage(

      offers: offers,

      onTrade: _tradeWithPerson,

      onPost: _postOffer,

    );

  }

  void _postOffer() {

    String action = 'Sell';

    String currency = 'USD';

    String wanted = 'MAD';

    String location = 'Rabat';

    String payment = 'Bank Transfer';

    final amount = TextEditingController();

    final rate = TextEditingController();

    showModalBottomSheet(

      context: context,

      isScrollControlled: true,

      useSafeArea: true,

      builder: (sheetContext) {

        return StatefulBuilder(

          builder: (context, change) {

            return Padding(

              padding: EdgeInsets.only(

                left: 18,

                right: 18,

                top: 18,

                bottom:

                    MediaQuery.of(context).viewInsets.bottom + 18,

              ),

              child: SingleChildScrollView(

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const Text(

                      'Post an Offer',

                      style: TextStyle(

                        fontSize: 24,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                    const SizedBox(height: 15),

                    _dropdown(

                      'I want to',

                      action,

                      ['Sell', 'Buy'],

                      (v) => change(() => action = v!),

                    ),

                    _dropdown(

                      'Currency',

                      currency,

                      ['USD', 'MAD', 'MWK'],

                      (v) => change(() => currency = v!),

                    ),

                    _dropdown(

                      'I want',

                      wanted,

                      ['USD', 'MAD', 'MWK'],

                      (v) => change(() => wanted = v!),

                    ),

                    TextField(

                      controller: amount,

                      keyboardType:

                          const TextInputType.numberWithOptions(

                        decimal: true,

                      ),

                      decoration: const InputDecoration(

                        labelText: 'Amount',

                        border: OutlineInputBorder(),

                      ),

                    ),

                    const SizedBox(height: 10),

                    TextField(

                      controller: rate,

                      keyboardType:

                          const TextInputType.numberWithOptions(

                        decimal: true,

                      ),

                      decoration: InputDecoration(

                        labelText: 'Exchange rate',

                        hintText: 'Example: 10',

                        prefixText: '1 $currency = ',

                        suffixText: ' $wanted',

                        border: const OutlineInputBorder(),

                      ),

                    ),

                    const SizedBox(height: 10),

                    _dropdown(

                      'Payment method',

                      payment,

                      [

                        'Bank Transfer',

                        'Cash',

                        'Mobile Money',

                        'Card',

                      ],

                      (v) => change(() => payment = v!),

                    ),

                    _dropdown(

                      'Location',

                      location,

                      [

                        'Rabat',

                        'Salé',

                        'Casablanca',

                        'Fès',

                        'Lilongwe',

                        'Blantyre',

                      ],

                      (v) => change(() => location = v!),

                    ),

                    const SizedBox(height: 15),

                    SizedBox(

                      width: double.infinity,

                      height: 52,

                      child: FilledButton(

                        onPressed: () {

                          final a = double.tryParse(amount.text);

                          final r = double.tryParse(rate.text);

                          if (a == null || r == null || a <= 0 || r <= 0) {

                            _message('Enter a valid amount and rate.');

                            return;

                          }

                          setState(() {

                            offers.insert(

                              0,

                              Offer(

                                name: 'You',

                                action: action,

                                currency: currency,

                                wantedCurrency: wanted,

                                amount: a,

                                rate: r,

                                location: location,

                                payment: payment,

                                rating: 5,

                                trades: 0,

                              ),

                            );

                          });

                          Navigator.pop(sheetContext);

                          _message('Your offer is now live!');

                        },

                        child: const Text('Publish Offer'),

                      ),

                    ),

                  ],

                ),

              ),

            );

          },

        );

      },

    );

  }

  Widget _dropdown(

    String label,

    String value,

    List<String> items,

    ValueChanged<String?> onChanged,

  ) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 10),

      child: DropdownButtonFormField<String>(

        value: value,

        decoration: InputDecoration(

          labelText: label,

          border: const OutlineInputBorder(),

        ),

        items: items

            .map(

              (item) => DropdownMenuItem(

                value: item,

                child: Text(item),

              ),

            )

            .toList(),

        onChanged: onChanged,

      ),

    );

  }

  void _tradeWithPerson(Offer offer) {

    final amount = TextEditingController(

      text: offer.amount.toString(),

    );

    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          title: Text(

            offer.action == 'Sell'

                ? 'Buy from ${offer.name}'

                : 'Sell to ${offer.name}',

          ),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(

                '${offer.amount} ${offer.currency} available',

              ),

              const SizedBox(height: 5),

              Text(

                '1 ${offer.currency} = ${offer.rate} ${offer.wantedCurrency}',

              ),

              const SizedBox(height: 5),

              Text('Payment: ${offer.payment}'),

              const SizedBox(height: 15),

              TextField(

                controller: amount,

                keyboardType:

                    const TextInputType.numberWithOptions(

                  decimal: true,

                ),

                decoration: InputDecoration(

                  labelText: 'Amount ${offer.currency}',

                  border: const OutlineInputBorder(),

                ),

              ),

            ],

          ),

          actions: [

            TextButton(

              onPressed: () => Navigator.pop(context),

              child: const Text('Cancel'),

            ),

            FilledButton(

              onPressed: () {

                Navigator.pop(context);

                _message(

                  'Trade request sent to ${offer.name}.',

                );

              },

              child: const Text('Request Trade'),

            ),

          ],

        );

      },

    );

  }

  // ==========================================================

  // SEND

  // ==========================================================

  Widget _sendPage() {

    String currency = 'USD';

    final recipient = TextEditingController();

    final amount = TextEditingController();

    final note = TextEditingController();

    return StatefulBuilder(

      builder: (context, change) {

        return SingleChildScrollView(

          padding: const EdgeInsets.all(18),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(

                'Send Money',

                style: TextStyle(

                  fontSize: 26,

                  fontWeight: FontWeight.bold,

                ),

              ),

              const SizedBox(height: 5),

              Text(

                'Send currency to another World Wallet user.',

                style: TextStyle(

                  color: Colors.grey.shade600,

                ),

              ),

              const SizedBox(height: 25),

              _dropdown(

                'Currency',

                currency,

                ['USD', 'MAD', 'MWK'],

                (v) => change(() => currency = v!),

              ),

              TextField(

                controller: recipient,

                decoration: const InputDecoration(

                  labelText: 'Recipient',

                  hintText: 'Username or wallet ID',

                  prefixIcon: Icon(Icons.person),

                  border: OutlineInputBorder(),

                ),

              ),

              const SizedBox(height: 12),

              TextField(

                controller: amount,

                keyboardType:

                    const TextInputType.numberWithOptions(

                  decimal: true,

                ),

                decoration: InputDecoration(

                  labelText: 'Amount',

                  prefixIcon: const Icon(Icons.payments),

                  suffixText: currency,

                  border: const OutlineInputBorder(),

                ),

              ),

              const SizedBox(height: 12),

              TextField(

                controller: note,

                decoration: const InputDecoration(

                  labelText: 'Note (optional)',

                  prefixIcon: Icon(Icons.note),

                  border: OutlineInputBorder(),

                ),

              ),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,

                height: 52,

                child: FilledButton.icon(

                  onPressed: () {

                    final value = double.tryParse(amount.text);

                    if (recipient.text.trim().isEmpty ||

                        value == null ||

                        value <= 0) {

                      _message(

                        'Enter a recipient and valid amount.',

                      );

                      return;

                    }

                    if (!_subtract(currency, value)) {

                      _message(

                        'Insufficient $currency balance.',

                      );

                      return;

                    }

                    history.insert(

                      0,

                      WalletTransaction(

                        title: 'Money Sent',

                        subtitle: 'To ${recipient.text}',

                        amount: '-${value.toStringAsFixed(2)}',

                        currency: currency,

                        icon: Icons.send,

                      ),

                    );

                    setState(() {});

                    _message('Money sent successfully.');

                  },

                  icon: const Icon(Icons.send),

                  label: const Text('Send Money'),

                ),

              ),

            ],

          ),

        );

      },

    );

  }

  // ==========================================================

  // HISTORY

  // ==========================================================

  Widget _historyPage() {

    return ListView(

      padding: const EdgeInsets.all(16),

      children: [

        const Text(

          'Transaction History',

          style: TextStyle(

            fontSize: 26,

            fontWeight: FontWeight.bold,

          ),

        ),

        const SizedBox(height: 15),

        ...history.map(_transactionTile),

      ],

    );

  }

  Widget _transactionTile(WalletTransaction transaction) {

    return Card(

      margin: const EdgeInsets.only(bottom: 8),

      child: ListTile(

        leading: CircleAvatar(

          child: Icon(transaction.icon),

        ),

        title: Text(

          transaction.title,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

        subtitle: Text(transaction.subtitle),

        trailing: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.end,

          children: [

            Text(

              transaction.amount,

              style: const TextStyle(

                fontWeight: FontWeight.bold,

              ),

            ),

            Text(

              transaction.currency,

              style: TextStyle(

                color: Colors.grey.shade600,

                fontSize: 12,

              ),

            ),

          ],

        ),

      ),

    );

  }

  // ==========================================================

  // SETTINGS

  // ==========================================================

  Widget _settingsPage() {

    return ListView(

      padding: const EdgeInsets.all(16),

      children: [

        const Text(

          'Settings',

          style: TextStyle(

            fontSize: 26,

            fontWeight: FontWeight.bold,

          ),

        ),

        const SizedBox(height: 20),

        Card(

          child: Column(

            children: [

              const ListTile(

                leading: CircleAvatar(

                  child: Icon(Icons.person),

                ),

                title: Text(

                  'World Wallet User',

                  style: TextStyle(

                    fontWeight: FontWeight.bold,

                  ),

                ),

                subtitle: Text('WW-000001'),

              ),

              const Divider(),

              SwitchListTile(

                value: widget.darkMode,

                onChanged: widget.onDarkModeChanged,

                secondary: const Icon(Icons.dark_mode),

                title: const Text('Dark Mode'),

              ),

              ListTile(

                leading: const Icon(Icons.security),

                title: const Text('Security'),

                trailing: const Icon(Icons.chevron_right),

                onTap: () {

                  _securityDialog();

                },

              ),

              ListTile(

                leading: const Icon(Icons.verified_user),

                title: const Text('Identity Verification'),

                subtitle: const Text('Not verified'),

                trailing: const Icon(Icons.chevron_right),

                onTap: () {

                  _verificationDialog();

                },

              ),

              ListTile(

                leading: const Icon(Icons.notifications),

                title: const Text('Notifications'),

                trailing: const Icon(Icons.chevron_right),

                onTap: () {

                  _message(

                    'Notification settings coming soon.',

                  );

                },

              ),

              ListTile(

                leading: const Icon(Icons.help_outline),

                title: const Text('Help & Support'),

                trailing: const Icon(Icons.chevron_right),

                onTap: () {

                  _message(

                    'World Wallet support coming soon.',

                  );

                },

              ),

              ListTile(

                leading: const Icon(Icons.info_outline),

                title: const Text('About'),

                trailing: const Icon(Icons.chevron_right),

                onTap: () {

                  showAboutDialog(

                    context: context,

                    applicationName: 'World Wallet',

                    applicationVersion: '4.0.0',

                    children: const [

                      Text(

                        'A global multi-currency wallet and currency marketplace prototype.',

                      ),

                      SizedBox(height: 10),

                      Text(

                        'TEST VERSION — real-money functionality is not enabled.',

                      ),

                    ],

                  );

                },

              ),

            ],

          ),

        ),

      ],

    );

  }

  // ==========================================================

  // DEPOSIT

  // ==========================================================

  void _deposit() {

    String currency = 'USD';

    String method = 'Bank Transfer';

    final amount = TextEditingController();

    showDialog(

      context: context,

      builder: (context) {

        return StatefulBuilder(

          builder: (context, change) {

            return AlertDialog(

              title: const Text('Deposit'),

              content: SingleChildScrollView(

                child: Column(

                  children: [

                    _dropdown(

                      'Currency',

                      currency,

                      ['USD', 'MAD', 'MWK'],

                      (v) => change(() => currency = v!),

                    ),

                    TextField(

                      controller: amount,

                      keyboardType:

                          const TextInputType.numberWithOptions(

                        decimal: true,

                      ),

                      decoration: const InputDecoration(

                        labelText: 'Amount',

                        border: OutlineInputBorder(),

                      ),

                    ),

                    const SizedBox(height: 10),

                    _dropdown(

                      'Method',

                      method,

                      [

                        'Bank Transfer',

                        'Debit Card',

                        'Mobile Money',

                      ],

                      (v) => change(() => method = v!),

                    ),

                  ],

                ),

              ),

              actions: [

                TextButton(

                  onPressed: () => Navigator.pop(context),

                  child: const Text('Cancel'),

                ),

                FilledButton(

                  onPressed: () {

                    final value = double.tryParse(amount.text);

                    if (value == null || value <= 0) {

                      _message('Enter a valid amount.');

                      return;

                    }

                    _add(currency, value);

                    history.insert(

                      0,

                      WalletTransaction(

                        title: 'Deposit',

                        subtitle: method,

                        amount: '+${value.toStringAsFixed(2)}',

                        currency: currency,

                        icon: Icons.add_circle,

                      ),

                    );

                    setState(() {});

                    Navigator.pop(context);

                    _message('Deposit added to your test wallet.');

                  },

                  child: const Text('Deposit'),

                ),

              ],

            );

          },

        );

      },

    );

  }

  // ==========================================================

  // WITHDRAW

  // ==========================================================

  void _withdraw() {

    String currency = 'USD';

    String method = 'Bank Account';

    final amount = TextEditingController();

    showDialog(

      context: context,

      builder: (context) {

        return StatefulBuilder(

          builder: (context, change) {

            return AlertDialog(

              title: const Text('Withdraw'),

              content: SingleChildScrollView(

                child: Column(

                  children: [

                    _dropdown(

                      'Currency',

                      currency,

                      ['USD', 'MAD', 'MWK'],

                      (v) => change(() => currency = v!),

                    ),

                    TextField(

                      controller: amount,

                      keyboardType:

                          const TextInputType.numberWithOptions(

                        decimal: true,

                      ),

                      decoration: const InputDecoration(

                        labelText: 'Amount',

                        border: OutlineInputBorder(),

                      ),

                    ),

                    const SizedBox(height: 10),

                    _dropdown(

                      'Method',

                      method,

                      [

                        'Bank Account',

                        'ATM',

                        'Mobile Money',

                      ],

                      (v) => change(() => method = v!),

                    ),

                  ],

                ),

              ),

              actions: [

                TextButton(

                  onPressed: () => Navigator.pop(context),

                  child: const Text('Cancel'),

                ),

                FilledButton(

                  onPressed: () {

                    final value = double.tryParse(amount.text);

                    if (value == null || value <= 0) {

                      _message('Enter a valid amount.');

                      return;

                    }

                    if (!_subtract(currency, value)) {

                      _message(

                        'Insufficient $currency balance.',

                      );

                      return;

                    }

                    history.insert(

                      0,

                      WalletTransaction(

                        title: 'Withdrawal',

                        subtitle: method,

                        amount: '-${value.toStringAsFixed(2)}',

                        currency: currency,

                        icon: Icons.arrow_upward,

                      ),

                    );

                    setState(() {});

                    Navigator.pop(context);

                    _message(

                      'Withdrawal completed in test mode.',

                    );

                  },

                  child: const Text('Withdraw'),

                ),

              ],

            );

          },

        );

      },

    );

  }

  // ==========================================================

  // SECURITY

  // ==========================================================

  void _securityDialog() {

    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text('Security'),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              SwitchListTile(

                value: true,

                onChanged: (_) {},

                title: const Text('Two-step verification'),

              ),

              ListTile(

                leading: const Icon(Icons.lock),

                title: const Text('Change password'),

                onTap: () {

                  Navigator.pop(context);

                  _message(

                    'Password management coming soon.',

                  );

                },

              ),

              ListTile(

                leading: const Icon(Icons.fingerprint),

                title: const Text('Biometric login'),

                onTap: () {

                  Navigator.pop(context);

                  _message(

                    'Biometric login coming soon.',

                  );

                },

              ),

            ],

          ),

        );

      },

    );

  }

  // ==========================================================

  // VERIFICATION

  // ==========================================================

  void _verificationDialog() {

    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text('Identity Verification'),

          content: const Text(

            'Future versions will allow users to verify their identity before participating in real currency transactions.',

          ),

          actions: [

            FilledButton(

              onPressed: () => Navigator.pop(context),

              child: const Text('OK'),

            ),

          ],

        );

      },

    );

  }

  // ==========================================================

  // HELPERS

  // ==========================================================

  String _number(double value) {

    if (value == value.roundToDouble()) {

      return value.toStringAsFixed(0);

    }

    return value.toStringAsFixed(2);

  }

  void _message(String message) {

    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(content: Text(message)),

    );

  }

}

// ============================================================

// EXCHANGE PAGE

// ============================================================

class ExchangePage extends StatefulWidget {

  final double usd;

  final double mad;

  final double mwk;

  final Function(String, String, double) onExchange;

  const ExchangePage({

    super.key,

    required this.usd,

    required this.mad,

    required this.mwk,

    required this.onExchange,

  });

  @override

  State<ExchangePage> createState() => _ExchangePageState();

}

class _ExchangePageState extends State<ExchangePage> {

  String from = 'USD';

  String to = 'MAD';

  final amount = TextEditingController();

  double get rate {

    if (from == 'USD' && to == 'MAD') return 10;

    if (from == 'MAD' && to == 'USD') return .1;

    if (from == 'USD' && to == 'MWK') return 1750;

    if (from == 'MWK' && to == 'USD') return 1 / 1750;

    if (from == 'MAD' && to == 'MWK') return 175;

    if (from == 'MWK' && to == 'MAD') return 1 / 175;

    return 1;

  }

  double get converted {

    final value = double.tryParse(amount.text) ?? 0;

    return (value * .99) * rate;

  }

  @override

  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(18),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(

            'Exchange Currencies',

            style: TextStyle(

              fontSize: 26,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 8),

          Text(

            'Test exchange rate • 1% test fee',

            style: TextStyle(

              color: Colors.grey.shade600,

            ),

          ),

          const SizedBox(height: 25),

          DropdownButtonFormField<String>(

            value: from,

            decoration: const InputDecoration(

              labelText: 'From',

              border: OutlineInputBorder(),

            ),

            items: const [

              DropdownMenuItem(

                value: 'USD',

                child: Text('USD - US Dollar'),

              ),

              DropdownMenuItem(

                value: 'MAD',

                child: Text('MAD - Moroccan Dirham'),

              ),

              DropdownMenuItem(

                value: 'MWK',

                child: Text('MWK - Malawian Kwacha'),

              ),

            ],

            onChanged: (value) {

              setState(() => from = value!);

            },

          ),

          const SizedBox(height: 12),

          Center(

            child: IconButton(

              onPressed: () {

                setState(() {

                  final temp = from;

                  from = to;

                  to = temp;

                });

              },

              icon: const Icon(

                Icons.swap_vert,

                size: 32,

              ),

            ),

          ),

          DropdownButtonFormField<String>(

            value: to,

            decoration: const InputDecoration(

              labelText: 'To',

              border: OutlineInputBorder(),

            ),

            items: const [

              DropdownMenuItem(

                value: 'USD',

                child: Text('USD - US Dollar'),

              ),

              DropdownMenuItem(

                value: 'MAD',

                child: Text('MAD - Moroccan Dirham'),

              ),

              DropdownMenuItem(

                value: 'MWK',

                child: Text('MWK - Malawian Kwacha'),

              ),

            ],

            onChanged: (value) {

              setState(() => to = value!);

            },

          ),

          const SizedBox(height: 15),

          TextField(

            controller: amount,

            onChanged: (_) => setState(() {}),

            keyboardType:

                const TextInputType.numberWithOptions(

              decimal: true,

            ),

            decoration: InputDecoration(

              labelText: 'Amount',

              suffixText: from,

              border: const OutlineInputBorder(),

            ),

          ),

          const SizedBox(height: 20),

          Card(

            child: Padding(

              padding: const EdgeInsets.all(18),

              child: Column(

                children: [

                  _rateRow(

                    'Exchange rate',

                    '1 $from = ${rate.toStringAsFixed(4)} $to',

                  ),

                  const Divider(),

                  _rateRow(

                    'Fee',

                    '1%',

                  ),

                  const Divider(),

                  _rateRow(

                    'You receive',

                    '${converted.toStringAsFixed(2)} $to',

                  ),

                ],

              ),

            ),

          ),

          const SizedBox(height: 20),

          SizedBox(

            width: double.infinity,

            height: 52,

            child: FilledButton.icon(

              onPressed: () {

                final value = double.tryParse(amount.text);

                if (value == null || value <= 0) {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(

                      content: Text('Enter a valid amount.'),

                    ),

                  );

                  return;

                }

                if (from == to) {

                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(

                      content: Text(

                        'Choose two different currencies.',

                      ),

                    ),

                  );

                  return;

                }

                widget.onExchange(from, to, value);

              },

              icon: const Icon(Icons.currency_exchange),

              label: const Text('Exchange Now'),

            ),

          ),

        ],

      ),

    );

  }

  Widget _rateRow(String title, String value) {

    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        Text(title),

        Text(

          value,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

      ],

    );

  }

}

// ============================================================

// MARKETPLACE PAGE

// ============================================================

class MarketplacePage extends StatefulWidget {

  final List<Offer> offers;

  final Function(Offer) onTrade;

  final VoidCallback onPost;

  const MarketplacePage({

    super.key,

    required this.offers,

    required this.onTrade,

    required this.onPost,

  });

  @override

  State<MarketplacePage> createState() => _MarketplacePageState();

}

class _MarketplacePageState extends State<MarketplacePage> {

  String search = '';

  String filter = 'All';

  @override

  Widget build(BuildContext context) {

    final results = widget.offers.where((offer) {

      final text = search.toLowerCase();

      final matchesSearch =

          offer.name.toLowerCase().contains(text) ||

          offer.currency.toLowerCase().contains(text) ||

          offer.wantedCurrency.toLowerCase().contains(text) ||

          offer.location.toLowerCase().contains(text);

      final matchesFilter =

          filter == 'All' || offer.action == filter;

      return matchesSearch && matchesFilter;

    }).toList();

    return Column(

      children: [

        Padding(

          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),

          child: TextField(

            onChanged: (value) {

              setState(() => search = value);

            },

            decoration: InputDecoration(

              hintText: 'Find currencies or traders',

              prefixIcon: const Icon(Icons.search),

              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(15),

              ),

            ),

          ),

        ),

        SingleChildScrollView(

          scrollDirection: Axis.horizontal,

          padding: const EdgeInsets.symmetric(horizontal: 12),

          child: Row(

            children: [

              _chip('All'),

              _chip('Buy'),

              _chip('Sell'),

            ],

          ),

        ),

        Expanded(

          child: results.isEmpty

              ? const Center(

                  child: Text('No matching offers.'),

                )

              : ListView.builder(

                  padding: const EdgeInsets.all(16),

                  itemCount: results.length,

                  itemBuilder: (context, index) {

                    return _offerCard(results[index]);

                  },

                ),

        ),

      ],

    );

  }

  Widget _chip(String text) {

    return Padding(

      padding: const EdgeInsets.only(right: 8),

      child: FilterChip(

        label: Text(text),

        selected: filter == text,

        onSelected: (_) {

          setState(() => filter = text);

        },

      ),

    );

  }

  Widget _offerCard(Offer offer) {

    return Card(

      margin: const EdgeInsets.only(bottom: 12),

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              children: [

                CircleAvatar(

                  child: Text(

                    offer.name.substring(0, 1),

                  ),

                ),

                const SizedBox(width: 10),

                Expanded(

                  child: Column(

                    crossAxisAlignment:

                        CrossAxisAlignment.start,

                    children: [

                      Text(

                        offer.name,

                        style: const TextStyle(

                          fontWeight: FontWeight.bold,

                        ),

                      ),

                      Row(

                        children: [

                          const Icon(

                            Icons.star,

                            size: 14,

                            color: Colors.amber,

                          ),

                          Text(

                            ' ${offer.rating} • ${offer.trades} trades',

                            style: const TextStyle(

                              fontSize: 12,

                            ),

                          ),

                        ],

                      ),

                    ],

                  ),

                ),

                Chip(

                  label: Text(offer.action),

                ),

              ],

            ),

            const SizedBox(height: 14),

            Text(

              '${offer.amount} ${offer.currency}',

              style: const TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 4),

            Text(

              '1 ${offer.currency} = ${offer.rate} ${offer.wantedCurrency}',

            ),

            const SizedBox(height: 8),

            Text('📍 ${offer.location}'),

            Text('💳 ${offer.payment}'),

            const SizedBox(height: 12),

            SizedBox(

              width: double.infinity,

              child: FilledButton(

                onPressed: () => widget.onTrade(offer),

                child: Text(

                  offer.action == 'Sell'

                      ? 'Buy ${offer.currency}'

                      : 'Sell ${offer.currency}',

                ),

              ),

            ),

          ],

        ),

      ),

    );

  }

}
