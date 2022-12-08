import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_not_updating/logic/cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color.fromARGB(255, 104, 92, 60),
      ),
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          final notificationSnackBar = SnackBar(
            duration: const Duration(milliseconds: 700),
            content: Text(
              'App ${state.appNotifications.toString().toUpperCase()}, E-mail ${state.emailNotifications.toString().toLowerCase()}',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(notificationSnackBar);
        },
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  SwitchListTile(
                    value: state.appNotifications,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .toggleAppNotifications(newValue);
                    },
                    title: const Text('App Notification'),
                  ),
                  SwitchListTile(
                    value: state.emailNotifications,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .toggleEmailNotifications(newValue);
                    },
                    title: const Text('E-mail Notification'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
