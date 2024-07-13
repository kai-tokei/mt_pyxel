import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// pages
import 'package:mt_pyxel/pages/home.dart';

import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';
//import 'package:mt_pyxel/pages/content_page.dart';
//import 'package:mt_pyxel/pages/post.dart';
//import 'package:mt_pyxel/pages/user_profile.dart';
//import 'package:mt_pyxel/pages/user_settings.dart';
//import 'package:mt_pyxel/components/common_appbar.dart';
//import 'package:mt_pyxel/components/common_bottombar.dart';

final goRouter = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
      path: '/home',
      builder: (context, state) {
        //return MaterialPage(key: state.pageKey, child: const Home());
        return Scaffold(
            appBar: CommonAppBar(
              onAbout: () {
                context.push('/home');
              },
              onPost: () {},
              onLearn: () {},
              onUserName: () {},
            ),
            body: const SingleChildScrollView(
                child: Center(
                    child: Column(
              children: [
                Home(),
                CommonBottomBar(),
              ],
            ))));
      }),
  GoRoute(
      path: '/post',
      builder: (context, state) {
        //return MaterialPage(key: state.pageKey, child: const Home());
        return Scaffold(
            appBar: CommonAppBar(
              onAbout: () {
                context.push('/home');
              },
              onPost: () {},
              onLearn: () {},
              onUserName: () {},
            ),
            body: const SingleChildScrollView(
                child: Center(
                    child: Column(
              children: [
                Home(),
                CommonBottomBar(),
              ],
            ))));
      }),
  GoRoute(
      path: '/content',
      builder: (context, state) {
        //return MaterialPage(key: state.pageKey, child: const Home());
        return Scaffold(
            appBar: CommonAppBar(
              onAbout: () {
                context.push('/home');
              },
              onPost: () {},
              onLearn: () {},
              onUserName: () {},
            ),
            body: const SingleChildScrollView(
                child: Center(
                    child: Column(
              children: [
                Home(),
                CommonBottomBar(),
              ],
            ))));
      }),
  GoRoute(
      path: '/profile',
      builder: (context, state) {
        //return MaterialPage(key: state.pageKey, child: const Home());
        return Scaffold(
            appBar: CommonAppBar(
              onAbout: () {
                context.push('/home');
              },
              onPost: () {},
              onLearn: () {},
              onUserName: () {},
            ),
            body: const SingleChildScrollView(
                child: Center(
                    child: Column(
              children: [
                Home(),
                CommonBottomBar(),
              ],
            ))));
      }),
  GoRoute(
      path: '/settings',
      builder: (context, state) {
        //return MaterialPage(key: state.pageKey, child: const Home());
        return Scaffold(
            appBar: CommonAppBar(
              onAbout: () {
                context.push('/home');
              },
              onPost: () {},
              onLearn: () {},
              onUserName: () {},
            ),
            body: const SingleChildScrollView(
                child: Center(
                    child: Column(
              children: [
                Home(),
                CommonBottomBar(),
              ],
            ))));
      }),
]);
