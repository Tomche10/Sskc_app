import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ССКЦ',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF2B2D42), // dark blue
          onPrimary: Colors.white,
          secondary: Color(0xFF8D99AE), // light gray-blue
          onSecondary: Color(0xFF2B2D42),
          background: Color(0xFFF8F9FA), // very light gray
          onBackground: Color(0xFF2B2D42),
          surface: Colors.white,
          onSurface: Color(0xFF2B2D42),
          error: Color(0xFFEF233C), // red accent
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2B2D42),
          foregroundColor: Colors.white,
        ),
        drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF2B2D42)),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Color(0xFF2B2D42),
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Color(0xFF2B2D42)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFEF233C), // red accent
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const UserTypeSelectionPage(),
    );
  }
}

class UserTypeSelectionPage extends StatelessWidget {
  const UserTypeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          // Decorative orange bubbles
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA726), // Orange
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.orange, blurRadius: 40)],
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            right: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA726),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.orange, blurRadius: 30)],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://sskc.mk/wp-content/uploads/2022/10/cropped-Logo-SSKC-1-192x192.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.account_circle,
                              size: 80,
                              color: Colors.orange,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Login/Register/Guest bubbles
                  _BubbleButton(
                    text: 'Најави се',
                    icon: Icons.login,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _BubbleButton(
                    text: 'Креирај профил',
                    icon: Icons.person_add,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _BubbleButton(
                    text: 'Гостин',
                    icon: Icons.person_outline,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GuestHomePage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BubbleButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const _BubbleButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: const Color(0xFFFFA726),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Гостин - Почетна'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Одјави се',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserTypeSelectionPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA726),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.orange, blurRadius: 40)],
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            right: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA726),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.orange, blurRadius: 30)],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://sskc.mk/wp-content/uploads/2022/10/cropped-Logo-SSKC-1-192x192.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.account_circle,
                                  size: 40,
                                  color: Colors.orange,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Добредојдовте, гостин!',
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF2B2D42),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _BubbleButton(
                    text: 'Новости',
                    icon: Icons.article,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewsPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _BubbleButton(
                    text: 'Одјави се',
                    icon: Icons.logout,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserTypeSelectionPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = RegisteredUsers.currentUser;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('ССКЦ - Почетна'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Профил',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Одјави се',
            onPressed: () {
              RegisteredUsers.currentUser = null;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserTypeSelectionPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: -40,
            right: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFFFA726),
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.orange, blurRadius: 30)],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo and welcome text at the top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://sskc.mk/wp-content/uploads/2022/10/cropped-Logo-SSKC-1-192x192.png',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.account_circle,
                                  size: 40,
                                  color: Colors.orange,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Добредојдовте, ${user != null ? user['name'] : 'корисник'}!',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Orange bubbles for navigation
                  _BubbleButton(
                    text: 'Почетна',
                    icon: Icons.home,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _BubbleButton(
                    text: 'За нас',
                    icon: Icons.info_outline,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _BubbleButton(
                    text: 'Контакт',
                    icon: Icons.contact_mail,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _BubbleButton(
                    text: 'Новости',
                    icon: Icons.article,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewsPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  _BubbleButton(
                    text: 'Одјави се',
                    icon: Icons.logout,
                    onTap: () {
                      RegisteredUsers.currentUser = null;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserTypeSelectionPage(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = RegisteredUsers.currentUser;
    return Scaffold(
      appBar: AppBar(title: const Text('Профил')),
      body: Center(
        child: user == null
            ? const Text('Нема податоци за корисникот.')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Color(0xFFFFA726),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Име: ${user['name']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Е-пошта: ${user['email']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('За нас')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'ССКЦ е основан со цел да ги заштити и унапреди правата на вработените во здравствениот сектор.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Контакт')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Адреса: ул. Мајка Тереза бр. 17, Скопје\nТелефон: (02) 3 113 111\nВеб: www.sskc.mk',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// Update RegisteredUsers to track current user
class RegisteredUsers {
  static final List<Map<String, String>> users = [];
  static Map<String, String>? currentUser;
}

// Update LoginPage to set currentUser on successful login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _errorMessage;

  void _login() {
    final user = RegisteredUsers.users.firstWhere(
      (u) => u['email'] == _email && u['password'] == _password,
      orElse: () => {},
    );
    if (user.isNotEmpty) {
      RegisteredUsers.currentUser = user;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = 'Неточна е-пошта или лозинка';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Најава')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Е-пошта'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Внесете е-пошта' : null,
                onSaved: (value) => _email = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Лозинка'),
                obscureText: true,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Внесете лозинка' : null,
                onSaved: (value) => _password = value,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _login();
                  }
                },
                child: const Text('Најави се'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Креирај профил')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Име и презиме'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Внесете име' : null,
                onSaved: (value) => _name = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Е-пошта'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Внесете е-пошта' : null,
                onSaved: (value) => _email = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Лозинка'),
                obscureText: true,
                validator: (value) => value == null || value.length < 6
                    ? 'Лозинката мора да има најмалку 6 карактери'
                    : null,
                onSaved: (value) => _password = value,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    RegisteredUsers.users.add({
                      'name': _name!,
                      'email': _email!,
                      'password': _password!,
                    });
                    RegisteredUsers.currentUser = {
                      'name': _name!,
                      'email': _email!,
                      'password': _password!,
                    };
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Профилот е креиран!')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Креирај профил'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Новости')),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          NewsCard(
            title:
                'ССКЦ се избори за покачување на платите на здравствените работници!',
            date: '03.04.2025',
            content:
                'Ветено – сторено! ССКЦ се избори за покачување на платите на здравствените работници. Борбата продолжува…',
          ),
          NewsCard(
            title: 'Меморандум за соработка помеѓу ССКЦ и АУЕ – ФОН',
            date: '09.06.2025',
            content:
                'Потпишан е меморандум за меѓусебна соработка помеѓу ССКЦ и АУЕ – ФОН за подобрување на условите во здравствениот сектор.',
          ),
          NewsCard(
            title: 'ССКЦ достави барање за средба со Министерот за здравство',
            date: '27.06.2024',
            content:
                'ССКЦ се обрати и со писмено барање за официјални информации и вклучување на синдикатот во процесот на спојување и реорганизација на Клиничкиот центар.',
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String date;
  final String content;
  const NewsCard({
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFA726),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(content, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
