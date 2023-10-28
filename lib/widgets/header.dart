import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.name, this.ontap});
  final String name;
  final Function? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(color: Colors.white),
      width: MediaQuery.of(context).size.width - 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Spacer(),
          const SizedBox(width: 300, child: SearchField()),
          ProfileCard(
            name: name,
            ontap: ontap ?? () {},
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.name,
    required this.ontap,
  }) : super(key: key);
  final String name;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16 / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile.png",
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16 / 2),
            child: Text(
              "$name@Ai Wakforce",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
              onPressed: () {
                ontap();
              },
              icon: const Icon(
                CupertinoIcons.refresh,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: "Search",
        border: const OutlineInputBorder(
          // borderSide: BorderSide.,
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.search_circle_fill,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
