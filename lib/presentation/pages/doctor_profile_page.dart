import 'package:flutter/material.dart';
import 'package:gfghackathon_app/data/models/doctor_model.dart';
import 'package:gfghackathon_app/data/providers/review_provider.dart';
import 'package:gfghackathon_app/presentation/components/loading.dart';
import 'package:gfghackathon_app/utils/app_colors.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage(this.doctor, {super.key});
  final DoctorModel doctor;

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        shadowColor: Colors.transparent,
        foregroundColor: AppColors.black,
      ),
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // avatar
                  Container(
                    margin: const EdgeInsets.only(top: 60.0),
                    padding: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 180, 194, 250),
                          offset: Offset(0, 4),
                          blurRadius: 12,
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, -4),
                          blurRadius: 8,
                          spreadRadius: -1,
                        ),
                      ],
                    ),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(widget.doctor.profileImageURL),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),

                  // name
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 6.0),
                    child: Text(
                      "Dr. ${widget.doctor.name}",
                      style: const TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ),
                  // speciality
                  Text(
                    widget.doctor.speciality,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.3,
                      color: AppColors.grey,
                    ),
                  ),
                  // row of achievements
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // row item
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Reviews",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                                color: AppColors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                "${widget.doctor.numberOfReviews}+",
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.3,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24.0),
                          width: 1.0,
                          height: 36.0,
                          color: const Color.fromARGB(116, 194, 206, 223),
                        ),
                        // row item
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Experience",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                                color: AppColors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                "${widget.doctor.experience} yrs+",
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.3,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24.0),
                          width: 1.0,
                          height: 36.0,
                          color: const Color.fromARGB(116, 194, 206, 223),
                        ),
                        // row item
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Ratings",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                                color: AppColors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(
                                "${widget.doctor.rating}",
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.3,
                                  color: AppColors.textGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // tab bar
                  // tab bar controlled section
                  DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: const [
                            Tab(
                              icon: Text("About"),
                            ),
                            Tab(
                              icon: Text("Address"),
                            ),
                            Tab(
                              icon: Text("Ratings"),
                            ),
                          ],
                          indicatorColor: AppColors.activeBlue,
                          unselectedLabelColor: AppColors.grey,
                          labelColor: AppColors.activeBlue,
                          labelStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          onTap: (value) {
                            setState(() {
                              _selectedTabIndex = value;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Biography",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Text(
                                      widget.doctor.about,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Practice Place",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Text(
                                      "${widget.doctor.workingArea} - ${widget.doctor.address}",
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Location Map",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child:
                                          Image.asset("assets/images/map.jpg"),
                                    ),
                                  ),
                                ],
                              ),
                              FutureBuilder(
                                  future: getReviews(widget.doctor.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Overall Ratings",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              // ratings left
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: AppColors
                                                            .activeBlue,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      width: 60.0,
                                                      height: 60.0,
                                                      child: Center(
                                                        child: Text(
                                                          "${widget.doctor.rating}",
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 22.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        widget.doctor.rating >
                                                                0.8
                                                            ? Icons.star_rounded
                                                            : (widget.doctor
                                                                        .rating >
                                                                    0.3
                                                                ? Icons
                                                                    .star_half_rounded
                                                                : Icons
                                                                    .star_border_rounded),
                                                        color: Colors.amber,
                                                        size: 20,
                                                      ),
                                                      Icon(
                                                        widget.doctor.rating >
                                                                1.8
                                                            ? Icons.star_rounded
                                                            : (widget.doctor
                                                                        .rating >
                                                                    1.3
                                                                ? Icons
                                                                    .star_half_rounded
                                                                : Icons
                                                                    .star_border_rounded),
                                                        color: Colors.amber,
                                                        size: 20,
                                                      ),
                                                      Icon(
                                                        widget.doctor.rating >
                                                                2.8
                                                            ? Icons.star_rounded
                                                            : (widget.doctor
                                                                        .rating >
                                                                    2.3
                                                                ? Icons
                                                                    .star_half_rounded
                                                                : Icons
                                                                    .star_border_rounded),
                                                        color: Colors.amber,
                                                        size: 20,
                                                      ),
                                                      Icon(
                                                        widget.doctor.rating >
                                                                3.8
                                                            ? Icons.star_rounded
                                                            : (widget.doctor
                                                                        .rating >
                                                                    3.3
                                                                ? Icons
                                                                    .star_half_rounded
                                                                : Icons
                                                                    .star_border_rounded),
                                                        color: Colors.amber,
                                                        size: 20,
                                                      ),
                                                      Icon(
                                                        widget.doctor.rating >
                                                                4.8
                                                            ? Icons.star_rounded
                                                            : (widget.doctor
                                                                        .rating >
                                                                    4.3
                                                                ? Icons
                                                                    .star_half_rounded
                                                                : Icons
                                                                    .star_border_rounded),
                                                        color: Colors.amber,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 4.0),
                                                    child: Text(
                                                      "${widget.doctor.numberOfReviews} Reviews",
                                                      style: const TextStyle(
                                                        color: AppColors.grey,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // ratings right
                                              Column(
                                                children: [],
                                              )
                                            ],
                                          ),
                                          ListView.builder(
                                            itemCount: snapshot.data!.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 6.0),
                                              child: Text(
                                                snapshot.data![index].title,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const LoadingWidget();
                                    }
                                  }),
                            ][_selectedTabIndex],
                          ),
                        )
                        // TabBarVie
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: AppColors.activeBlue,
                borderRadius: BorderRadius.circular(60.0),
              ),
              child: const Text(
                "Book an appointment",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
