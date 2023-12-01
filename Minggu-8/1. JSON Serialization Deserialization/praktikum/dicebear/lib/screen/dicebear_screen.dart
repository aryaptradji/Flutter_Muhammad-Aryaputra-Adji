import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bloc/dicebear_bloc.dart';

class DiceBearScreen extends StatelessWidget {
  final _diceBearController = TextEditingController();
  DiceBearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Image Generator',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<DiceBearBloc, DiceBearState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state is DicebearInitial
                    ? const Icon(
                        Icons.image,
                        size: 48,
                      )
                    : state is DiceBearLoadingState
                        ? const CircularProgressIndicator(
                            strokeCap: StrokeCap.round,
                            strokeWidth: 5,
                          )
                        : state is DiceBearLoadedSuccess
                            ? SvgPicture.string(
                                state.diceBearImage,
                                width: 100,
                                height: 100,
                              )
                            : const Icon(
                                Icons.image,
                                size: 48,
                              ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Avatar Name',
                      hintText: 'Input your Avatar Name',
                    ),
                    controller: _diceBearController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<DiceBearBloc>().add(
                        GetDiceBearEvent(avatarName: _diceBearController.text));

                    SnackBar? snackBar;
                    if (state is DiceBearLoadedSuccess) {
                      snackBar = SnackBar(
                        content: Text(state.snackBarMessage),
                        action: SnackBarAction(
                          label: 'DISMISS',
                          onPressed: () {},
                        ),
                      );
                    } else if (state is DiceBearLoadedFailed) {
                      snackBar = SnackBar(
                        content: Text(state.messageError),
                        action: SnackBarAction(
                          label: 'DISMISS',
                          onPressed: () {},
                        ),
                      );
                    }

                    if (snackBar != null) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: state is DiceBearLoadingState
                      ? const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('GENERATE'),
                            SizedBox(width: 14),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeCap: StrokeCap.round,
                                strokeWidth: 3,
                              ),
                            ),
                          ],
                        )
                      : const Text('GENERATE'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
