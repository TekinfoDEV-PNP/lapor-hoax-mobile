import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laporhoax/common/navigation.dart';
import 'package:laporhoax/data/models/token_id.dart';
import 'package:laporhoax/data/model/user_token.dart';
import 'package:laporhoax/presentation/pages/account/static_page_viewer.dart';
import 'package:laporhoax/presentation/pages/news/saved_news.dart';
import 'package:laporhoax/presentation/pages/report/history_page.dart';
import 'package:laporhoax/presentation/provider/preferences_notifier.dart';
import 'package:laporhoax/util/static_data_web.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'account_profile.dart';
import 'login_page.dart';

class AccountPage extends StatefulWidget {
  static const String pageName = 'Akun';

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late PreferencesNotifier state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 50.0),
        child: SingleChildScrollView(
          child: Consumer<PreferencesNotifier>(
            builder: (context, provider, child) {
              if (provider.isLoggedIn) {
                return onLogin(provider.userData.username);
              } else {
                state = provider;
                return onWelcome();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget onLogin(String username) {
    var provider = Provider.of<PreferencesNotifier>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/logo_new.png',
                height: 80,
                width: 80,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  username,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () => provider.setSessionData(UserToken.empty()),
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 70),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.person_outline_rounded),
            title: Text('Profil'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigation.intent(AccountProfile.routeName),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.history),
            title: Text('Riwayat Pelaporan'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigation.intentWithData(
              HistoryPage.routeName,
              TokenId(
                token: provider.loginData.token!,
                id: provider.userData.id.toString(),
              ),
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.bookmark_outline),
            title: Text('Berita Tersimpan'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigation.intent(SavedNews.routeName),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Tentang Laporhoax'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => showAboutDialog(
              context: context,
              applicationIcon:
                  Image.asset('assets/icons/logo_new.png', width: 50),
              applicationName: 'LAPOR HOAX',
              applicationVersion: 'v1.0-alpha',
              children: [
                Text(
                    'Aplikasi pelaporan hoax yang ditangani langsung oleh pihak yang berwewenang'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/pnp_logo.png',
                      width: 50,
                    ),
                    Image.asset(
                      'assets/icons/polda_sumbar_logo.png',
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.share_rounded),
            title: Text('Bagikan Laporhoax'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Share.share(
                'Ayo berantas hoaks bersama LaporHoax! di https://example.com'),
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigation.intentWithData(
                StaticPageViewer.routeName,
                StaticDataWeb(
                  fileName: 'terms_of_service',
                  title: 'Syarat Penggunaan',
                ),
              ),
              child: Container(
                child: Text(
                  'Syarat Penggunaan',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Text(' | '),
            GestureDetector(
              onTap: () => Navigation.intentWithData(
                StaticPageViewer.routeName,
                StaticDataWeb(
                  fileName: 'privacy_policy',
                  title: 'Kebijakan Privasi',
                ),
              ),
              child: Container(
                child: Text(
                  'Kebijakan Privasi',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget onWelcome() {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Image.asset(
                'assets/icons/logo_new.png',
                height: 80,
                width: 80,
              ),
              SizedBox(height: 46),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 25),
          child: SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: () => Navigation.intent(LoginPage.routeName),
              child: Text('Login Sekarang'),
            ),
          ),
        ),
        SizedBox(height: 20),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Tentang Laporhoax'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => showAboutDialog(
              context: context,
              applicationIcon:
                  Image.asset('assets/icons/logo_new.png', width: 50),
              applicationName: 'LAPOR HOAX',
              applicationVersion: 'v1.0-alpha',
              children: [
                Text(
                    'Aplikasi pelaporan hoax yang ditangani langsung oleh pihak yang berwewenang'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/pnp_logo.png',
                      width: 50,
                    ),
                    Image.asset(
                      'assets/icons/polda_sumbar_logo.png',
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.bookmark_outline),
            title: Text('Berita Tersimpan'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigation.intent(SavedNews.routeName),
          ),
        ),
        Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(Icons.share_rounded),
            title: Text('Bagikan LaporHoax'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Share.share(
                'Ayo berantas hoaks bersama LaporHoax! di https://example.com'),
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigation.intentWithData(
                StaticPageViewer.routeName,
                StaticDataWeb(
                  fileName: 'terms_of_service',
                  title: 'Syarat Penggunaan',
                ),
              ),
              child: Container(
                child: Text(
                  'Syarat Penggunaan',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Text(' | '),
            GestureDetector(
              onTap: () => Navigation.intentWithData(
                StaticPageViewer.routeName,
                StaticDataWeb(
                  fileName: 'privacy_policy',
                  title: 'Kebijakan Privasi',
                ),
              ),
              child: Container(
                child: Text(
                  'Kebijakan Privasi',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}