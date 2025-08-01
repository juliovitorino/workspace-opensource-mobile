import 'package:flutter/material.dart';

class SyncPage extends StatelessWidget {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sincronização'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sync, color: Colors.green, size: 30),
                SizedBox(width: 8),
                Text(
                  'Sincronizando Dados...',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Celular
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.smartphone, size: 30),
                SizedBox(width: 12),
                Text('Celular'),
              ],
            ),
            const SizedBox(height: 16),

            // Flecha
            const Icon(Icons.arrow_downward, size: 24),
            const SizedBox(height: 16),

            // Internet
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.public, size: 30),
                SizedBox(width: 12),
                Text('Internet'),
              ],
            ),
            const SizedBox(height: 16),

            // Flecha
            const Icon(Icons.arrow_downward, size: 24),
            const SizedBox(height: 16),

            // Servidor
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.computer, size: 30),
                SizedBox(width: 12),
                Text('Servidor'),
              ],
            ),
            const SizedBox(height: 32),

            // Barra de progresso
            const LinearProgressIndicator(
              value: 0.45,
              minHeight: 20,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('45%', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),

            // Info
            const Text('Arquivos: 23 de 50'),
            const Text('Tempo estimado: 00:34s'),
            const SizedBox(height: 24),

            // Aguardando
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('⏳', style: TextStyle(fontSize: 24)),
                SizedBox(width: 8),
                Text(
                  'Por favor, aguarde...',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
