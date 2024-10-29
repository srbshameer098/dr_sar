import 'package:drsar/Application/on_pull.dart';
import 'package:drsar/Presentation/LoginScreen/loginscreen.dart';
import 'package:drsar/Presentation/Profile/Profile/screen_profile.dart';
import 'package:drsar/Presentation/Profile/history/history_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({Key? key}) : super(key: key);

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => ScreenLogin(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;

    return RefreshIndicator(
      onRefresh: () {
        return onPull(context, 'profile', 0);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, isInnerBoxScrolled) => [
            SliverAppBar(
              elevation: 0,
              snap: true,
              floating: true,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(mHeight * .0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: SizedBox(
                    height: mHeight * .08,
                    child: TabBar(
                      onTap: (index) {},
                      unselectedLabelColor: Colors.black,
                      controller: _tabController,
                      labelPadding: const EdgeInsets.only(top: 10),
                      indicatorWeight: 12,
                      indicator: const BoxDecoration(
                        color: Color(0xff05477D),
                      ),
                      tabs: const [
                        Text('Profile'),
                        Text('History'),
                      ],
                    ),
                  ),
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
            )
          ],
          body: TabBarView(
            controller: _tabController,
            children: const [
              ScreenProfile(),
              ScreenHistory(),
            ],
          ),
        ),
      ),
    );
  }
}
