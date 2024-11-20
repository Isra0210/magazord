import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NoPermissionWidget extends StatelessWidget {
  const NoPermissionWidget({required this.theme, super.key});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(height: 20.0);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Para ter acesso ao clima, habilite a localização em suas configurações.',
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          spacing,
          const Icon(Icons.location_off, size: 30),
          spacing,
          TextButton(
            onPressed: () async {
              await openAppSettings();
            },
            child: Text(
              'Acessar configuração',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}