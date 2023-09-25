import 'package:flutter/material.dart';

class HeaderSection extends StatefulWidget {
  final ValueNotifier<String> viewMode;

  const HeaderSection({Key? key, required this.viewMode}) : super(key: key);

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    void handleChangeTab(String tab) {
      if (tab == "chart") {
        widget.viewMode.value = "chart";
      } else if (tab == "list") {
        widget.viewMode.value = "list";
      }
            setState(() {});
    }

    return Column(
      children: [
        // Titre
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Type d'affichage",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                ),
              ),
              // Boutons
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      handleChangeTab("chart");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: widget.viewMode.value == "chart"
                            ? Colors.grey
                            : null,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.bar_chart,
                        size: 20,
                        color: widget.viewMode.value == "chart"
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      handleChangeTab("list");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: widget.viewMode.value == "list"
                            ? Colors.black26
                            : null,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.list,
                        size: 20,
                        color: widget.viewMode.value == "list"
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
