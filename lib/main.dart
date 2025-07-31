import 'package:flutter/material.dart';
import 'appcolors.dart';
import 'SelectInput.dart';
import 'NumberInput.dart';
import 'PasswoardInput.dart';
import 'SkeletonLoader.dart';
import 'TextInput.dart';
import 'Boolean.dart';
import 'Angular.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextInput Demo',
      theme: ThemeData(
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderGray, width: 2.0),
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle: TextStyle(color: AppColors.textGray),
          labelStyle: TextStyle(color: AppColors.labelBlack),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
  class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _selectedCountries = [];
  String _dropdown = 'choose country';
  List<String> selectedCountry = [];
  List<String> selectedValues = [];

  String _inputValue = '';
  String _name = '';
  String _passwoard = '';
  String _number = '';
  String _address = '';
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextInput Example')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              const SizedBox(height: 20),
              TextInput(
                label: 'Enter Fruit Name',
                value: _inputValue,
                onChanged: (val) => setState(() => _inputValue = val),
                placeholder: 'e.g. Apple',
                required: true,
                unit: Unit(value: 'pcs', position: UnitPosition.end),
                icon: const Icon(Icons.search),
                enabled: false,

              ),
              const SizedBox(height: 10),
              TextInput(
                label: 'Name',
                placeholder: 'Enter your name',
                icon: const Icon(Icons.person),
                onChanged: (val) => setState(() => _name = val),
                value: '',
              ),
              const SizedBox(height: 10),
              PasswordInput(
                label: 'Password *',
                placeholder: 'Enter your password',
                icon: const Icon(Icons.lock),
                value: _passwoard,
                onChanged: (val) => setState(() => _passwoard = val),
              ),

              const SizedBox(height: 10),
              NumberInput(
                label: 'Mobile Number',
                value: '',
                placeholder: 'Enter your mobile number',
                icon: const Icon(Icons.phone),
                required: true,
                maxLength: 10,
                onChanged: (val) => setState(() => _number = val),
              ),
              const SizedBox(height: 10),
              TextInput(
                label: 'Home',
                placeholder: 'Home Address',
                icon: const Icon(Icons.home),
                onChanged: (val) => setState(() => _address = val),
                value: '',
              ),
              const SizedBox(height: 10),
              SelectInput(
                label: 'Country',
                items: const ['India', 'USA', 'UK'],
                selectType: 'multi',
                selectedValues: selectedCountry,
                onChanged: (vals) => setState(() => selectedCountry = vals),
                defaultValues: const ['Select Country'],
              ),
              const SizedBox(height: 20),
              BooleanInput(
                value: value,
                selectType: 'toggleButton',
                onChanged: (val) => setState(() => value = val),
                inactiveText: 'off',
                activeText: 'on',
              ),
              const SizedBox(height: 20),
              AngularPanel(
                title: "Countries",
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("• India"),
                    Text("• USA"),
                    Text("• UK"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SkeletonLoader(
                itemCount: 1,
                baseSequence: [
                  'circle width:100 height:100',
                  'subtitle width:20% height:12',
                  'subtitle width:30% height:12',
                  'title width:40% height:20',
                  'title width:40% height:20',
                  'title width:40% height:50',
                  // 'triangle width:100 height:100'

                ],
                spacing: 20,
                isRow: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
