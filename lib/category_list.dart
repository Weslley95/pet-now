import 'package:flutter/material.dart';
import 'package:petnow/data.dart';
import 'package:petnow/pet_widget.dart';

class CategoryList extends StatelessWidget {
  final Category category;

  CategoryList({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.1,
        centerTitle: true,
        title: Text(
          category == Category.DOG
              ? "Cachorros"
              : category == Category.CAT
                  ? "Gatos"
                  : "",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade800,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*
          Padding(
            padding: EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
              bottom: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // buildFilter("Mating", false),
                // buildFilter("Adoption", true),
                // buildFilter("Disappear", true),
              ],
            ),
          ),
          */
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: 1 / 1.50,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                children: getPetList()
                    .where((element) => element.category == category)
                    .map((item) {
                  return PetWidget(
                    pet: item,
                    index: 1,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilter(String name, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: selected ? Colors.blue.shade300 : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 1,
          color: selected ? Colors.transparent : Colors.green.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color:
                selected ? Colors.blue.shade300.withOpacity(0.5) : Colors.white,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.grey.shade800,
            ),
          ),
          selected
              ? Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
