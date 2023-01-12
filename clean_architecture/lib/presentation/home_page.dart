import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ServiceLocatorBlocs.instance.get<AnimalBloc>(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean architecture example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<AnimalBloc, AnimalState>(
            buildWhen: (previous, current) =>
                previous.loadingState != current.loadingState,
            builder: (context, state) {
              if (state.loadingState == AnimalLoadingState.loading) {
                return const CircularProgressIndicator();
              } else if (state.loadingState == AnimalLoadingState.loaded) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.network(
                        state.animal.photo,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Text('Sorry, no image :('),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      state.animal.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(state.animal.scientificName),
                    const SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<AnimalBloc>()
                            .add(const GetAnimalButtonPressed());
                      },
                      child: const Text(
                        'Let\'s look at another fish!',
                      ),
                    ),
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Press the button to see a fish'),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<AnimalBloc>()
                          .add(const GetAnimalButtonPressed());
                    },
                    child: const Text(
                      'Find Nemo!',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
