import 'package:flutter/material.dart';
import 'login_options.dart';

class AccountNavigation extends StatefulWidget {
  const AccountNavigation({super.key});

  @override
  State<AccountNavigation> createState() => _AccountNavigationState();
}

class _AccountNavigationState extends State<AccountNavigation> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Navigation'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'FriendFinder',
                  style: theme.textTheme.headlineLarge,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    'Account',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 15),
                  TextButton( 
                        onPressed: () {},
                        child: 
                          Text(
                            'Profile',
                          )
                  ),
                  TextButton( 
                        onPressed: () {},
                        child: 
                          Text(
                            'Interests',
                          )
                  ),
                  TextButton( 
                        onPressed: () {},
                        child: 
                          Text(
                            'Settings',
                          )
                  ),
                  TextButton( 
                        onPressed: () {},
                        child: 
                          Text(
                            'Support',
                          )
                  ),
                  TextButton( 
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => const LoginOptions(),
                            ),
                          );
                        },
                        child: 
                          Text(
                            'Logout',
                          )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}