import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mt_pyxel/firebase_options.dart';
// pages
import 'package:mt_pyxel/pages/home.dart';
import 'package:mt_pyxel/pages/post.dart';

// components
import 'package:mt_pyxel/components/common_appbar.dart';
import 'package:mt_pyxel/components/common_bottombar.dart';

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
              onPost: () {
                context.push('/post');
              },
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
              onPost: () {
                context.push('/post');
              },
              onLearn: () {},
              onUserName: () {},
            ),
            body: const SingleChildScrollView(
                child: Center(
                    child: Column(
              children: [
                PostPage(),
                CommonBottomBar(),
              ],
            ))));
      }),
  //GoRoute(
  //    path: '/content',
  //    builder: (context, state) {
  //      //return MaterialPage(key: state.pageKey, child: const Home());
  //      return Scaffold(
  //          appBar: CommonAppBar(
  //            onAbout: () {
  //              context.push('/home');
  //            },
  //            onPost: () {
  //              context.push('/post');
  //            },
  //            onLearn: () {},
  //            onUserName: () {},
  //          ),
  //          body: const SingleChildScrollView(
  //              child: Center(
  //                  child: Column(
  //            children: [
  //              Home(),
  //              CommonBottomBar(),
  //            ],
  //          ))));
  //    }),
  //GoRoute(
  //    path: '/profile',
  //    builder: (context, state) {
  //      //return MaterialPage(key: state.pageKey, child: const Home());
  //      return Scaffold(
  //          appBar: CommonAppBar(
  //            onAbout: () {
  //              context.push('/home');
  //            },
  //            onPost: () {
  //              context.push('/post');
  //            },
  //            onLearn: () {},
  //            onUserName: () {},
  //          ),
  //          body: const SingleChildScrollView(
  //              child: Center(
  //                  child: Column(
  //            children: [
  //              Home(),
  //              CommonBottomBar(),
  //            ],
  //          ))));
  //    }),
  //GoRoute(
  //    path: '/settings',
  //    builder: (context, state) {
  //      //return MaterialPage(key: state.pageKey, child: const Home());
  //      return Scaffold(
  //          appBar: CommonAppBar(
  //            onAbout: () {
  //              context.push('/home');
  //            },
  //            onPost: () {
  //              context.push('/post');
  //            },
  //            onLearn: () {},
  //            onUserName: () {},
  //          ),
  //          body: const SingleChildScrollView(
  //              child: Center(
  //                  child: Column(
  //            children: [
  //              Home(),
  //              CommonBottomBar(),
  //            ],
  //          ))));
  //    }),
]);
