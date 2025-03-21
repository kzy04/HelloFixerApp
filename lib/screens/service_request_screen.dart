import 'package:flutter/material.dart';

class ServiceRequestScreen extends StatefulWidget {
  @override
  _ServiceRequestScreenState createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final List<String> services = [
    // Household Services
    "Pest Control", "Home Security", "Window Cleaning", "Furniture Assembly", "Movers",
    "Laundry Service", "Towing Service", "Appliance Repair", "House Painting",
    "Roof Repair", "Floor Installation", "Pressure Washing", "Wall Plastering", "Tile Fitting",
    "Glass Installation", "Wood Polishing", "Sofa Repair", "Water Tank Cleaning", "Solar Panel Installation",

    // Vehicle & Transport
    "Motorbike Repair", "Rickshaw Repair", "Battery Replacement", "CNG Conversion",
    "Car Wash", "Bike Wash", "Tire Change Service", "Car Rental", "Ride-Sharing Service",
    "Fuel Delivery", "Breakdown Assistance", "Truck Rental", "Ambulance Service", "Cycle Repair",

    // Food & Catering
    "Home Chef", "Tiffin Service", "Food Delivery", "Catering Service", "Cake & Pastry Delivery",
    "Event Catering", "Juice & Snacks Delivery", "Restaurant Home Delivery", "Office Catering",

    // Home & Property Services
    "Real Estate Agent", "Property Management", "Flat Rental Assistance", "Apartment Cleaning",
    "Landscaping", "House Construction", "Painting & Renovation", "Waterproofing Service",
    "Interior Decoration", "Chimney Cleaning", "Water Pump Repair", "Door Lock Repair",
    "Glass Work", "Ceiling Decoration", "False Ceiling Installation", "Carpentry Service",

    // Tech & Digital Services
    "Computer Repair", "Laptop Repair", "Smartphone Repair", "Data Recovery Service", "WiFi Setup",
    "Website Development", "Mobile App Development", "Software Installation",
    "Graphic Design", "Photo & Video Editing", "Social Media Marketing", "SEO Optimization",
    "Digital Marketing", "Online Business Support", "Freelancing Guidance", "E-commerce Support",

    // Health & Wellness
    "Doctor Consultation", "Home Nurse Service", "Elderly Care", "Baby Care", "Child Care",
    "Pregnancy Care", "Personal Trainer", "Yoga Instructor", "Massage Therapy", "Physiotherapy",
    "Blood Test at Home", "Medical Equipment Rental", "Therapist Consultation",

    // Beauty & Personal Care
    "Bridal Makeup", "Men's Haircut", "Women's Haircut", "Hair Coloring", "Facial Service",
    "Manicure & Pedicure", "Henna Design", "Beard Grooming", "Home Spa Service",
    "Tattoo & Piercing", "Skincare Consultant", "Weight Loss Coaching",

    // Education & Training
    "Home Tutor", "Language Tutor", "Math Tutor", "Science Tutor", "IELTS/TOEFL Coaching",
    "Driving Instructor", "Music Teacher", "Dance Instructor", "Photography Trainer",
    "Computer Training", "Freelancing Course", "Coding Classes for Kids", "Digital Art Instructor",

    // Business & Financial Services
    "Tax Consultant", "Legal Advisor", "Accountant Service", "Business Registration",
    "Loan Assistance", "Insurance Service", "Stock Market Consultancy", "Company Auditing",
    "Office Boy Service", "Corporate Training",

    // Special Event Services
    "Wedding Planner", "Event Decoration", "Photography", "Videography", "Sound System Rental",
    "Event Hosting", "Cultural Program Management", "Corporate Event Planning", "Birthday Planning",

    // Miscellaneous Services
    "Pet Sitting", "Pet Grooming", "Pet Training", "Shoe Repair", "Laundry Ironing",
    "Courier Service", "House Shifting", "Bike Rental", "Tour Guide", "Visa Processing",
    "Passport Assistance", "Job Placement Assistance", "Water Supply Service", "Gas Stove Repair",
    "Electric Generator Rental", "Fishing Boat Rental", "Agriculture Equipment Rental",
    "Sewage System Repair", "Chimney Repair", "Construction Worker Hiring",
    "Security Guard Hiring", "Furniture Repair", "Glass Repair Service", "Umbrella Repair"
  ];



  String? selectedService;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController customServiceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Request"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Select or Type a Service",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Column(
                children: [
                  // Dropdown for selecting service
                  DropdownButton<String>(
                    value: selectedService,
                    hint: Text("Select Service Name"),
                    isExpanded: true,
                    onChanged: (newValue) {
                      setState(() {
                        selectedService = newValue;
                        customServiceController.clear();
                      });
                    },
                    items: services.map<DropdownMenuItem<String>>((String service) {
                      return DropdownMenuItem<String>(
                        value: service,
                        child: Row(
                          children: [
                            Icon(Icons.design_services, color: Colors.red),
                            SizedBox(width: 10),
                            Text(service),
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 10),

                  // "OR" Text at Center with Horizontal Lines
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  SizedBox(height: 10),

                  // TextField for typing custom service
                  TextField(
                    controller: customServiceController,
                    decoration: InputDecoration(
                      hintText: "Type your service Name",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (text) {
                      setState(() {
                        selectedService = null;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Display the chosen or typed service name
              Text(
                selectedService != null
                    ? selectedService!
                    : customServiceController.text.isNotEmpty
                    ? customServiceController.text
                    : "Service Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Description input field
              Text(
                "Describe the importance of this service",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if ((selectedService != null || customServiceController.text.isNotEmpty) &&
                        descriptionController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Service Request Submitted"),
                            content: Text(
                              "You have requested: ${selectedService ?? customServiceController.text}\nDescription: ${descriptionController.text}",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please select or type a service and provide a description."),
                        ),
                      );
                    }
                  },
                  child: Text("Submit Request"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
