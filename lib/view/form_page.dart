import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Builder Example'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                FormBuilderTextField(
                  name: "name",
                  onChanged: (value) {
                    print(value.toString());
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen Adınızı Giriniz';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Adınızı Giriniz',
                    labelText: 'Adınız',
                  ),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: "mail",
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen E-Mail Giriniz';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'E-Mail Giriniz',
                    labelText: 'E-Mailiniz',
                  ),
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: "phone",
                  //readOnly: true,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen Telefon numarası Giriniz';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: 'Telefon numaraınızı Giriniz',
                    labelText: 'Tel-No',
                  ),
                ),
                const SizedBox(height: 15),
                FormBuilderDateTimePicker(
                  name: "date",
                  inputType: InputType.date,
                  format: DateFormat("dd.MM.yyyy"),
                  decoration: const InputDecoration(
                      labelText: "Evlilik yıl dönümünüz",
                      icon: Icon(Icons.date_range)),
                  validator: (value) {
                    if (value == null) {
                      return 'Tarih Seçiniz';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                FormBuilderTextField(
                  name: "age",
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  validator: (value) {
                    if (value == null) {
                      return 'Lütfen yaşınızı Giriniz';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Yaşınızı Giriniz',
                    labelText: 'Yaşınız',
                  ),
                ),
                const SizedBox(height: 15),
                FormBuilderDropdown(
                    name: 'dropdown',
                    allowClear: true,
                    hint: const Text('Ürün seç'),
                    decoration:
                        const InputDecoration(labelText: 'Ayakkabı türleri'),
                    items: ['Adidas', 'Nike', 'Puma'].map((value) {
                      return DropdownMenuItem(
                        child: Text('$value'),
                        value: value,
                      );
                    }).toList()),
                const SizedBox(height: 15),
                FormBuilderRadioGroup(
                  name: 'gender',
                  decoration: const InputDecoration(
                      labelText: 'Cinsiyet',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                  options: const [
                    FormBuilderFieldOption(value: 'Erkek'),
                    FormBuilderFieldOption(value: 'Kadın')
                  ],
                ),
                const SizedBox(height: 15),
                FormBuilderSlider(
                  name: 'slider',
                  initialValue: 7.0,
                  min: 0.0,
                  max: 14.0,
                  divisions: 20,
                  validator: (value) {},
                  activeColor: Colors.red,
                  inactiveColor: Colors.pink[150],
                  decoration:
                      const InputDecoration(labelText: 'Bir Aralık seçiniz'),
                ),
                const SizedBox(height: 15),
                FormBuilderCheckbox(
                  name: 'accept_terms',
                  initialValue: false,
                  onChanged: (value) {},
                  title: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Şartları ve Koşulları',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: ' Okudum, onaylıyorum',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        child: const Text(
                          'Gönder',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).colorScheme.secondary,
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            print(_formKey.currentState!.value);
                          } else {
                            print('Validations hataları');
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      color: Colors.blue,
                      child: const Text(
                        'Sıfırla',
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
