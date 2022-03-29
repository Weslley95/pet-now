import 'package:flutter/material.dart';
import 'package:petnow/category_list.dart';
import 'package:petnow/data.dart';
import 'package:petnow/pet_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pet> pets = getPetList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "App Pet Now",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0.1,
        leading: Icon(
          Icons.sort,
          color: Colors.grey[800],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Image.asset(
                    "assets/images/logo_petnow.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categoria dos Pet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPetCategory(
                          Category.CAT, coutPet(Category.CAT), Colors.red),
                      buildPetCategory(
                          Category.DOG, coutPet(Category.DOG), Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Alguns Pet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildNewestPet(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hospitais de Emergência",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            Container(
              height: 130,
              margin: EdgeInsets.only(
                bottom: 16,
              ),
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: [
                  buildVet(
                      "assets/images/emergence/emergence_1.png",
                      "Emergência, unidade zona Norte",
                      "(11) 9 3352-0196",
                      "Rua Atílio Piffer,\n nº 687 - Casa Verde."),
                  buildVet(
                      "assets/images/emergence/emergence_2.png",
                      "Emergência, unidade zona leste",
                      "(11) 9 3352-0196",
                      "Av. Salim Farah Maluf,\n rua Ulisses Cruz - Tatuapé."),
                  buildVet(
                      "assets/images/emergence/emergence_3.png",
                      "Emergência, unidade zona sul",
                      "(11) 9 3352-0196",
                      "Rua Agostino Togneri,\n n° 153 - Jurubatuba."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPetCategory(Category category, int total, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryList(
                category: category,
              ),
            ),
          );
        },
        child: Container(
          height: 80,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      "assets/images/" +
                          (category == Category.CAT
                              ? "cat"
                              : category == Category.DOG
                                  ? "dog"
                                  : "") +
                          ".png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category == Category.HAMSTER
                        ? "Hamsters"
                        : category == Category.CAT
                            ? "Gato"
                            : category == Category.BUNNY
                                ? "Bunnies"
                                : "Cachorro",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Total de ${total}",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNewestPet() {
    List<Widget> list = [];
    for (var i = 0; i < pets.length; i++) {
      if (pets[i].viewFront == true) {
        list.add(
          PetWidget(
            pet: pets[i],
            index: i,
          ),
        );
      }
    }
    return list;
  }

  int coutPet(Object pet) {
    int count = 0;
    for (var i = 0; i < pets.length; i++) {
      if (pets[i].category == pet) {
        count++;
      }
    }
    return count;
  }

  Widget buildVet(String imageUrl, String name, String phone, String address) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 0,
        top: 1,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(
                    Icons.message_sharp,
                    color: Colors.grey.shade800,
                    size: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  address,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
