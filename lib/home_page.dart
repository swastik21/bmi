// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:bmi/providers.dart';
import 'package:bmi/widget/leftBar.dart';
import 'package:bmi/widget/neumorphic_input.dart';
import 'package:bmi/widget/rightbar.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightContoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    heightController.dispose();
    weightContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeumorphicInput(
                      controller: heightController,
                      hintText: "Height",
                    ),
                    NeumorphicInput(
                      controller: weightContoller,
                      hintText: "Weight",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final _isPressed = ref.watch(bmiProvider).isPressed;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade800,
                          blurRadius: 6,
                          offset: const Offset(-2, -2),
                          inset: _isPressed,
                        ),
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 6,
                          offset: const Offset(2, 2),
                          inset: _isPressed,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Listener(
                      onPointerUp: (_) => ref.read(bmiProvider).press(),
                      onPointerDown: (_) {
                        ref.read(bmiProvider).press();
                        ref.read(bmiProvider).calculate(
                            heightController.text, weightContoller.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final _bmi = ref.watch(bmiProvider).bmi;
                  return Text(
                    _bmi.toStringAsFixed(1),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 42,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final _status = ref.watch(bmiProvider).status;
                  final _statusColor = ref.watch(bmiProvider).statuscolor;
                  return Visibility(
                    visible: _status.isNotEmpty,
                    child: Text(
                      _status,
                      style: TextStyle(
                        color: _statusColor,
                        fontSize: 22,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const RightBar(rightBarWidth: 20),
              const SizedBox(
                height: 10,
              ),
              const RightBar(rightBarWidth: 50),
              const SizedBox(
                height: 10,
              ),
              const RightBar(rightBarWidth: 20),
              const SizedBox(
                height: 30,
              ),
              const LeftBar(leftBarWidth: 30),
              const SizedBox(
                height: 50,
              ),
              const LeftBar(leftBarWidth: 30)
            ],
          ),
        ),
      ),
    );
  }
}
