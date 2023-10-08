import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/test_screen_controller.dart';
import '../../utils/constants.dart';

class TestScreen extends GetView<TestScreenController> {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            width: 490.5527038574219,
            height: 490.5527038574219,
          ),
          Row(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/E-Clinic.png",
                        width: 77,
                        height: 16,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: 12,
                                            height: 15.200215339660645,
                                          )
                                        ],
                                      ),
                                      Image.asset(
                                        "assets/Ellipse 15.png",
                                        width: 8,
                                        height: 8,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/Rectangle 43.png",
                                    width: 40,
                                    height: 40,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/3.png",
                            width: 8,
                            height: 0,
                          ),
                          Image.asset(
                            "assets/2.png",
                            width: 16,
                            height: 0,
                          ),
                          Image.asset(
                            "assets/1.png",
                            width: 16,
                            height: 0,
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const Column(
            children: [
              Text("Appointments",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
              Row(
                children: [
                  Row(
                    children: [
                      Text("Requests",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text("Completed",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            children: [
              Column(
                children: [
                  const Text("Appointment Requests",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  Row(
                    children: [
                      const Text("Latest Requests",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Image.asset(
                        "assets/Vector 2.png",
                        width: 11,
                        height: 6,
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text("Name",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Date & Time",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ))
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Service",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ))
                                    ],
                                  ),
                                  Text("Status",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  Text("Action",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 944,
                    height: 0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 43.5,
                                      height: 43.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff166eff),
                                              Color(0xff76aefa)
                                            ],
                                          ))),
                                  Image.asset(
                                    "assets/Rectangle 43.png",
                                    width: 43.5,
                                    height: 43.5,
                                  )
                                ],
                              ),
                              const Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Mary Freund",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Oct 19, 2018 12:14 PM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                      const Column(
                        children: [
                          Text("General Checkup",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                      const Text("Paid",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Cancel",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 4.6666669845581055,
                                  ),
                                  Container(
                                    width: 13.333333969116211,
                                    height: 6,
                                  ),
                                  Container(
                                    width: 8,
                                    height: 5.333333492279053,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 944,
                    height: 0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 43.5,
                                      height: 43.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff166eff),
                                              Color(0xff76aefa)
                                            ],
                                          ))),
                                  Image.asset(
                                    "assets/Rectangle 43.png",
                                    width: 43.5,
                                    height: 43.5,
                                  )
                                ],
                              ),
                              const Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Iva Ryan",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Apr 19, 2016 4:25 AM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Emergency ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                      const Text("Paid",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Cancel",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 4.6666669845581055,
                                  ),
                                  Container(
                                    width: 13.333333969116211,
                                    height: 6,
                                  ),
                                  Container(
                                    width: 8,
                                    height: 5.333333492279053,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 944,
                    height: 0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 43.5,
                                      height: 43.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff166eff),
                                              Color(0xff76aefa)
                                            ],
                                          ))),
                                  Image.asset(
                                    "assets/Rectangle 43.png",
                                    width: 43.5,
                                    height: 43.5,
                                  )
                                ],
                              ),
                              const Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Rodger Struck",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Jan 25, 2019 4:00 AM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Diet plan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                      const Text("Paid",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Cancel",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 4.6666669845581055,
                                  ),
                                  Container(
                                    width: 13.333333969116211,
                                    height: 6,
                                  ),
                                  Container(
                                    width: 8,
                                    height: 5.333333492279053,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 944,
                    height: 0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 43.5,
                                      height: 43.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff166eff),
                                              Color(0xff76aefa)
                                            ],
                                          ))),
                                  Image.asset(
                                    "assets/Rectangle 43.png",
                                    width: 43.5,
                                    height: 43.5,
                                  )
                                ],
                              ),
                              const Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Rhonda Rhodes",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Feb 5, 2019 4:00 AM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Carminology",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                      const Text("Pending",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Cancel",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 4.6666669845581055,
                                  ),
                                  Container(
                                    width: 13.333333969116211,
                                    height: 6,
                                  ),
                                  Container(
                                    width: 8,
                                    height: 5.333333492279053,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 944,
                    height: 0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 43.5,
                                      height: 43.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff166eff),
                                              Color(0xff76aefa)
                                            ],
                                          ))),
                                  Image.asset(
                                    "assets/Rectangle 43.png",
                                    width: 43.5,
                                    height: 43.5,
                                  )
                                ],
                              ),
                              const Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Judith Rodriguez",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Jan 9, 2023 4:00 PM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Germionology",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                      const Text("Paid",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Cancel",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 4.6666669845581055,
                                  ),
                                  Container(
                                    width: 13.333333969116211,
                                    height: 6,
                                  ),
                                  Container(
                                    width: 8,
                                    height: 5.333333492279053,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 944,
                    height: 0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      width: 43.5,
                                      height: 43.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xff166eff),
                                              Color(0xff76aefa)
                                            ],
                                          ))),
                                  Image.asset(
                                    "assets/Rectangle 43.png",
                                    width: 43.5,
                                    height: 43.5,
                                  )
                                ],
                              ),
                              const Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Kathy Pacheco",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Jan 2, 2023 5:00 PM",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      ),
                      const Column(
                        children: [
                          Text("Pyscology",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ))
                        ],
                      ),
                      const Text("Paid",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Accept",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Row(
                                children: [
                                  Text("Cancel",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 4.6666669845581055,
                                  ),
                                  Container(
                                    width: 13.333333969116211,
                                    height: 6,
                                  ),
                                  Container(
                                    width: 8,
                                    height: 5.333333492279053,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
